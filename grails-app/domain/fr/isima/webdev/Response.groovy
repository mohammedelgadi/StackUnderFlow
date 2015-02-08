package fr.isima.webdev

class Response extends Message{


    boolean         isAccepted = false
    boolean         isTheBest  = false

    static constraints = {
    }

    static belongsTo = [question:Topic]

    static  hasMany = [comments : Comment]


    def String toString() {
        content
    }

    static mapping = {
        sort score: "desc"
    }
}
