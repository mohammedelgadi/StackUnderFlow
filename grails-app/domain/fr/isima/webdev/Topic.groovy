package fr.isima.webdev


class Topic extends Message {


    int nmbreViews = 0
    String title

    static hasMany = [responses : Response,tags : Tag]


    static constraints = {

    }

    static mapping = {
        responses sort: "score",order: "desc"
        sort date: "desc"
    }

    void vote(){

    }
}
