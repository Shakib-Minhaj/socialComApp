package socialcomapp

class User {
    String name
    String email
    String password
    static hasMany = [posts: Post, comments: Comment]

    static constraints = {
        name unique: true
        email unique: true
        password blank: false
    }
}
