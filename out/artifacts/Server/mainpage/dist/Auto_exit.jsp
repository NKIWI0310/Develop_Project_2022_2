<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-11-19
  Time: 오후 8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="user.UserDAO"%>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class = "user.User" scope = "session" />
<%@ page import="java.sql.*" %>
<%@ page import="Board.BoardDao" %>

<%

    request.setCharacterEncoding("UTF-8");
    Connection conn = null;

    BoardDao dao = new BoardDao();
    String url = dao.URL;
    String root = dao.ID;
    String passwd = dao.PW;
    String table_number = request.getParameter("table_number");
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, root, passwd);

    PreparedStatement pstmt = null;

    try {
        String student_id = user.getStudent_id();

        String sql = "UPDATE demo.entry_exit SET exit_time = DATE_ADD(now(), INTERVAL 9 HOUR) WHERE student_id = ? AND table_number = ? ORDER BY entry_time DESC LIMIT 1";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,student_id);
        pstmt.setString(2, table_number);
        pstmt.executeUpdate();

    }
    catch (SQLException e) {
        out.println("SQLException : " + e.getMessage());
    }
    finally {
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
//  실행 다 되고나면 첫 페이지로 돌아가게 만들기
    response.sendRedirect("mainpage.jsp");
%>
