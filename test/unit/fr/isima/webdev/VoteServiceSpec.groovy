package fr.isima.webdev

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import groovy.mock.interceptor.MockFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(VoteService)
@Mock([Topic,Vote,User,Message])
class VoteServiceSpec extends Specification {

    User userTest


    def setup() {
        userTest = new User(username: 'admin', enabled: true, password: 'admin', mail: 'admin@domain.cf')
        userTest.score = 200
        userTest.save()
    }

    def cleanup() {
    }

    void "test vote up"() {
        def voteService
        Topic topic = new Topic(author: userTest,title: "title",content: "content",date: new Date())
        topic.save(flush: true)
        service.vote(topic)
        expect:
        assertEquals(205,userTest.score)
    }

    void "test vote down"() {
        def voteService
        Topic topic = new Topic(author: userTest,title: "title",content: "content",date: new Date())
        topic.save(flush: true)
        service.devote(topic)
        expect:
        assertEquals(195,userTest.score)
    }

   void "test of non repetition down"() {
        def voteService
        Topic topic = new Topic(author: userTest,title: "title",content: "content",date: new Date())
        topic.save(flush: true)
        service.devote(topic)
        service.devote(topic)
        expect:
        assertEquals(195,userTest.score)
        assertFalse(190 == userTest.score)
    }

    void "test of non repetition up"() {
        def voteService
        Topic topic = new Topic(author: userTest,title: "title",content: "content",date: new Date())
        topic.save(flush: true)
        service.vote(topic)
        service.vote(topic)
        expect:
        assertEquals(205,userTest.score)
        assertFalse(210 == userTest.score)
        assertTrue(1 == topic.score)
    }

    void "test of vote after devote"() {
        def voteService
        Topic topic = new Topic(author: userTest,title: "title",content: "content",date: new Date())
        topic.save(flush: true)
        service.vote(topic)
        service.devote(topic)
        expect:
        assertEquals(200,userTest.score)
        assertTrue(0 == topic.score)
    }

 
}
