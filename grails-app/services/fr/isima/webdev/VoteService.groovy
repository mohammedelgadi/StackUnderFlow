package fr.isima.webdev

import grails.transaction.Transactional
import groovy.util.logging.Log

@Transactional
class VoteService {

    def userService
    def badgeService

    def serviceMethod() {

    }


    def vote(Message message){

        User user
        if(userService == null)
        {    
            user = message.author
        }
        else
        {
             user = userService.currentUser
             if(message.author == user)
             return
        }
        Vote vote = Vote.findByAuthorAndMessage(user,message)
        if(vote == null){
            Vote v = new Vote(date: new Date(),
                    author: user,
                    message: message,
                    type: Vote.Type.UP)
            v.message.score ++
            v.message.author.score += 5
            v.message.author.save(failOnError: true)
            v.message.save(flush: true)
            v.save(flush: true)
        }else if(vote.type == Vote.Type.DOWN){
            vote.message.author.score += 5
            vote.message.score ++
            vote.message.save(flush: true)
            vote.message.author.save(flush: true)
            vote.delete(flush: true)
        }
        if(badgeService != null){
            badgeService.affectScoreBadges(message.author)
            badgeService.affectGoldBadges(message.author)
            badgeService.affectTypeBadges(message.author)
        }

    }

    def devote(Message message){
        User user
        if(userService == null)
        {    
            user = message.author
        }
        else
        {
             user = userService.currentUser
            if(message.author == user)
            return
        }
    
        Vote vote = Vote.findByAuthorAndMessage(user,message)
        if(vote == null){
            Vote v = new Vote(date:new Date(),
                    author: user,
                    message: message,
                    type: Vote.Type.DOWN)
            v.message.score --
            v.message.author.score -= 5
            v.message.author.save(flush: true)
            v.message.save(flush: true)
            v.save(flush: true)
        }else if(vote.type == Vote.Type.UP){
            vote.message.author.score -= 5
            vote.message.score --
            vote.message.save(flush: true)
            vote.message.author.save(flush: true)
            vote.delete(flush: true)
            if(badgeService != null)
            badgeService.removeScoreBadges(message.author)
        }

       if(badgeService != null){
                badgeService.affectScoreBadges(message.author)
                badgeService.affectGoldBadges(message.author)
                badgeService.affectTypeBadges(message.author)
        }


    }




}
