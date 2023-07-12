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
import model.Product;

/**
 *
 * @author xuant
 */
public class ProductDAO extends DBcontext {

    public List<Product> getProductByCid(int cid) {
        List<Product> list = new ArrayList<>();
        CategoryDAO cd = new CategoryDAO();
        String sql = "SELECT [ProductID]\n"
                + "      ,[ProductName]\n"
                + "      ,[CategoryID]\n"
                + "      ,[price]\n"
                + "      ,[UnitsInStock]\n"
                + "      ,[Brand]\n"
                + "  FROM [dbo].[products]\n"
                + "  WHERE 1 = 1";
        if (cid != 0) {
            sql += " and cid = " + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                int categoryID = rs.getInt("CategoryID");
                double price = rs.getDouble("price");
                int unitInStock = rs.getInt("UnitsInStock");
                String brand = rs.getString("Brand");
                Category category = cd.getCategoryById(categoryID);
                Product p = new Product(id, productName, category, price, unitInStock, brand);
                p.setImages(getProductImages(id));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<String> getProductImages(int productID) {
        List<String> imagesList = new ArrayList<>();
        String sql = "SELECT [ImagePath]\n"
                + "  FROM [dbo].[ProductImages]"
                + "  WHERE productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                imagesList.add(rs.getString("ImagePath"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return imagesList;
    }

    public List<Product> getListByPage(ArrayList<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public int getTotalProductSold(int productID) {
        String sql = "SELECT SUM(Quantity) AS TotalQuantitySold\n"
                + "FROM OrderDetails\n"
                + "WHERE ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return rs.getInt(1);               
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return 0;
    }
    
    public List<Product> getProductByFilter(String sql) {
        List<Product> list = new ArrayList<>();
        CategoryDAO cd = new CategoryDAO();               
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                int categoryID = rs.getInt("CategoryID");
                double price = rs.getDouble("price");
                int unitInStock = rs.getInt("UnitsInStock");
                String brand = rs.getString("Brand");
                Category category = cd.getCategoryById(categoryID);
                Product p = new Product(id, productName, category, price, unitInStock, brand);
                p.setImages(getProductImages(id));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public static void main(String[] args) {
        ProductDAO pd = new ProductDAO();
        System.out.println(pd.getProductImages(2).size());
    }
}
