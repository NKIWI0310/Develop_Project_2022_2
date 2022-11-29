<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-11-16
  Time: 오전 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="user.UserDAO"%>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class = "user.User" scope = "session" />
<jsp:setProperty name="user" property="name" />
<%@ page import="java.sql.*" %>

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

<%
    String table_number = request.getParameter("table_number");
%>



<main class="container mt-5">
    <div class="row">
        <div class="col-sm-6 mx-auto">
            <form action="boardWrite_process.jsp?" method="post" class="border rounded-3 p-4">

                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="table_number" name="table_number" value = "<%=table_number%>">
                    <label for="name" class="form-label">동아리 고유 번호 " 변경하지 마세요" </label>
                </div>
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
                    <label for="name" class="form-label">이름</label>
                </div>
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="student_id" name="student_id" placeholder="학번을 입력하세요">
                    <label for="student_id" class="form-label">학번</label>
                </div>
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="phone_number" name="phone_number" placeholder="휴대폰 번호를 입력하세요">
                    <label for="phone_number" class="form-label">휴대폰번호</label>
                </div>
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="entry_time" name="entry_time" placeholder="출입시간을 입력하세요">
                    <label for="entry_time" class="form-label">출입시간</label>
                </div>
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="exit_time" name="exit_time" placeholder="퇴실시간을 입력하세요">
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
