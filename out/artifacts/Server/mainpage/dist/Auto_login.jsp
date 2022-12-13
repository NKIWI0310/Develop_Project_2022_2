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
    ResultSet trs = null;

    try {
        String sql = "SELECT name, phone_number FROM user WHERE student_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,student_id);
        rs = pstmt.executeQuery();
        String table_number = request.getParameter("table_number");

        sql = "SELECT * FROM entry_exit WHERE student_id = ? AND exit_time is null ORDER BY entry_time DESC LIMIT 1";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,student_id);
        trs = pstmt.executeQuery();

        if(trs.next()) {
            sql = "UPDATE demo.entry_exit SET exit_time = DATE_ADD(now(), INTERVAL 9 HOUR) WHERE (entry_exit_id = ?)";
            pstmt = conn.prepareStatement(sql);
            int eei = trs.getInt("entry_exit_id");
            pstmt.setInt(1,eei);
            pstmt.executeUpdate();
        }
        else
        while (rs.next()) {

                sql = "INSERT INTO entry_exit (name, student_id, phone_number, entry_time, table_number) VALUES (?,?,?,DATE_ADD(now(), INTERVAL 9 HOUR),?)";
                pstmt = conn.prepareStatement(sql);
                String name = rs.getString("name");
                String phone_number = rs.getString("phone_number");

                pstmt.setString(1, "" + name);
                pstmt.setString(2, "" + student_id);
                pstmt.setString(3, "" + phone_number);
                pstmt.setString(4, table_number);
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
//  실행 다 되고나면 메인페이지로 가게 만들기
    response.sendRedirect("mainpage.jsp");

%>
<form>
</form>
</body>
</html>


//http://localhost:8080/mainpage/dist/Auto_login.jsp?student_id=2019038024&table_number=1  가정
//&연산으로 다른 parameter 가져올수 있음
