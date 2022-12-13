package Board;

import java.sql.*;

public class BoardDao {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public String URL = "jdbc:mysql://43.201.30.169:53709/demo";
    public String ID = "devpro";
    public String PW = "1234";
    public int Auto_entry = 0;
    public BoardDao(){
        try{
            String dbURL = URL;
            String dbID = ID;
            String dbPassword = PW;
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public int delete(int entry_exit_id,String table_number) {
        int res = 0;

        String SQL = "DELETE FROM entry_exit WHERE entry_exit_id = ? AND table_number = ?";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,entry_exit_id);
            pstmt.setString(2,table_number);
            res = pstmt.executeUpdate();

        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            try{
                pstmt.close();
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }

        return res;
    }

    public void Auto_entry(String student_id, String table_number){
        try {

            String sql = "SELECT name, phone_number FROM user WHERE student_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,student_id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                sql = "INSERT INTO demo.entry_exit (name, student_id, phone_number, entry_time, table_number ) VALUES (?,?,?,DATE_ADD(now(), INTERVAL 9 HOUR),?)";
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
            e.printStackTrace();
        }
        finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }
}
