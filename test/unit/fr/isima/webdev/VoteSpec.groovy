package fr.isima.webdev

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(Vote)
@Mock([Topic,Vote,User,Message])
class VoteSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test vote creation"() {
        User testUser = new User(username: 'admin', enabled: true, password: 'admin', mail: 'admin@domain.cf')
        testUser.save(flush: true)
        Topic topic = new Topic(author: testUser,title: "title",content: "content",date: new Date())
        topic.save()
        Vote vote = new Vote(date: new Date(),author:testUser,message: topic,type: Vote.Type.DOWN)
        vote.save(flush: true)
		expect:
        assertEquals(1,Topic.getAll().size())
        assertEquals(1,Vote.getAll().size())
    }

    void "test vote suppression"() {
        User testUser = new User(username: 'admin', enabled: true, password: 'admin', mail: 'admin@domain.cf')
        testUser.save(flush: true)
        Topic topic = new Topic(author: testUser,title: "title",content: "content",date: new Date())
        topic.save()
        Vote vote = new Vote(date: new Date(),author:testUser,message: topic,type: Vote.Type.DOWN)
        vote.save(flush: true)
        expect:
        assertEquals(1,Topic.getAll().size())
        Vote votGetted = Vote.get(vote.id)
        votGetted.delete(flush: true)
        assertEquals(0,Vote.getAll().size())
    }

    void "test updating vote"(){
        User testUser = new User(username: 'admin', enabled: true, password: 'admin', mail: 'admin@domain.cf')
        testUser.save(flush: true)
        Topic topic = new Topic(author: testUser,title: "title",content: "content",date: new Date())
        topic.save()
        Vote vote = new Vote(date: new Date(),author:testUser,message: topic,type: Vote.Type.DOWN)
        vote.save(flush: true)
    }
}
