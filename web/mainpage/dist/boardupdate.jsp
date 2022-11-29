<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-11-27
  Time: 오후 11:44
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

    int entry_exit_id = Integer.parseInt(request.getParameter("entry_exit_id"));
    String name = null,student_id = null,phone_number = null,entry_time = null,exit_time = null;

    Connection conn = null;
    BoardDao dao = new BoardDao();
    String url = dao.URL;
    String root = dao.ID;
    String passwd = dao.PW;

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, root, passwd);
    String table_number = request.getParameter("table_number");
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String sql = "SELECT name, student_id, phone_number, entry_time, exit_time FROM entry_exit WHERE entry_exit_id = ? AND table_number = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, entry_exit_id);
        pstmt.setString(2,table_number);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            name = rs.getString("name");
            student_id = rs.getString("student_id");
            phone_number = rs.getString("phone_number");
            entry_time = rs.getString("entry_time");
            exit_time = rs.getString("exit_time");
        }
        }catch (SQLException e) {
            out.println("SQLException : " + e.getMessage());
        }


%>

<!DOCTYPE html>
<html>
<head>
    <title>출입대장 관리 프로그램</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        <%--    자바스크립트  --%>
        window.addEventListener('DOMContentLoaded', function () {
            const btnBack = document.querySelector('#btn-back');
            btnBack.addEventListener('click', function () {
                //뒤로가기 기능
                history.back();
            })
        });
    </script>
</head>

<body>
<header class="container mt-3">
    <div class="p-5 mb-4 bg-light rounded-3">
        <div class="container-fluid py-4">
            <h1 class="text-center">출입대장 관리 프로그램</h1>
        </div>
    </div>
</header>


<main class="container mt-5">
    <div class="row">
        <div class="col-sm-6 mx-auto">
            <form action="boardupdate_process.jsp" method="post" class="border rounded-3 p-4">

                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="name" name="name" value = "<%=name%>">
                    <label for="name" class="form-label">이름</label>
                </div>
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="student_id" name="student_id" value = "<%=student_id%>">
                    <label for="student_id" class="form-label">학번</label>
                </div>
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="phone_number" name="phone_number" value = "<%=phone_number%>">
                    <label for="phone_number" class="form-label">휴대폰번호</label>
                </div>
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="entry_time" name="entry_time" value = "<%=entry_time%>">
                    <label for="entry_time" class="form-label">출입시간</label>
                </div>
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="exit_time" name="exit_time" value = "<%=exit_time%>">
                    <label for="exit_time" class="form-label">퇴실시간</label>
                </div>


                <div class="d-grid gap-2">
                    <button class="btn btn-primary" type="submit">작성</button>
                    <button class="btn btn-secondary" type="button" id="btn-back">돌아가기</button>
                </div>

            </form>
        </div>
    </div>
</main>


</body>
</html>
