package fr.isima.webdev

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VoteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Vote.list(params), model:[voteInstanceCount: Vote.count()]
    }

    def show(Vote voteInstance) {
        respond voteInstance
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def create() {
        respond new Vote(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def save(Vote voteInstance) {
        if (voteInstance == null) {
            notFound()
            return
        }

        if (voteInstance.hasErrors()) {
            respond voteInstance.errors, view:'create'
            return
        }

        voteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vote.label', default: 'Vote'), voteInstance.id])
                redirect voteInstance
            }
            '*' { respond voteInstance, [status: CREATED] }
        }
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def edit(Vote voteInstance) {

        respond voteInstance
    }

    @Transactional
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def update(Vote voteInstance) {
        if (voteInstance == null) {
            notFound()
            return
        }

        if (voteInstance.hasErrors()) {
            respond voteInstance.errors, view:'edit'
            return
        }

        voteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Vote.label', default: 'Vote'), voteInstance.id])
                redirect voteInstance
            }
            '*'{ respond voteInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def delete(Vote voteInstance) {

        if (voteInstance == null) {
            notFound()
            return
        }

        voteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Vote.label', default: 'Vote'), voteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vote.label', default: 'Vote'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
