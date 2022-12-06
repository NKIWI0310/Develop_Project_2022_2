<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-10-02
  Time: 오후 3:29
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-10-02
  Time: 오후 3:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content=" = "width=device-width", initial-scale = "1">
    <title>Document</title>
    <link rel = "stylesheet" href = "loginstyle.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>

<body>
<section class = "login-form">
    <h1>Welcome</h1>
    <form action = "loginAction.jsp">

        <div class = "int-area">
            <input type = "text" name = "student_id" autocomplete="off" required>
            <label for = "student_id">ID</label>
        </div>
        <div class = "int-area">
            <input type = "password" name = "password" autocomplete="off" required>
            <label for = "password">PW</label>
        </div>
        <div class = "btn-area">
            <button type = "submit">Sign-in</button>
        </div>
        <div class = "line">
            OR
        </div>

    </form>

    <form action = "QrLog.jsp">
        <div class = "btn-area2">
            <button type = "submit">Sign-in with QR</button>
        </div>
    </form>

    <div class="caption">
        <a href="register.jsp">Don't have an account? Sign-up</a>
    </div>


    <%--        <div class="caption">--%>
    <%--            <a href="QrLog.jsp">QrLogin</a>--%>
    <%--        </div>--%>
    <%--    </section>--%>

    <script>
        let student_id = $('#student_id');
        let password = $('#password');
        let btn = $('#btn');

        $(btn).on('click', function (){
            if($(student_id).val() == ""){
                $(student_id).next('label').addClass('warning');
            }
            else if($(password).val() == ""){
                $(password).next('label').addClass('warning');
            }
        })

    </script>
</body>
</html>

