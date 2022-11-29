<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-11-22
  Time: 오후 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import="Board.BoardDao" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
    int entry_exit_id = Integer.parseInt(request.getParameter("entry_exit_id"));

    BoardDao dao = new BoardDao();
    String table_number = request.getParameter("table_number");
    int res = dao.delete(entry_exit_id,table_number);

    if(res>0){
%>
    <script>
        alert("삭제 성공");
        location.href="mainpage.jsp";
    </script>
<%
    }
    else{
%>
    <script>
        alert("삭제 실패");
        location.href="mainpage.jsp";
    </script>
<%
    }

%>
