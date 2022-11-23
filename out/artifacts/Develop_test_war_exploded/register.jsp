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
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="student_id" />
<jsp:setProperty name="user" property="password" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="club" />
<jsp:setProperty name="user" property="email" />
<!DOCTYPE html>
<html>
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content=" = "width=device-width", initial-scale = "1">
    <title>Document</title>
    <link rel = "stylesheet" href = "loginstyle.css">
    <script src = "jquery-3.4.1.js"></script>
    <title>회원가입</title>
</head>
<body>
<section class = "login-form">
    <h1>REGISTER FROM</h1>
    <form action = "RegisterAction.jsp">
        <div class = "int-area">
            <input type = "text" name = "student_id" autocomplete="off" required>
            <label for = "student_id">USER NAME</label>
        </div>
        <div class = "int-area">
            <input type = "password" name = "password" autocomplete="off" required>
            <label for = "password">PASS WORD</label>
        </div>
        <div class = "int-area">
            <input type = "name" name = "name" autocomplete="off" required>
            <label for = "name">name</label>
        </div>
        <div class = "int-area">
            <input type = "club" name = "club" autocomplete="off" required>
            <label for = "club">club</label>
        </div>
        <div class = "int-area">
            <input type = "email" name = "email" autocomplete="off" required>
            <label for = "email">email</label>
        </div>
        <div class = "btn-area">
            <button type = "submit">REGISTER</button>

        </div>
    </form>

</section>


</body>
</html>
