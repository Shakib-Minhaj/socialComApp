<%--
  Created by IntelliJ IDEA.
  User: shakib
  Date: 8/25/2020
  Time: 5:33 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Log in</title>
    <script
            src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
    <style>
        body {
            width: 400px;
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
        #name{
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 5px 20px;
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
        #register{
            background-color: #4CAF50;
            color: white;
            padding: 5px 12px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>

<body>
<div align="center">
<div id="heading">
    <h1>Log in</h1>
</div>
<br><br><br><br>
<div id="nameContent">
    <label id="nameTitle">Username</label>
    <input name = "name" value = "" id = "name" placeholder="Your Username.."/>
</div>
<br><br>
<div id="passContent">
    <label id="passTitle">Password</label>
    <input name = "password" value = "" id = "password" placeholder="Your Password.."/>
</div>
<br><br>
<button id = "button" name = "button" onClick = "loginAjax()">Log in</button>
<g:form name = "myform" url = "[controller: 'Sync', action: 'signUp']">
    <g:submitButton id="register" name = "register" value = "Register" />
</g:form>
</div>
</body>
<script>
    function loginAjax() {
        $(document).ready(function() {
            var name = $('#name').val();
            var password = $('#password').val();

            if(name == "") {
                alert('Enter Your Username');
                return false;
            }

            if(password == "") {
                alert('Enter Your Password');
                return false;
            }

            var URL="${createLink(controller:'Sync',action:'login')}"

            $.ajax({
                url: URL,
                type: "POST",
                datatype: "html",
                data:{name:name, password:password},
                success:function(data)
                {
                    if(data != "null") {
                        var urlAddress ="${createLink(controller:'Sync',action:'postOnly')}"
                        $(location).attr('href',urlAddress)
                    }
                    else{
                        alert("Wrong username and/or password.")
                    }
                }
            })
        })

    }


</script>
</html>