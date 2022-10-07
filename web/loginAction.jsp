<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-10-03
  Time: 오후 2:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="user.UserDAO"%>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class = "user.User" scope = "page" />
<jsp:setProperty name="user" property="student_id" />
<jsp:setProperty name="user" property="password" />
<html>
<head>
    <title>JSP</title>
</head>
<body>
    <%
        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(user.getStudent_id(), user.getPassword());

        if(result == 1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }
        else if(result == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else if(result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('아이디가 틀립니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else if(result == -2){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('DB오류 입니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
    %>

</body>
</html>
