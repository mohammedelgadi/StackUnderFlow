package fr.isima.webdev

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Comment)
@Mock([Topic,Vote,User,Message,Response,Comment])
class CommentSpec extends Specification {

    User userTest
    Topic topic
    Response reponse

    def setup() {
        userTest = new User(username: 'admin', enabled: true, password: 'admin', mail: 'admin@domain.cf')
        topic = new Topic(author: userTest,title: "title",content: "content",date: new Date())
        topic.save(flush: true)
        reponse = new Response(author:userTest, content: "The content",question: topic,date: new Date())
        reponse.save(flush: true)
    }

    def cleanup() {
    }

    void "test creation comment"() {
        Comment comment = new Comment(author: userTest,
                response: reponse,date: new Date(),content: "the content")
        comment.save(flush: true)
        expect:
        assertEquals(1,Comment.getAll().size())

    }

    void "test delete comment"(){
        Comment comment = new Comment(author: userTest,
                response: reponse,date: new Date(),content: "the content")
        comment.save(flush: true)
        comment.delete(flush: true)
        expect:
        assertEquals(0,Comment.getAll().size())
    }



}
