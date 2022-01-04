<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.model.profile" %>
<%
//    profile user;
//    try{
//        if (user != null) {
//                
//            }
//    }
//    catch(Exception e)
//    {
//        throw e;
//    }
    profile user = (profile)session.getAttribute("user");
    String username = user.getName();
    String email = user.getEmail();
    String gender = user.getGender();
    String phone = user.getPhone();
    String address = user.getAddress();
%>

<html>
    <head>
        <title>Edit Profile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Style/EditProfile.css"/>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <div class="header">
            <br>
            <h1>Seedvado</h1>
        </div> 
        <div class="container">
            <form action="EditProfileServlet" method="Post">
<!--                <div class="profile-pic">
                    <label class="-label" for="file">
                     <span><i class="bi bi-camera"></i></span>
                    <span>Change Image</span>
                    </label>
                    <input id="file" type="file" onchange="loadFile(event)"/>
                    <img src="Image/profilepic.jpg" id="output" width="200" />
                </div>-->
                <div class="form-group">
                    <label for="uname">User name</label>
                    <input type="text" class="form-control" name="uname" value="<% out.print(username); %>">                   
                </div>
                <div class="form-group">
                    <label for="gender">Gender</label>
                    <input type="text" class="form-control" name="gender" value="<% out.print(gender); %>">
                </div>
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" class="form-control" name="phone" value="<% out.print(phone); %>">
                </div>
                <div class="form-group">
                    <label for="phone">Address</label>
                    <input type="text" class="form-control" name="address" value="<% out.print(address); %>">
                </div>
                <br>
                <button type="submit" class="btn btn-light">Save</button>
            </form>         
        </div>
        
        <script>
            var loadFile = function (event) {
            var image = document.getElementById("output");
            image.src = URL.createObjectURL(event.target.files[0]);};
        </script>
    </body>
</html>

