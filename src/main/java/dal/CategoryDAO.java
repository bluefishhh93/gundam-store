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


public class CategoryDAO extends DBcontext{
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
            System.out.println(e); // print the exception stack trace for debugging
        }
        return null;
    }
}
