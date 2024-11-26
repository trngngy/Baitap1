/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author nguye
 */
public class CategoryDAO {
    Connection connection;
    PreparedStatement ps;
    ResultSet rs;
    
    public List<CategoryDTO> getAllCategory() throws SQLException{
        List<CategoryDTO> categoryList = new ArrayList<CategoryDTO>();
        CategoryDTO category;
        String sql = "SELECT * FROM tblCategory";
        try{
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                category = new CategoryDTO(
                        rs.getInt("categoryid"),
                        rs.getString("categoryname"),
                        rs.getString("images"),
                        rs.getInt("status")
                );
                if(category.getStatus()==1){
                    categoryList.add(category);
                }
            }
        }catch (Exception e) {

        } finally {
            if (ps != null) {
                ps.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return categoryList;
    }
   public boolean updateCategory(int id,String name, String images, String status){
        String sql = "UPDATE tblCategory SET categoryname = ?, images = ?, status = ? WHERE categoryid = ?";
        boolean response = false;
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            
            ps.setString(1, name);
            ps.setString(2, images);
            ps.setString(3, status);
            ps.setInt(4, id);
            response = ps.executeUpdate() > 0 ? true : false;
        } catch (Exception ex){
            
        }
        return response;
    }
    public boolean deleteCategory(int CategoryID) throws ClassNotFoundException, SQLException{
        String sql = "DELETE FROM tblCategory WHERE categoryid = ?";
        boolean response = false;

        try {
            connection = DBUtils.getConnection();
            if (connection != null) {
                ps = connection.prepareStatement(sql);
                ps.setInt(1, CategoryID);
                response = ps.executeUpdate() > 0;
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return response;
    }
        public boolean createCategory(CategoryDTO category) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO tblCategory (categoryname, images, status) VALUES (?, ?, ?)";
        boolean response = false;

        try {
            connection = DBUtils.getConnection();
            if (connection != null) {
                ps = connection.prepareStatement(sql);
                ps.setString(1, category.getCategoryName());
                ps.setString(2, category.getCategoryImages());
                ps.setInt(3, category.getStatus());
                response = ps.executeUpdate() > 0;
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return response;
    }
}
