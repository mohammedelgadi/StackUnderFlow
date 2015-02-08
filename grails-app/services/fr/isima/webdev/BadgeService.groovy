package fr.isima.webdev

import grails.transaction.Transactional
import org.xhtmlrenderer.css.parser.property.PrimitivePropertyBuilders

@Transactional
class BadgeService {

    def userService
    def topicService
    def responseService


    def serviceMethod() {

    }

    def affectScoreBadges(User user){
        if(user.score >= 1){
            if(!user.hasBadge(Badge.DefinedBadge.PROFESSIONAL)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.PROFESSIONAL))
                user.save(flush: true)
            }
        }

        if(user.score >= 2){
            if(!user.hasBadge(Badge.DefinedBadge.EXPERT)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.EXPERT))
                user.save(flush: true)
            }
        }

        if(user.score <= -1){
            if(!user.hasBadge(Badge.DefinedBadge.BAD_USER)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.BAD_USER))
                user.save(flush: true)
            }
        }

        if(user.score <= -2){
            if(!user.hasBadge(Badge.DefinedBadge.IN_BLACK_LIST)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.IN_BLACK_LIST))
                user.save(flush: true)
            }
        }

        if(user.score <= -10){
            if(!user.hasBadge(Badge.DefinedBadge.NOT_TRUSTED)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.NOT_TRUSTED))
                user.save(flush: true)
            }
        }
    }


    def affectTypeBadges(User user){

        if (user.numberOfQuestions() <= 1 || user.numberOfResponses() <=1)
            return null

        if(user.numberOfQuestions() >= user.numberOfResponses()){
            if(!user.badges.contains(Badge.DefinedBadge.STUDENT)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.STUDENT))
                user.save(flush: true)
            }
        }

        if(user.numberOfQuestions() >= user.numberOfResponses() && user.score >= 10){
            if(!user.badges.contains(Badge.DefinedBadge.GOOD_STUDENT)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.GOOD_STUDENT))
                user.save(flush: true)
            }
        }

        if(user.numberOfQuestions() >= user.numberOfResponses() && user.score <= -10){
            if(!user.badges.contains(Badge.DefinedBadge.BAD_STUDENT)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.BAD_STUDENT))
                user.save(flush: true)
            }
        }

        if(user.numberOfResponses() <= user.numberOfQuestions() ){
            if(!user.badges.contains(Badge.DefinedBadge.TEACHER)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.TEACHER))
                user.save(flush: true)
            }
        }
        if(user.numberOfResponses() <= user.numberOfQuestions() && user.score >= 10 ){
            if(!user.badges.contains(Badge.DefinedBadge.GOOD_TEACHER)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.GOOD_TEACHER))
                user.save(flush: true)
            }
        }
        if(user.numberOfResponses() <= user.numberOfQuestions() && user.score <= -10 ){
            if(!user.badges.contains(Badge.DefinedBadge.BAD_TEACHER)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.BAD_TEACHER))
                user.save(flush: true)
            }
        }
    }

    def affectGoldBadges(User user){

        if(userService.getTheBestUser()!= null && user.id == userService.getTheBestUser().id){
            if(!user.hasBadge(Badge.DefinedBadge.GOLD_USER)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.GOLD_USER))
                user.save(flush: true)
            }
        }

        Topic top = topicService.theBestQuestion();
        if(top != null && top.author.id == user.id){
            if(!user.hasBadge(Badge.DefinedBadge.GOLD_QUESTIONNAR)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.GOLD_QUESTIONNAR))
                user.save(flush: true)
            }
        }

        Response rep = responseService.theBestResponse()

        if(rep != null && rep.author.id == user.id){
            if(!user.hasBadge(Badge.DefinedBadge.GOLD_ANSWERS)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.GOLD_ANSWERS))
                user.save(flush: true)
            }
        }

        Topic mustViewedTopic = topicService.mustViewedQuestion()
        if(mustViewedTopic != null && mustViewedTopic.author.id == user.id){
            if(!user.hasBadge(Badge.DefinedBadge.GOLD_VIEWED_TOPIC)){
                user.addToBadges(new Badge(badge: Badge.DefinedBadge.GOLD_VIEWED_TOPIC))
                user.save(flush: true)
            }
        }


    }


    def removeScoreBadges(User user){
        if(user.score < 1){
            if(user.hasBadge(Badge.DefinedBadge.PROFESSIONAL)){
                Badge badge
                user.badges.each {
                    if(it.badge == Badge.DefinedBadge.PROFESSIONAL){
                        badge = it
                    }
                }
                user.removeFromBadges(badge);
                user.save(flush: true)
            }
        }

        if(user.score < 2){
            if(user.hasBadge(Badge.DefinedBadge.EXPERT)){
                Badge badge
                user.badges.each {
                    if(it.badge == Badge.DefinedBadge.EXPERT){
                        badge = it
                    }
                }
                user.removeFromBadges(badge);
                user.save(flush: true)
            }
        }

        if(user.score > -1){
            if(user.hasBadge(Badge.DefinedBadge.BAD_USER)){
                Badge badge
                user.badges.each {
                    if(it.badge == Badge.DefinedBadge.BAD_USER){
                        badge = it
                    }
                }
                user.removeFromBadges(badge);
                user.save(flush: true)
            }
        }

        if(user.score > -2){
            if(user.hasBadge(Badge.DefinedBadge.IN_BLACK_LIST)){
                Badge badge
                user.badges.each {
                    if(it.badge == Badge.DefinedBadge.IN_BLACK_LIST){
                        badge = it
                    }
                }
                user.removeFromBadges(badge);
                user.save(flush: true)
            }
        }

        if(user.score > -10){
            if(user.hasBadge(Badge.DefinedBadge.NOT_TRUSTED)){
                Badge badge
                user.badges.each {
                    if(it.badge == Badge.DefinedBadge.NOT_TRUSTED){
                        badge = it
                    }
                }
                user.removeFromBadges(badge);
                user.save(flush: true)
            }
        }
    }



}
