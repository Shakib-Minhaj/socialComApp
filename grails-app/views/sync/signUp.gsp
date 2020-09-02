<%--
  Created by IntelliJ IDEA.
  User: shakib
  Date: 8/25/2020
  Time: 5:33 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
    <script
            src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
    <style>
    body {
        width:400px;
        background-color: #00497F;
        text-align: center;
        color: white;
        font-family: Arial, Helvetica, sans-serif;
        margin-left: 200px;
    }
    #nameTitle{
        float:left;
        font-weight: bold;
    }
    #passTitle{
        float:left;
        font-weight: bold;
    }
    #mailTitle{
        float:left;
        font-weight: bold;
        margin-right: 28px;
    }
    #name{
        border: 1px solid #ccc;
        border-radius: 4px;
        padding: 5px 20px;
    }
    #email{
        border: 1px solid #ccc;
        border-radius: 4px;
        padding: 5px 20px;
        margin-left: 5px;
    }
    #password{
        border: 1px solid #ccc;
        border-radius: 4px;
        padding: 5px 20px;
    }
    #button{
        background-color: #4CAF50;
        color: white;
        padding: 5px 12px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    #sbutton{
        background-color: #4CAF50;
        color: white;
        padding: 5px 12px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    </style>
    <script>
        //Email Validation
        $('#email').keyup(function(){
            if(isValidEmailAddress($('#email')))
            {
                $('#email').css({
                    "border": "green"
                })
            }
            else {
                $('#email').css({
                    "border": "red"
                })
            }
        });
    </script>
</head>

<body>
<br><br>
<div>

    <label id="nameTitle">Username</label>
    <g:textField name = "name" value = "" id = "name" />
    <br><br>
    <label id="mailTitle">Email</label>
    <g:textField name = "email" value = "" id = "email"/>
    <div><span id="validEmail"></span></div>
    <br><br>
    <label id="passTitle">Password</label>
    <g:textField name = "password" value = "" id = "password"/>
    <br><br>
    <button id = "button" name = "button" onClick = "signAjax()">Register</button>
    <g:form name = "myform" url = "[controller: 'Sync', action: 'index']">
        <g:submitButton id="sbutton" name = "submit_add" value = "Login now" />
    </g:form>

</div>
</body>
<script>



    function isValidEmailAddress(emailAddress) {
        var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
        return pattern.test(emailAddress);
    }

    function signAjax() {
        $(document).ready(function() {
            var name = $('#name').val();
            var email = $('#email').val();
            var password = $('#password').val();


            //Check if name field is empty
            if(name == "") {
                alert('Enter your Username.');
                return false;
            }

            //Check if email field is empty
            if(email == "") {
                alert('Enter your email address.');
                return false;
            }

            if(!isValidEmailAddress(email)) {
                alert('Email address not correct.');
                return false;
            }

            if(password == "") {
                alert('Enter Password.');
                return false;
            }



            var URL="${createLink(controller:'Sync',action:'register')}"

            $.ajax({
                url: URL,
                type: "POST",
                datatype: "html",
                data:{name:name, email:email, password:password},
                success:function(data)
                {
                    alert(data);
                }
            })

        })
    }

</script>
</html>