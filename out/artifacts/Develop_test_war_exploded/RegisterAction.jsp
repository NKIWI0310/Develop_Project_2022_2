<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-10-19
  Time: 오전 9:17
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

<html>
<head>
    <title>Title</title>
</head>
<body>
<%	// ---> 2.
  if (user.getStudent_id() == null || user.getPassword() == null || user.getName() == null
          || user.getClub() == null || user.getEmail() == null) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('입력이 안 된 사항이 있습니다.')");
    script.println("history.back()");
    script.println("</script>");
  } else {  // ---> 3.
    UserDAO userDAO = new UserDAO();
    int result = userDAO.join(user);
    if (result == -1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('이미 존재하는 아이디입니다.')");
      script.println("history.back()");
      script.println("</script>");
    }
    else  {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("location.href = 'login.jsp'");
      script.println("</script>");
    }
  }
%>
</body>
</html>
