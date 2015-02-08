package fr.isima.webdev




class Badge {



        public static final int GRADE = 0                //("User grades"),
        public static final int SCORE = 1              //("User posts and answers"),
        public static final int CATEGORY    = 2            //("User type"),
        public static final int GOLD = 3               //("USer best posts")

    public enum DefinedBadge{
        GOLD_USER("the user was the best","GOLD_USER",GOLD),
        GOLD_ANSWERS("had the best topic in the past (the higher topic scored)","GOLD_ANSWERS",GOLD),
        GOLD_QUESTIONNAR("had the best question (the higher score)","GOLD_QUESTIONNAR",GOLD),
        GOLD_VIEWED_TOPIC("User had the must viewed question","GOLD_VIEWED_TOPIC",GOLD),
        EXPERT("had score higher than 400","EXPERT",GRADE),
        PROFESSIONAL("had score higher than 200","PROFESSIONAL",GRADE),
        STUDENT("number of topics higher than responses","STUDENT",CATEGORY),
        GOOD_STUDENT("student score higher than 10","GOOD_STUDENT",CATEGORY),
        BAD_STUDENT("had score lower than  -10","BAD_STUDENT",CATEGORY),
        TEACHER("number of responses higher than topics","TEACHER",CATEGORY),
        BAD_TEACHER("teacher score lower than -10","BAD_TEACHER",CATEGORY),
        GOOD_TEACHER("teacher score higher than 10","GOOD_TEACHER",CATEGORY),
        BAD_USER("user score lower than -100","BAD_USER",SCORE),
        IN_BLACK_LIST("user in black list having score lower than -200","IN_BLACK_LIST",SCORE),
        NOT_TRUSTED("user had score lower than -500","IN_BLACK_LIST",SCORE)
        String engDescription;
        String frDescription;
        String title;
        int category

        public DefinedBadge(){

        }

        public DefinedBadge(String name,String title,int categoryBadge){
            this.engDescription = name
            frDescription = name
            this.title = title
            this.category = categoryBadge;
        }



    }


    DefinedBadge badge;

    static constraints = {

    }

    static hasMany = User
}
