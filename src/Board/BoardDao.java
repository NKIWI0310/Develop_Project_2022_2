package Board;

import java.sql.*;

public class BoardDao {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public int delete(int entry_exit_id) {

        try {
            String dbURL = "jdbc:mysql://13.209.42.53:59870/demo";
            String dbID = "devpro";
            String dbPassword = "1234";
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }

        int res = 0;

        String SQL = "DELETE FROM entry_exit WHERE entry_exit_id = ?";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,entry_exit_id);

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
}
