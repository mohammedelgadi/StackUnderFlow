package fr.isima.webdev

import groovy.beans.Bindable

class Message {

    String content
    Date   date = new Date()
    int score = 0



    static constraints = {
        author bindable : false,nullable: true
    }

    //static hasMany = [comments : Comment,votes : Vote]

    static hasMany = [votes : Vote]

    static belongsTo = [author: User]


    static mapping = {
        //comments sort: "date", order: "asc"
    }
}
