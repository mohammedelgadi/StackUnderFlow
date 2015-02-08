package fr.isima.webdev

class Comment extends Message {


    int         nbrViewed


    static belongsTo = [response : Response]

    static constraints = {
    }

    def String toString() {
        content
    }
}
