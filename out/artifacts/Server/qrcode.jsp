<%--
  Created by IntelliJ IDEA.
  User: JSJ
  Date: 2022-12-04
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File, java.util.UUID" %>
<%@ page import="java.awt.image.BufferedImage, javax.imageio.ImageIO" %>
<%@ page import="com.google.zxing.qrcode.QRCodeWriter, com.google.zxing.common.BitMatrix, com.google.zxing.BarcodeFormat, com.google.zxing.client.j2se.MatrixToImageWriter" %>
<%--
<%
    String url = request.getParameter("url");
    int nCheck = 1;
    String savedFileName = "";

    //url 확인
    if(url == null || url.equals("") || !url.startsWith("http")) {
        nCheck = 0;
    }
    else {
        int width = Integer.parseInt(request.getParameter("width"));
        int height = Integer.parseInt(request.getParameter("height"));

        String text = request.getParameter("text");
        text = new String(text.getBytes("UTF-8"), "ISO-8859-1");

        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text,
                BarcodeFormat.QR_CODE, width, height);
        ServletOutputStream outputStream = response.getOutputStream();
        MatrixToImageWriter.writeToStream(bitMatrix, "png", outputStream);
        outputStream.flush();
        outputStream.close();
    }
%>
--%>

<%
    String url = request.getParameter("url");
    int nCheck = 1;
    String savedFileName = "";

    //url 확인
    if(url == null || url.equals("") || !url.startsWith("http")) {
        nCheck = 0;
    }
    else{
        //파일설정
        File path = new File(application.getRealPath("/") + "qrcode/images/");
        savedFileName = UUID.randomUUID().toString().replace("-", "");
        if (!path.exists()) path.mkdirs();

        //qr코드 생성
        QRCodeWriter writer = new QRCodeWriter();
        BitMatrix qrCode = writer.encode(url, BarcodeFormat.QR_CODE, 200, 200);
        BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);
        ImageIO.write(qrImage, "PNG", new File(path, savedFileName+".png"));
    }
%>

<html>
<head>
    <title>qr코드 생성</title>
</head>
<body>
<h1>자신의 qr코드 생성하기</h1>
<%
    if(nCheck == 1){
        String qrcode = request.getContextPath() + "/qrcode/images/" + savedFileName + ".png";
        out.print("<img src='" + qrcode + "'/><p/>");
    }
    else{
        out.print("잘못된 URL 입니다.<p/>");
    }
%>
<a href="./produce_qr.jsp">다시 생성</a>
</body>
</html>
