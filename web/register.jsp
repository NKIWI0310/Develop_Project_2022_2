<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-10-18
  Time: 오후 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="session" />
<jsp:setProperty name="user" property="student_id" />
<jsp:setProperty name="user" property="password" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="club" />
<jsp:setProperty name="user" property="email" />
<jsp:setProperty name="user" property="phone_number" />
<!DOCTYPE html>
<html>
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content=" = "width=device-width", initial-scale = "1">
    <title>Document</title>
    <link rel = "stylesheet" href = "loginstyle.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <title>register</title>
</head>
<body>
<section class = "login-form">
    <h1>REGISTER FORM</h1>
    <form action = "RegisterAction.jsp">
        <div class = "int-area">
            <input type = "text" name = "student_id" autocomplete="off" required>
            <label for = "student_id">ID</label>
        </div>
        <div class = "int-area">
            <input type = "password" name = "password" autocomplete="off" required>
            <label for = "password">PW</label>
        </div>
        <div class = "int-area">
            <input type = "name" name = "name" autocomplete="off" required>
            <label for = "name">NAME</label>
        </div>
        <div class = "int-area">
            <input type = "phone_number" name = "phone_number" autocomplete="off" required>
            <label for = "phone_number">PHONE</label>
        </div>
        <div class = "int-area">
                <input type = "club" name = "club" autocomplete="off" required>
                <label for = "club">CLUB</label>
        </div>
        <div class = "int-area">
                <input type = "email" name = "email" autocomplete="off" required>
                <label for = "email">E-MAIL</label>
        </div>
        <div class = "btn-area3">
            <button type = "submit">REGISTER</button>
        </div>
    </form>

</section>


</body>
</html>
