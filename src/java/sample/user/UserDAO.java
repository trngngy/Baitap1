/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author nguye
 */
public class UserDAO {

    private static final String LOGIN = "SELECT * FROM tblUser WHERE username = ? AND password = ?";
    private static final String INSERT = "INSERT INTO tblUser(username, password, fullname, roleid, phone, email) VALUES (?,?,?,?,?,?)";
    private static final String CHECK_DUPLICATE = "SELECT username FROM tblUser WHERE username = ?";
    private static final String UPDATE_PASSWORD = "UPDATE tblUser SET password = ? WHERE username = ?";

    public UserDTO checkLogin(String username, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullname = rs.getString("fullname");
                    String roleid = rs.getString("roleid");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    user = new UserDTO(username, password, fullname, roleid, phone, email);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public boolean insert(UserDTO User) throws ClassNotFoundException, SQLException {
        boolean checkInsert = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, User.getUsername());
                ptm.setString(2, User.getPassword());
                ptm.setString(3, User.getFullname());
                ptm.setString(4, User.getRoleid());
                ptm.setString(5, User.getPhone());
                ptm.setString(6, User.getEmail());
                checkInsert = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkInsert;
    }

    public boolean checkDuplicate(String username) throws SQLException, ClassNotFoundException {
        boolean isDuplicate = false;
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(CHECK_DUPLICATE)) {

            ptm.setString(1, username);
            try (ResultSet rs = ptm.executeQuery()) {
                if (rs.next()) {
                    isDuplicate = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e; 
        }
        return isDuplicate;
    }
      public void updatePassword(String username, String newPassword) throws SQLException, ClassNotFoundException {
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ptm = conn.prepareStatement(UPDATE_PASSWORD)) {
             
            ptm.setString(1, newPassword);
            ptm.setString(2, username);
            ptm.executeUpdate(); 
        }
    }
}
