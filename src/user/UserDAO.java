package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO(){
        try{
            String dbURL = "jdbc:mysql://localhost:3306/demo";
            String dbID = "root";
            String dbPassword = "1234";
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public int login(String userID, String userPassword){
        String SQL = "SELECT password FROM user WHERE student_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1,userID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString(1).equals(userPassword)){
                    return 1;
                }
                else  return 0; //비밀번호 오류
            }
            return -1; //아이디 존재 x
        }catch (Exception e){
            e.printStackTrace();
        }
        return -2; //DB 오류
    }


}
