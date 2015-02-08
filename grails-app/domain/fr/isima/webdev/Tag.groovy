package fr.isima.webdev

class Tag {

    String name
    String description

    int usingCount

    static constraints = {
        name unique:true
        name maxSize: 25,blank: false
        description nullable: true
    }

    static hasMany = [taggedTopics:Topic]
    static belongsTo = Topic

    def String toString() {
        name
    }

    def getUsingCount(){
        if(taggedTopics != null && !taggedTopics.isEmpty()){
            return taggedTopics.size()
        }
        return 0;
    }
}
