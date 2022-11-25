<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-11-16
  Time: 오후 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="user.UserDAO"%>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class = "user.User" scope = "session" />
<%@ page import="java.sql.*" %>

<%

    request.setCharacterEncoding("UTF-8");
    Connection conn = null;

    String url = "jdbc:mysql://13.209.42.53:59870/demo";
    String root = "devpro";
    String passwd = "1234";

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, root, passwd);

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {

        String sql = "SELECT name, phone_number FROM user WHERE student_id = ?";
        String student_id = user.getStudent_id();
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,student_id);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            sql = "INSERT INTO entry_exit (name, student_id, phone_number, entry_time) VALUES (?,?,?,now())";
            pstmt = conn.prepareStatement(sql);
            String name = rs.getString("name");
            String phone_number = rs.getString("phone_number");

            pstmt.setString(1, "" + name);
            pstmt.setString(2, "" + student_id);
            pstmt.setString(3, "" + phone_number);
            pstmt.executeUpdate();
        }
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
    response.sendRedirect("Club_A.jsp");
%>
