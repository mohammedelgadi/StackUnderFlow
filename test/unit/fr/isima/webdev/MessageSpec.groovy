package fr.isima.webdev

import grails.test.mixin.TestFor
import spock.lang.Specification
import grails.test.mixin.Mock

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Message)
@Mock([Topic,Vote,User,Message,Response,Comment])

class MessageSpec extends Specification {

	User userTest

    def setup() {
        userTest = new User(username: 'admin', enabled: true, password: 'admin', mail: 'admin@domain.cf')
    }

    def cleanup() {
    }

    void "test heritage"() {
    	Message topic = new Topic(author: userTest,title: "title",content: "content",date: new Date())
        topic.save()
        Message reponse = new Response(author:userTest, content: "The content",question: topic,date: new Date())
        reponse.save(flush: true)
         Comment comment = new Comment(author: userTest,
                response: reponse,date: new Date(),content: "the content")
         comment.save()
        expect:
        assertEquals(1,Response.getAll().size())
        assertEquals(1,Topic.getAll().size())
        assertEquals(1,Comment.getAll().size())
    }
}
