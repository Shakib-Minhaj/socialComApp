package socialcomapp

class SyncController {

    def user_name = "Default"
    def post_id = "Default"

    def index() {

    }

    def signUp() {

    }

    def postOnly() {
        //render(view:'postOnly',model: [])

        def fetched_value = Post.list()
        render(view:'postOnly',model: [fetched_value:fetched_value, user_name:user_name])

    }


    def commentReady() {
        post_id = params.post_id
        //nameVal = params.user_name
        //postVal = params.content
    }

    def login() {
        def nameValue = params.name
        def passValue = params.password
        def user = User.findAllByNameAndPassword(nameValue, passValue)

        //Check if the name exists in database
        if(user.name != null) {
            user_name = "${user.name[0]}"
            render user_name
            //redirect(action: 'postOnly')
        } else {
            render "null"
        }
    }

    //Get ajax req from signUp.gsp
    def register(){
        User value = new User(params)

        //Validate fetched db values
        if(!value.validate()) {
            render "Name already taken"
        }
        else {
            User create_user = new User(params)
            create_user.save()
            render "User added successfully"
        }
    }

    def post() {
        def postContent = params.content
        def posterName = params.user_name
        def userFetch = User.findAllByName(posterName)
        def userId = userFetch.id
        User userObj = User.get(userId)
        Post newPost = new Post(userFieldInPost:userObj, content:postContent)
        if(!newPost.validate()) {
            render "Problem saving post"
        }
        else {
            Post create_post = new Post(userFieldInPost:userObj, content:postContent)
            create_post.save()
            render "Post saved successfully"
        }
    }

    def comment() {
        def cmTxt = params.text
        def cmUser = params.user_name
        def postId = params.post_id
        def userFetch = User.findAllByName(cmUser)
        def userId = userFetch.id
        User userObj = User.get(userId)
        def postFetch = Post.findAllById(postId)
        def realId = postFetch.id
        Post postObj = Post.get(realId)

        Comment newCmt = new Comment(userFieldInComment:userObj, postFieldInComment:postObj, text:cmTxt)
        if(!newCmt.validate()) {
            render "Problem saving Comment"
        }
        else {
            def create_comment = new Comment(userFieldInComment:userObj, postFieldInComment:postObj, text:cmTxt)
            create_comment.save()
            render "Comment saved successfully."
        }

    }

    def withComment() {
        //render(view:'withComment',model: [user_name:user_name])
        //render(view:'withComment',model: [])
        def post = Post.findAllById(post_id)
        def postId = post.id
        Post postObj = Post.get(postId)
        //def poster = "${post.userFieldInPost[0]}"
        //def content = "${post.content[0]}"
        //render(view:'withComment', model: [poster_name:poster, content:content, user_name:user_name, post_id:post_id])

        def fetched_value = Comment.findAllByPostFieldInComment(postObj)
        render(view:'withComment',model: [fetched_value:fetched_value, poster_name:postObj, user_name:user_name, post_id:post_id])
    }
}
