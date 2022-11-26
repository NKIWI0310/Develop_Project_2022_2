<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-11-16
  Time: 오후 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="user.UserDAO"%>
<%@ page import="Board.BoardDao" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class = "user.User" scope = "session" />
<%@ page import="java.sql.*" %>

<%
    BoardDao dao = new BoardDao();
    request.setCharacterEncoding("UTF-8");
    String student_id = user.getStudent_id();
    dao.Auto_entry(student_id);
//  실행 다 되고나면 첫 페이지로 돌아가게 만들기
    response.sendRedirect("Club_A.jsp");
%>
