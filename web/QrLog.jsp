<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-10-20
  Time: 오후 7:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="user.UserDAO"%>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class = "user.User" scope = "session" />
<jsp:setProperty name="user" property="student_id" />
<jsp:setProperty name="user" property="password" />

<script src="html5-qrcode.min_.js"></script>
<style>
  .result{
    background-color: green;
    color:#fff;
    padding:20px;
  }
  body{
    background-image: linear-gradient(to top, #f3e7e9 0%, #e3eeff 99%, #e3eeff 100%);
    width: 100%;
    height: 100%;
  }
  .row{
    width: 100%;
    height: 100%;
    display:flex;
    justify-content: center;
    align-items: center;
  }
</style>
<div class="row">
  <div class="col">
    <div style="width:500px; text-align: center;border:0.4em inset #C7EAFD;border-radius: 20px; cursor:pointer;  " id="reader"> </div>
    <%--    position: relative; left:674px;top: 340px;--%>
  </div>
  <div class="col" style="padding:0px;">
    <%--    <h4>SCAN RESULT</h4>--%>
    <%--    <div id="result">Result Here</div>--%>
  </div>
</div>
<script type="text/javascript">
  function onScanSuccess(qrCodeMessage) {
    // document.getElementById('result').innerHTML = '<span class="result">' + qrCodeMessage + '</span>';
    location.replace(qrCodeMessage);
    html5QrcodeScanner.clear();
  }
  function onScanError(errorMessage) {
    //handle scan error
  }
  var html5QrcodeScanner = new Html5QrcodeScanner(
          "reader", { fps: 10, qrbox: 250 });
  html5QrcodeScanner.render(onScanSuccess, onScanError);
</script>
