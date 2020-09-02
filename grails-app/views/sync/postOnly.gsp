<%--
  Created by IntelliJ IDEA.
  User: shakib
  Date: 8/25/2020
  Time: 5:33 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Posts</title>
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
    #contentText{
        background-color: #698DC4;
        text-align: justify;
        line-height: 120%;
        margin-left: 20px;
        padding: 5px;
        border-radius: 4px;
        width: 100%;

    }
    .viewPost{
        float: right;
        border: 1px solid white;
        margin: 5px;
        padding-top: 1px;
        padding-bottom: 1px;
        background-color: #201B51;
        color: white;
        border-radius: 4px;
        cursor: pointer;

    }
    #post{
        border-radius: 4px;
        padding-top: 15px;
        padding-bottom:15px;
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
        padding-left: 15px;
        padding-right: 15px;
        margin-bottom: 10px;


    }
    #divContent{
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
    </style>
    <script>
        $(document).ready(function(){
            //$( "#divContent" ).clone().appendTo( document.body );
            //$( "#divContent" ).clone().appendTo( document.body );
            //$( "#divContent" ).clone().appendTo( document.body );
            $( "#scroll" ).scroll();
            $( "button.viewPost" ).click(function() {
                var post_id = $( this ).attr("id");
                var urlAddr ="${createLink(controller:'Sync',action:'commentReady')}"

                    $.ajax({
                        url: urlAddr,
                        type: "POST",
                        datatype: "html",
                        data:{post_id:post_id},
                        success:function()
                        {
                            var urlAddress ="${createLink(controller:'Sync',action:'withComment')}"
                            $(location).attr('href',urlAddress)
                        }
                    });
            });
        });
    </script>
</head>
<body>
<button id="h1"><h1>Newsfeed</h1></button><br>
<div id="scroll">
    <input id="post"><br>
    <button id = "button" name = "button" onClick = "postAjax()">Post</button>
    <br><br><br>


        <g:each in = "${fetched_value}" status = "i" var = "val">
            <div id="divContent">

                <label id="userNameLabel" name="userNameLabel">${val.userFieldInPost.name}</label><br>
                <p id="contentText" name="contentText">${val.content}<button class="viewPost" id="${val.id}" name="onePost">View this post</button></p>
            </div>
        </g:each>

</div>


</body>

<script>
    var userName = "${user_name}";

    function postAjax() {
        $(document).ready(function() {
            var content = $('#post').val();
            var user_name = userName

            if(content == "") {
                alert('Your post is blank.');
                return false;
            }


            var URL="${createLink(controller:'Sync',action:'post')}"

            $.ajax({
                url: URL,
                type: "POST",
                datatype: "html",
                data:{content:content, user_name:user_name},
                success:function(data)
                {
                    alert(data);
                }
            });

        });
    }




</script>
</html>