package socialcomapp

class Post {
    String content
    static belongsTo = User
    static hasMany = [comments: Comment]
    User userFieldInPost

    static mapping = {
        content sqlType: "text"
    }

    static constraints = {
        content unique: false
    }
}
