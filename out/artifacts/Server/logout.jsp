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

<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
