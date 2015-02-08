package fr.isima.webdev

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResponseController extends  MessageController{


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Response.list(params), model:[responseInstanceCount: Response.count()]
    }

    def show(Response responseInstance) {
        respond responseInstance
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def create() {
        respond new Response(params)
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    @Transactional
    def save(Response responseInstance) {
        if (responseInstance == null) {
            notFound()
            return
        }

        if (responseInstance.hasErrors()) {
            respond responseInstance.errors, view:'create'
            return
        }

        responseInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'response.label', default: 'Response'), responseInstance.id])
                redirect responseInstance
            }
            '*' { respond responseInstance, [status: CREATED] }
        }
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def edit(Response responseInstance) {
        respond responseInstance
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    @Transactional
    def update(Response responseInstance) {
        if (responseInstance == null) {
            notFound()
            return
        }

        if (responseInstance.hasErrors()) {
            respond responseInstance.errors, view:'edit'
            return
        }

        responseInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Response.label', default: 'Response'), responseInstance.id])
                redirect responseInstance
            }
            '*'{ respond responseInstance, [status: OK] }
        }
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    @Transactional
    def delete(Response responseInstance) {

        if (responseInstance == null) {
            notFound()
            return
        }

        responseInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Response.label', default: 'Response'), responseInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'response.label', default: 'Response'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
