package fr.isima.webdev

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Response)
@Mock([Topic,Vote,User,Message])

class ResponseSpec extends Specification {

    User userTest

    def setup() {
        userTest = new User(username: 'admin', enabled: true, password: 'admin', mail: 'admin@domain.cf')

    }

    def cleanup() {
    }


    void "test creation"() {

        Topic topic = new Topic(author: userTest,title: "title",content: "content",date: new Date())
        topic.save(flush: true)
        Response reponse = new Response(author:userTest, content: "The content",question: topic,date: new Date())
        reponse.save(flush: true)
        topic = Topic.get(topic.id)
        expect:
        assertEquals(1,Topic.getAll().size())
        assertEquals(1,Response.getAll().size())
        assertEquals(topic,Response.get(reponse.id).question)
    }

    void "test Update Response"(){

        String content = "this is the new title"

        Topic topic = new Topic(author: userTest,title: "title",content: "content",date: new Date())
        topic.save(flush: true)
        Response reponse = new Response(author:userTest, content: "The content",question: topic,date: new Date())
        reponse.save(flush: true)

        Response updatingResp =  Response.get(reponse.id)
        updatingResp.content = content
        updatingResp.save(flush: true)
        expect:
        assertEquals(updatingResp.content,content)
    }

    void "Delete test"() {

        Topic topic = new Topic(author: userTest,title: "title",content: "content",date: new Date())
        topic.save(flush: true)
        Response reponse = new Response(author:userTest, content: "The content",question: topic,date: new Date())
        reponse.save(flush: true)
        reponse.delete(flush: true)
        expect:
        assertEquals(0,Response.getAll().size())
    }
}
