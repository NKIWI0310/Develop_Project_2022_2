<%--
  Created by IntelliJ IDEA.
  User: JSJ
  Date: 2022-12-03
  Time: 오후 7:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="user.UserDAO"%>
<%@ page import="Board.BoardDao" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class = "user.User" scope = "session" />
<jsp:setProperty name="user" property="student_id" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="phone_number" />
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>이곳은 mypage입니다</title>
</head>
<body>
<%
    String id = user.getStudent_id();
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-lg-5">
        <a class="navbar-brand" href="#!"> <%=id%> 님</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/mainpage/dist/mainpage.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Mypage</a></li>
                <li class="nav-item"><a class="nav-link" href="/login.jsp">LogOut</a></li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
