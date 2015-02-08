package fr.isima.webdev

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Topic)
@Mock([Topic,Vote,User,Message])
class TopicSpec extends Specification {



    def setup() {
    }

    def cleanup() {
    }

    void "test topic creation"() {
        Topic topic = new Topic(author: User.get(0),title: "title",content: "content",date: new Date())
        topic.save()
        expect:
        assertEquals(1,Topic.getAll().size())
        Topic topic2 = new Topic(author: User.get(0),title: "title",content: "content",date: new Date())
        topic2.save()
        assertEquals(2,Topic.getAll().size())
    }

    void "Delete topic test"(){
        Topic topic = new Topic(author: User.get(0),title: "title",content: "content",date: new Date())
        topic.save()
        expect:
        assertEquals(1,Topic.getAll().size())
        topic.delete()
        assertEquals(0,Topic.getAll().size())
    }

    void "Update topic test"(){
        // first title of creation
        String titleTested = "The title to test"
        Topic topic = new Topic(author: User.get(0),title: titleTested,content: "content",date: new Date())
        topic.save()
        Topic edTopic = Topic.get(topic.id)
        expect:
        assertEquals(titleTested,edTopic.title)
        // first title of updating
        String newTitle = "The new title to test"
        edTopic.setTitle(newTitle)
        edTopic.save(flush: true)
        Topic theTopic = Topic.get(topic.id)
        assertEquals(newTitle,theTopic.title)
    }

    void "Test data validity"(){

        String theContent = "The content of the question"

        Topic topic = new Topic(author: User.get(0),title: "title",content: theContent,date: new Date())
        topic.save(flush: true)
        expect:
        assertEquals("title",Topic.getAll().get(0).title)
        assertEquals(theContent,Topic.getAll().get(0).content)
    }
}
