package fr.isima.webdev

import grails.transaction.Transactional
import jline.internal.Log
import org.xhtmlrenderer.css.parser.property.PrimitivePropertyBuilders

@Transactional
class TagService {

    def serviceMethod() {

    }

    def addTagsToQuestion(def topicId,def tagName){

        Topic itTopic = Topic.get(topicId)
        Tag.list().each {
            if(it.name == tagName){
                itTopic.addToTags(it)
                itTopic.save(flush: true)
                it.usingCount++;
                it.save(flush: true)
            }
        }
    }

    def createNewTag(def tagname,def descr){
        Tag tag = new Tag(name:tagname,
                          description:descr);
        tag.save(flush: true);
        log.error(tag.errors)
    }

}
