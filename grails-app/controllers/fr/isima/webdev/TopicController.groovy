package fr.isima.webdev

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException
import grails.plugin.springsecurity.annotation.Secured
import jline.internal.Log

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicController {

    def springSecurityService
    def topicService
    def tagService
    def userService
    def voteService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]



    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Topic.list(params), model:[topicInstanceCount: Topic.count(),tags:Tag.getAll()]
    }


    def showByTag(){
        Tag tag = Tag.get(params.id)
        def topicList = tag.taggedTopics
        if(topicList.size() != 0){
            render view: "index",model:[topicInstanceList:topicList,tags: Tag.getAll()]

        }else{
            render view: "notFound"
        }

    }

    def show(Topic topicInstance) {
        User connectedUser = userService.getCurrentUser()

        topicService.addView(topicInstance.id)
        render(view: "show",model:[topicInstance:topicInstance,connectedUser : connectedUser])
    }


    def showTopic(Topic topicInstance){
        //respond topicInstance
        User connectedUser = userService.getCurrentUser()
        render(view: "show",model:[topicInstance:topicInstance,connectedUser : connectedUser])
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def create() {
        List<Tag> listTags = Tag.getAll()
        render(view: "create",model: ['listTags' : listTags])
        respond new Topic(params)
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    @Transactional
    def save(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view:'create'
            return
        }

        topicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*' { respond topicInstance, [status: CREATED] }
        }
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def edit(Topic topicInstance) {


        User user = userService.getCurrentUser()
        if(topicInstance.author == user){
            respond topicInstance
        }else{
            redirect action: "show", method: "GET", id: topicInstance.id
        }


    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    @Transactional
    def update() {

    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    @Transactional
    def delete(Topic topicInstance) {

        if (topicInstance == null) {
            notFound()
            return
        }
        topicInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def createTopic(){
        if(params.title == null || params.title =='' ||
                params.content == null || params.content == ''){
            redirect action: 'create'
        }else{
            def listTags = params.list('selectedValues')
            int theid = topicService.createTopic(params.title,params.content,listTags)
            redirect action: "show", method: "GET", id: theid
        }



            //redirect( action: "create",method: "POST")



    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def updateTopic(){
        Topic topic = Topic.get(params.idTopic)
        boolean saved = topicService.updateTopic(topic,params.title,params.content)
        if(saved){
            redirect(action: "show", id: topic.id, params: [Topic : topic])
        }else{
            redirect action: "edit", id: topic.id, params: [Topic : topic]
        }
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def addTag(){
        if(params.tagname != null && params.description != null){

            tagService.createNewTag(params.tagname,params.description)
        }
        Topic topicInstance = new Topic(content: params.content,
                title: params.title,author: userService.getCurrentUser())

        //def listTags = params.list('selectedValues')
        def listTags = Tag.getAll()
        //redirect(action: "create",params: [Topic: topicInstance,def: listTags ])
        render(view: "create",model: ['listTags' : listTags,'topicInstance':topicInstance])

    }




}
