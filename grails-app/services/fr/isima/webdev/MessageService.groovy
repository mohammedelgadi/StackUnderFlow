package fr.isima.webdev

import grails.transaction.Transactional

@Transactional
class MessageService {

    def userService

    def serviceMethod() {

    }

    def addResponse(def message,def inContent){
        User user = userService.getCurrentUser()
        if( message instanceof Topic){
            Response resp = new Response(content: inContent,
            question: message,author: user)
            resp.save(flush: true)
            log.error(resp.errors)
        }else if(message instanceof Response){
            Comment comment = new Comment(content: inContent,
            author: user,response: message)
            comment.save(flush: true)
            log.error(comment.errors)
        }
    }

    def remove(def messageId){
        log.error("---"+messageId)
        Topic top = Topic.get(messageId)
        top.delete(flush: true)
        log.error(top.errors)
    }
}
