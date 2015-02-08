package fr.isima.webdev

import grails.transaction.Transactional
import jline.internal.Log
import org.xhtmlrenderer.css.parser.property.PrimitivePropertyBuilders

@Transactional
class TopicService extends  MessageController{

    def springSecurityService
    def tagService
    def userService

    def serviceMethod() {


    }



    def createTopic(String title, String content,def listTags){

        Topic topic = new Topic(title : title,
                content: content,
                author: userService.currentUser)
        topic.save(flush: true)
        listTags.each {
            tagService.addTagsToQuestion(topic.id,it)
        }
        return topic.id
    }

    boolean updateTopic(Topic topic,String title , String content){


        if(title != null && content != null ){
            try{
                topic.content = content
                topic.title   = title
                topic.save(flush:true)
            }catch (Exception catchedException){
                log.error(catchedException)
                return  false
            }
            return true
        }
        return false

    }


    def addView(Long id){
        Topic topic = Topic.get(id)
        if(userService.getCurrentUser() != topic.author){
            topic.nmbreViews ++
            topic.save(flush: true)
        }
    }

    int countTopics(){
        return Topic.count()
    }



    def listTopic(){
        return Topic.list()
    }

    def listRecentQuestions(){
        return Topic.list(sort: "date",order: "desc")
    }

    def listUnansweredQuestions(){
        return Topic.withCriteria {
            isEmpty("responses")
        }
    }

    def listMustViewedQuestions(){
        return Topic.list(sort: "nmbreViews",order: "desc").grep({
            it.nmbreViews > 0
        }).toList()
    }

    def mustViewedQuestion(){
        def listViewedQuestions = Topic.list(sort: "nmbreViews",order: "desc")
        if(listViewedQuestions != null)
            return listViewedQuestions.get(0)
        return null
    }

    def listBestQuestions(){
        return Topic.list(sort: "score",order: "desc").grep({
            it.score > 0
        }).toList()
    }

    Topic theBestQuestion(){
        def lisTopics = Topic.list(sort: "score",order: "desc")
        if(lisTopics != null){
            return lisTopics.get(0)
        }
        return null;
    }


    def getTopicById(int inId) {
        return Topic.get(inId)
    }

    def listTags(Topic inTopic) {
        def tags = inTopic.tags.toList()
        return tags
    }

    def viewTopic(int topicId){

        Topic topic = Topic.get(topicId)
        if(topic.author != userService.getCurrentUser()){
            topic.nmbreViews ++
            topic.save(flush: true)
        }

    }


}
