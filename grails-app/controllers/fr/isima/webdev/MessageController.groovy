package fr.isima.webdev

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MessageController {

    def messageService
    def voteService
    def userService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Message.list(params), model:[messageInstanceCount: Message.count()]
    }

    def show(Message messageInstance) {
        respond messageInstance
    }

    def create() {
        respond new Message(params)
    }

    @Transactional
    def save(Message messageInstance) {
        if (messageInstance == null) {
            notFound()
            return
        }

        if (messageInstance.hasErrors()) {
            respond messageInstance.errors, view:'create'
            return
        }

        messageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'message.label', default: 'Message'), messageInstance.id])
                redirect messageInstance
            }
            '*' { respond messageInstance, [status: CREATED] }
        }
    }

    def edit(Message messageInstance) {
        respond messageInstance
    }

    @Transactional
    def update(Message messageInstance) {
        if (messageInstance == null) {
            notFound()
            return
        }

        if (messageInstance.hasErrors()) {
            respond messageInstance.errors, view:'edit'
            return
        }

        messageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Message.label', default: 'Message'), messageInstance.id])
                redirect messageInstance
            }
            '*'{ respond messageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Message messageInstance) {

        if (messageInstance == null) {
            notFound()
            return
        }

        messageInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Message.label', default: 'Message'), messageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def addAnswer(){
        Message message = Message.get(params.id)
        messageService.addResponse(message,params.answer)

        if(message instanceof Topic){
            redirect(action: "showTopic", controller: "topic", id: params.id)

        }else if(message instanceof Response){
            redirect(action: "showTopic", controller: "topic", id: message.question.id)
        }

    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def vote(){
        Message message = Message.get(params.id)
        log.error("Author message :"+message.author.username)
        log.error("connected :"+userService.getCurrentUser().username)
        voteService.vote(message)
        //redirect(action: "show", controller: "topic", model: ['topicInstance':message],id: message.id)
        if (message instanceof Topic){
            redirect(action: "showTopic", controller: "topic", model: ['topicInstance':message],id: message.id)
        }else if(message instanceof  Response){
            //def idTopic = ((Response)message)
            redirect(action: "showTopic", controller: "topic", model: ['topicInstance':message],id: message.question.id)
        }


    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def devote(){
        Message message = Message.get(params.id)
        voteService.devote(message)
        //render(view: "show",model: ['topicInstance':message])
        if (message instanceof Topic){
            redirect(action: "showTopic", controller: "topic", model: ['topicInstance':message],id: message.id)
        }else if(message instanceof  Response){
            //def idTopic = ((Response)message)
            redirect(action: "showTopic", controller: "topic", model: ['topicInstance':message],id: message.question.id)
        }

    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def removeMessage(){
        log.error('je suis dans removeMessage')
        messageService.remove(params.id)

    }


}
