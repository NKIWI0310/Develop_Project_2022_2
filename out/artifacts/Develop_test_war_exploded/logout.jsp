<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-10-12
  Time: 오전 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="user.UserDAO"%>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class = "user.User" scope = "session" />
<jsp:setProperty name="user" property="student_id" />
<jsp:setProperty name="user" property="password" />

<%
    session.invalidate();
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("location.href = './login.jsp'");
    script.println("</script>");
%>

<html>
<head>
    <title>로그아웃</title>
</head>
<body>

</body>
</html>
