package fr.isima.webdev

import grails.transaction.Transactional

@Transactional
class UserService {

    def springSecurityService

    def serviceMethod() {
    }


    User getCurrentUser(){
        return (User)springSecurityService.currentUser
    }

    @Transactional(readOnly = true)
    def splitedListe(){
        User.list().collate(4)
    }
    @Transactional(readOnly = true)
    User getTheBestUser(){
        def users = User.findAllByScoreIsNotNull(sort: "score", order: "desc")
        if(users.size() != 0 && users.get(0).score > 0){
            return users.get(0);
        }

        return  null;
    }
}
