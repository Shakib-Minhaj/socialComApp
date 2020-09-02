<%--
  Created by IntelliJ IDEA.
  User: shakib
  Date: 8/25/2020
  Time: 5:33 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Post with Comment</title>
    <script
            src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
    <style>
    body {
        background-color: #A6B9E1;
        text-align: center;
        color: black;
        font-family: Aerial;
    }
    #userNameLabel{
        font-weight: bold;
        Float: left;
        border: none;
        margin-left: 5px;

    }
    #userName{
        font-weight: bold;
        Float: left;
        border: none;
        margin-left: 5px;
    }
    #contentText{
        background-color: #698DC4;
        text-align: justify;
        line-height: 120%;
        margin-left: 20px;
        padding: 5px;
        border-radius: 4px;
    }
    #cmtTxt{
        background-color: #698DC4;
        text-align: justify;
        line-height: 120%;
        margin-left: 20px;
        padding: 5px;
        border-radius: 4px;
    }
    #scroll{
        margin-right: 10px;
    }

    #name{
        border-radius: 4px;
        padding-top: 5px;
        padding-bottom:5px;
        padding-left: 2px;
        padding-right: 2px;
        margin-left: 5px;
        margin-right: 20px;
        margin-bottom: 1px;
        width: 100%

    }
    #h1{
        background-color: #1C2351;
        color: white;
        border: none;
        border-radius: 4px;
        padding-left: 40px;
        padding-right: 40px;
        margin-bottom: 10px;


    }
    #divContent{
        background-color: #8BA1B1;
        border-radius: 4px;
    }
    #commentDiv{
        margin-right: 20px;
    }
    #button{
        background-color: #4CAF50;
        color: white;
        padding: 5px 12px;
        margin: 8px 0px 0px 5px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        float: left;
    }
    #showCmt{
        background-color: #8BA1B1;
        border-radius: 4px;
    }

    </style>
    <script>
        $(document).ready(function(){
            $( "#scroll" ).scroll();
        });
    </script>
</head>

<body>
<button id="h1"><h1>Post</h1></button><br>
<div id="scroll">
    <div id="divContent">
        <label id="userNameLabel" name="userNameLabel">${poster_name.userFieldInPost.name}</label><br>
        <p id="contentText" name="contentText">${poster_name.content}</p>
    </div>
    <br><br>

    <div id="commentDiv">
        <input name = "name" value = "" id = "name" placeholder="Write comment.."/><br>
        <button id = "button" name = "button" onClick="commentAjax()">Comment</button>
        <br><br>
    </div>

    <div id="showCmt">
        <g:each in = "${fetched_value}" status = "i" var = "val">
                <label id="userName" name="userNameLabel">${val.userFieldInComment.name}</label><br>
                <p id="cmtTxt" name="contentText">${val.text}</p>
        </g:each>
    </div>
</div>

</body>
<script>
    var userName = "${user_name}";
    var postId = "${post_id}";

    function commentAjax() {
        $(document).ready(function() {
            var text = $('#name').val();
            var user_name = userName;
            var post__id = postId;

            if(text == "") {
                alert('Your comment is blank.');
                return false;
            }


            var URL="${createLink(controller:'Sync',action:'comment')}"

            $.ajax({
                url: URL,
                type: "POST",
                datatype: "html",
                data:{text:text, user_name:user_name, post_id:post__id},
                success:function(data)
                {
                    alert(data);
                }
            });

        });
    }
</script>
</html>