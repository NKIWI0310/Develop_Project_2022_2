<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-11-28
  Time: 오전 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import="Board.BoardDao" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>

<jsp:useBean id="Board" class="Board.Board" scope="session" />
<jsp:setProperty name="Board" property="entry_exit_id" />
<jsp:setProperty name="Board" property="name" />
<jsp:setProperty name="Board" property="student_id" />
<jsp:setProperty name="Board" property="phone_number" />
<jsp:setProperty name="Board" property="entry_time" />
<jsp:setProperty name="Board" property="exit_time" />


<%

    Connection conn = null;
    BoardDao dao = new BoardDao();
    String url = dao.URL;
    String root = dao.ID;
    String passwd = dao.PW;

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, root, passwd);

    PreparedStatement pstmt = null;

    try {
        String sql = "UPDATE demo.entry_exit SET name = ?, student_id = ?, phone_number = ?, entry_time = ?, exit_time = ? WHERE (entry_exit_id = ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, Board.getName());
        pstmt.setString(2, Board.getStudent_id());
        pstmt.setString(3, Board.getPhone_number());
        pstmt.setString(4, Board.getEntry_time());
        pstmt.setString(5, Board.getExit_time());
        pstmt.setInt(6, Board.getEntry_exit_id());
        pstmt.executeUpdate();

    }catch (SQLException e) {
        out.println("SQLException : " + e.getMessage());
    }

    response.sendRedirect("Club_A.jsp");
%>


