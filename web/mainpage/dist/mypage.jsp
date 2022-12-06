<%--
  Created by IntelliJ IDEA.
  User: JSJ
  Date: 2022-12-03
  Time: 오후 7:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="user.UserDAO"%>
<%@ page import="Board.BoardDao" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.File, java.util.UUID" %>
<%@ page import="java.awt.image.BufferedImage, javax.imageio.ImageIO" %>
<%@ page import="com.google.zxing.qrcode.QRCodeWriter, com.google.zxing.common.BitMatrix, com.google.zxing.BarcodeFormat, com.google.zxing.client.j2se.MatrixToImageWriter" %>

<jsp:useBean id="user" class = "user.User" scope = "session" />
<jsp:setProperty name="user" property="student_id" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="phone_number" />
<jsp:setProperty name="user" property="password" />

<%@ page import="java.sql.*" %>

<html>
<head>
    <title>이곳은 mypage입니다</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>동아리 관리 페이지</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
<%
    String id = user.getStudent_id();

    request.setCharacterEncoding("UTF-8");
    Connection conn = null;
    BoardDao dao = new BoardDao();
    String url = dao.URL;
    String root = dao.ID;
    String passwd = dao.PW;
    String name = null;
    String phone_number = null;
    String Email = null;
    String Club = null;

    String auto_login_url = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, root, passwd);

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {

        String sql = "SELECT * FROM user WHERE student_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,id);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            pstmt = conn.prepareStatement(sql);
            name = rs.getString("name");
            phone_number = rs.getString("phone_number");
            Email = rs.getString("email");
            Club = rs.getString("club");

        }
        sql = "SELECT club_id FROM club WHERE club_name = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,Club);
        rs = pstmt.executeQuery();
        rs.next();
        String table_number = rs.getString("club_id");

        auto_login_url = "http://localhost:8080/mainpage/dist/Auto_login.jsp?student_id="+id+"&table_number=" +table_number;
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
%>

<%
    int nCheck = 1;
    String savedFileName = "";

    //url 확인
    if(url == null || auto_login_url.equals("") || !auto_login_url.startsWith("http")) {
        nCheck = 0;
    }
    else{
        //파일설정
        File path = new File(application.getRealPath("/") + "qrcode/images/");
        savedFileName = UUID.randomUUID().toString().replace("-", "");
        if (!path.exists()) path.mkdirs();

        //qr코드 생성
        QRCodeWriter writer = new QRCodeWriter();
        BitMatrix qrCode = writer.encode(auto_login_url, BarcodeFormat.QR_CODE, 200, 200);
        BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);
        ImageIO.write(qrImage, "PNG", new File(path, savedFileName+".png"));
    }

    String qrcode = request.getContextPath() + "/qrcode/images/" + savedFileName + ".png";
//    out.print("<img src='" + qrcode + "'/><p/>");

%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-lg-5">
        <a class="navbar-brand" href="#!"> <%=id%> 님</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/mainpage/dist/mainpage.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/mainpage/dist/mypage.jsp">Mypage</a></li>
                <li class="nav-item"><a class="nav-link" href="/login.jsp">LogOut</a></li>
            </ul>
        </div>
    </div>

</nav>
<header class="py-5">
    <div class="container px-lg-5">
        <div class="p-4 p-lg-5 bg-light rounded-3 text-center">
            <div class="m-4 m-lg-5">
                <h1 class="display-5 fw-bold">동아리 출입관리 시스템</h1>
                <p class="fs-4">자신의 정보를 열람할 수 있는 페이지 입니다.</p>
                <%--                <a class="btn btn-primary btn-lg" href="#!"></a>--%>
            </div>
        </div>
    </div>
</header>
<section class="pt-4">
<div class="p-4 p-lg-5 rounded-3 text-center">
    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
        <h3 class="fs-4 fw-bold">학번</h3> <p class="mb-0"><%=id%></p>
    </div>
    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
        <h3 class="fs-4 fw-bold">이름</h3> <p class="mb-0"><%=name%></p>
    </div>
    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
        <h3 class="fs-4 fw-bold">동아리</h3> <p class="mb-0"><%=Club%></p>
    </div>
    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
        <h3 class="fs-4 fw-bold">이메일</h3> <p class="mb-0"><%=Email%></p>
    </div>
    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
        <h3 class="fs-4 fw-bold">전화번호</h3> <p class="mb-0"><%=phone_number%></p>
    </div>
    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
        <h3 class="fs-4 fw-bold">자동로그인 QR코드 </h3> <img src= <%=qrcode%> >
    </div>
</div>
</section>

    <script type="text/javascript">
        function onScanSuccess(qrCodeMessage) {
            // document.getElementById('result').innerHTML = '<span class="result">' + qrCodeMessage + '</span>';
            location.replace(qrCodeMessage);
        }
        function onScanError(errorMessage) {
            //handle scan error
        }
        var html5QrcodeScanner = new Html5QrcodeScanner(
            "reader", { fps: 10, qrbox: 250 });
        html5QrcodeScanner.render(onScanSuccess, onScanError);
    </script>
</div>

<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">1-8 team</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
