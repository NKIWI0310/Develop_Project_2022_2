<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022-11-23
  Time: 오후 8:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Board.BoardDao" %>
<%
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
    String today = formatter.format(new java.util.Date());
    String file_name = "Download_"+today;
    String ExcelName 	= new String(file_name.getBytes(),"UTF-8")+".xls";
    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition", "attachment; filename="+ExcelName);
    response.setHeader("Pragma", "no-cache");
%>

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
