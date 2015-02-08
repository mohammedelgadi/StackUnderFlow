package fr.isima.webdev

import grails.plugin.springsecurity.annotation.Secured
import jline.internal.Log


class IndexController {

    def topicService
    def userService
    def badgeService


    def index() {
        def listRecentTopics = topicService.listRecentQuestions()
        def listMustViewed = topicService.listMustViewedQuestions()
        def listUnuswered = topicService.listUnansweredQuestions()
        def listBestTopics = topicService.listBestQuestions()
        def listTags    = Tag.getAll()
        def theBest     = userService.getTheBestUser()
        [recents:listRecentTopics,viewed:listMustViewed,unuswered:listUnuswered,
         bests:listBestTopics,tags:listTags,currentUser:userService.currentUser,theBestUser:theBest]
    }
}
