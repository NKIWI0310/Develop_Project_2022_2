<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-11-23
  Time: 오후 3:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import="Board.BoardDao" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class = "user.User" scope = "session" />
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String student_id = request.getParameter("student_id");
    user.setStudent_id(student_id);

    request.setCharacterEncoding("UTF-8");
    Connection conn = null;
    BoardDao dao = new BoardDao();
    String url = dao.URL;
    String root = dao.ID;
    String passwd = dao.PW;

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, root, passwd);

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {

        String sql = "SELECT name, phone_number FROM user WHERE student_id = ?";
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
<form>
</form>
</body>
</html>


//http://localhost:8080/mainpage/dist/Auto_login.jsp?student_id=2019038024
