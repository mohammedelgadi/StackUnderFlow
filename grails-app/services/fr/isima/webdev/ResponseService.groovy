package fr.isima.webdev

import grails.transaction.Transactional
import org.aspectj.weaver.patterns.TypePatternQuestions

@Transactional
class ResponseService  extends  MessageService{


    def serviceMethod() {

    }



    Response theBestResponse(){
        def listResponse = Response.list(sort: "score",order: "desc")
        if (listResponse != null && !listResponse.isEmpty()){
            return listResponse.get(0)
        }
        return null
    }



}
