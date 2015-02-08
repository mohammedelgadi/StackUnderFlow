package fr.isima.webdev

class Vote {


    enum Type{
        UP,
        DOWN
    }

    User author
    Message message

    Type type
    Date date
    static belongsTo = [author : User , message : Message]
    static constraints = {
    }
}
