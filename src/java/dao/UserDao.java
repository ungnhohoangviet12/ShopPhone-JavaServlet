package dao;

import connection.DbCon;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;

public class UserDao {

    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public UserDao(Connection con) {
        this.con = con;
    }

    public User userLogin(String email, String password) {
        User user = null;
        try {
            query = "select * from users where email=? and password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
    
    public User getUserByEmail(String userName) {
        String sql = "Select * from users where email = ? ";

        User user = null;
        try {
            PreparedStatement pstm = con.prepareStatement(sql);
            // set value for coditon where 
            pstm.setString(1, userName);
            
            ResultSet rs = pstm.executeQuery();
            
            if (rs.next()) {
                user = new User();
                user.setId(Integer.parseInt(rs.getString("id")));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            }
            
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return user;
    }

    public boolean registerUser(User user) {
        String sql = "insert into users (name, email, password) value (?, ?, ?, ?, ?)";

        try {
            PreparedStatement pstm = con.prepareStatement(sql);
            // set value for coditon where 
            pstm.setString(1, user.getName());
            pstm.setString(2, user.getEmail());
            pstm.setString(3, user.getPassword());
            
            int result = pstm.executeUpdate();
            if (result == 1) {
                return true;
            }

        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return false;
    }
}
