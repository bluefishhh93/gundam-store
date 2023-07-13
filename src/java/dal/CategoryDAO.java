/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author xuant
 */
public class CategoryDAO extends DBcontext{
    
    //get category by id
    public Category getCategoryById(int id) {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM Categories WHERE CategoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("CategoryID"), rs.getString("CategoryName"), rs.getString("picture"));
//                connection.close();
                return c;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    //get all category in tabble
    public List<Category> getAllCategory(){
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Category c = new Category(rs.getInt("CategoryID"), rs.getString("CategoryName"), rs.getString("picture"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        CategoryDAO cd = new CategoryDAO();
        for(Category c : cd.getAllCategory()){
            System.out.println(c.getImage());
        }
    }
}
