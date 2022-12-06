<%--
  Created by IntelliJ IDEA.
  User: JSJ
  Date: 2022-12-04
  Time: 오후 4:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>qr코드 생성기</title>
</head>
<body>
<h1>QR코드 생성하기</h1>
<form action ="qrcode.jsp" method="post">
  URL 입력 = <input type="text" name="url" value="" style="width:500px" maxlength="200"/>
            <input type="submit" value="QRcode 생성"/>
</form>
</body>
</html>
