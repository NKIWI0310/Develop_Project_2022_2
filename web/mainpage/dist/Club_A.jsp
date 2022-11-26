<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-10-12
  Time: 오전 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="user.UserDAO"%>
<%@ page import="Board.BoardDao" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class = "user.User" scope = "session" />
<jsp:setProperty name="user" property="student_id" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="phone_number" />
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>동아리 관리 페이지</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.battatech.excelexport.js"></script>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>

<%
    String id = user.getStudent_id();
%>
<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-lg-5">
        <a class="navbar-brand" href="#!"> <%=id%> 님</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/mainpage/dist/mainpage.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Mypage</a></li>
                <li class="nav-item"><a class="nav-link" href="/login.jsp">LogOut</a></li>
            </ul>
        </div>
    </div>
</nav>

<script>
    function func(a){

    }
</script>
<header class="container mt-3">
    <div class="p-5 mb-4 bg-light rounded-3">
        <div class="container-fluid py-4">
            <h1 class="text-center">A동아리 출입대장</h1>
        </div>
    </div>
</header>
<main class="container mt-4">
    <div class="row">
        <div class="col-sm">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>이름</th>
                    <th>학번</th>
                    <th>연락처</th>
                    <th>출입시간</th>
                    <th>퇴실시간</th>
                </tr>
                </thead>
                <tbody>
                <%
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
                        String sql = "SELECT entry_exit_id, name, student_id, phone_number, entry_time, exit_time FROM entry_exit";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            String entry_exit_id = rs.getString("entry_exit_id");
                            String name = rs.getString("name");
                            String student_id = rs.getString("student_id");
                            String phone_number = rs.getString("phone_number");
                            String entry_time = rs.getString("entry_time");
                            String exit_time = rs.getString("exit_time");
                %>
                <tr>
                    <td><%=name%></td>
                    <td><%=student_id%></td>
                    <td><%=phone_number%></td>
                    <td><%=entry_time%></td>
                    <td><%=exit_time%></td>
                    <td><a href = "delete.jsp?entry_exit_id=<%=entry_exit_id%>">삭제</a></td>
                </tr>
                <%
                        }
                    }
                    catch (SQLException e) {
                        out.println("SQLException : " + e.getMessage());
                    }
                    finally {
                        if (rs != null) {
                            rs.close();
                        }
                        if (pstmt != null) {
                            pstmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    }
                %>
                </tbody>
            </table>
            <div class="d-flex justify-content-end">
                <a href="boardWrite.jsp" class="btn btn-primary">수동 추가</a>
            </div>
            <div class="d-flex justify-content-end">
                <a href="Auto_entry.jsp" class="btn btn-primary">자동 출입 시간 추가</a>
            </div>
            <div class="d-flex justify-content-end">
                <a href="Auto_exit.jsp" class="btn btn-primary">자동 퇴실 시간 추가</a>
            </div>
            <div class="d-flex justify-content-start">
                <a href="excel.jsp" class="btn btn-primary">Excel저장</a>
            </div>

        </div>
    </div>
</main>



<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
