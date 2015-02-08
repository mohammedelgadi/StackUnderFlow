package fr.isima.webdev

import grails.plugin.springsecurity.annotation.Secured
import jline.internal.Log
import sun.misc.BASE64Encoder

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {
    UserService userService

    def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET","POST","PUT"]]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        List<List<User>> list= userService.splitedListe()


        [userlist:list]
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def show(User userInstance) {
        def user = springSecurityService.getCurrentUser()


        render (view :"show",model: [user:user , userInstance:userInstance] )
    }





    def create() {
        respond new User(params)
    }

    @Transactional

    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        if( userInstance.photoProfile.length == 0) userInstance.photoProfile= null

        userInstance.save flush:true
        UserRole.create userInstance,Role.findByAuthority('ROLE_USER'),true


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def edit(User userInstance) {
        def user = springSecurityService.currentUser

        render (view :"edit",model: [user:user , userInstance:userInstance] )
    }


    @Secured(['ROLE_ADMIN','ROLE_USER'])
    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        if( userInstance.photoProfile.length == 0) userInstance.photoProfile= null

        userInstance.save flush:true
        redirect controller: 'user', action: 'show', id: userInstance.id
    }

    @Transactional
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def delete(User userInstance) {


        if (userInstance == null ) {
            notFound()
            return
        }
        UserRole.findByUser(userInstance).delete flush: true
        userInstance.delete flush:true
        redirect action: "index", controller: "user"

    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
