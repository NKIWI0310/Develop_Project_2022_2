<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-11-16
  Time: 오전 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="Board.BoardDao" %>

<%
    Connection conn = null;

    BoardDao dao = new BoardDao();

    String url = dao.URL;
    String user = dao.ID;
    String passwd = dao.PW;

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, passwd);

    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String student_id = request.getParameter("student_id");
    String phone_number = request.getParameter("phone_number");
    String entry_time = request.getParameter("entry_time");
    String exit_time = request.getParameter("exit_time");
    PreparedStatement pstmt = null;
//    INSERT 해줄거라서 rs 필요없음

    try {
        String sql = "INSERT INTO entry_exit (name, student_id, phone_number, entry_time, exit_time) VALUES(?,?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, student_id);
        pstmt.setString(3, phone_number);
        pstmt.setString(4, entry_time);
        pstmt.setString(5, exit_time);
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
    response.sendRedirect("Club_A.jsp");
%>
