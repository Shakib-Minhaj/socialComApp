package socialcomapp

class Comment {
    String text
    static belongsTo = [User, Post]
    User userFieldInComment
    Post postFieldInComment

    String toString(){
        return text
    }
    static mapping = {
        text sqlType: "text"
    }

    static constraints = {
        text unique: false
    }
}
