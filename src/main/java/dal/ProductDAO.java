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
import model.ManageOrder;
import model.Product;


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
//    get ordertoday
//    public ArrayList<ManageOrder> getOrderFromManager() {
//        ArrayList<Order> list = new ArrayList<>();
//        String sql = "Select [OrderID], [CustomerName], [PhoneNumber], [Address], [PurchaseDate], [TotalAmount], [Status] from [dbo].[ManageOrder]";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                int orderID = rs.getInt("OrderID");
//                String customerName = rs.getString("CustomerName");
//                String phoneNumber = rs.getString("PhoneNumber");
//                String address = rs.getString("Address");
//                String purchaseDate = rs.getString("PurchaseDate");
//                double totalAmount = rs.getDouble("TotalAmount");
//                String status = rs.getString("Status");
//                ManageOrder ot = new ManageOrder(orderID, customerName, phoneNumber, address, purchaseDate, getProductByCid(), status);
//                list.add(ot);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//
//        return list;
//    }
//    count customer by customer id
    public int countCustomer(){
        int count = 0;
        String sql = "SELECT COUNT(OrderID) AS TotalOrder FROM [dbo].[ManageOrder]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }
//    -----------------------------------------------------------------------------------PRODUCT----------------------------------------------------------------------------------
    public ArrayList<Product> getProducts(){
        String sql = "SELECT\n" +
                "    P.ProductID,\n" +
                "    -- C.CategoryName,\n" +
                "\tC.*,\n" +
                "    P.ProductName,\n" +
                "    P.Price,\n" +
                "    P.ProductDetail,\n" +
                "    P.UnitsInStock\n" +
//                "    PI.ImagePath AS ProductImage\n" +
                "FROM\n" +
                "    [Products] P\n" +
                "    INNER JOIN Categories C ON P.CategoryID = C.CategoryID\n" +
                "    LEFT JOIN [dbo].[ProductImages] PI ON P.ProductID = PI.ProductID;";
        ArrayList<Product> list = new ArrayList<>();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                int id = rs.getInt("ProductID");
                Category Category = new Category(rs.getInt("CategoryID"), rs.getString("CategoryName"), rs.getString("Picture"));
                String ProductName = rs.getString("ProductName");
                double Price = rs.getDouble("Price");
                String ProductDetail = rs.getString("ProductDetail");
                int UnitsInStock = rs.getInt("UnitsInStock");
                List<String> ProductImage = getProductImages(id);
                Product p = new Product(id,  ProductName, Category, Price, ProductDetail, UnitsInStock, ProductImage);
                list.add(p);
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return list;
    }
    public Product getProduct(int id){
        String sql = "SELECT\n" +
                "    P.ProductID,\n" +
                "    -- C.CategoryName,\n" +
                "\tC.*,\n" +
                "    P.ProductName,\n" +
                "    P.Price,\n" +
                "    P.ProductDetail,\n" +
                "    P.UnitsInStock,\n" +
                "    PI.ImagePath AS ProductImage\n" +
                "FROM\n" +
                "    [Products] P\n" +
                "    INNER JOIN Categories C ON P.CategoryID = C.CategoryID\n" +
                "    LEFT JOIN [dbo].[ProductImages] PI ON P.ProductID = PI.ProductID\n" +
                "WHERE P.ProductID = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                Category Category = new Category(rs.getInt("CategoryID"), rs.getString("CategoryName"), rs.getString("Picture"));
                String ProductName = rs.getString("ProductName");
                double Price = rs.getDouble("Price");
                String ProductDetail = rs.getString("ProductDetail");
                int UnitsInStock = rs.getInt("UnitsInStock");
                String ProductImage = rs.getString("ProductImage");
                Product p = new Product(id,  ProductName, Category, Price, ProductDetail, UnitsInStock, ProductImage);
                return p;
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return null;
    }
    public int editProduct(Product product){
//        update by id
        String sql = "UPDATE [dbo].[Products]\n" +
                "   SET [CategoryName] = ?\n" +
                "      ,[ProductName] = ?\n" +
                "      ,[Price] = ?\n" +
                "      ,[ProductDetail] = ?\n" +
                "      ,[UnitsInStock] = ?\n" +
                " WHERE ProductID = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product.getCategory().getName());
            st.setString(2, product.getProductName());
            st.setDouble(3, product.getPrice());
            st.setString(4, product.getProductDetail());
            st.setInt(5, product.getUnitInStock());
//            st.setInt(6, product.getProductID());
            return st.executeUpdate();
        }catch (Exception e){
            System.out.println(e);
        }
        return -1;
    }

//-----------------------------------------------------------------CATEGORY---------------------------------------------------------------
    public ArrayList<Category> getCategory(){
        String sql = "SELECT * FROM Categories";
        ArrayList<Category> list = new ArrayList<>();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                int id = rs.getInt("CategoryID");
                String name = rs.getString("CategoryName");
                String img = rs.getString("Picture");
                Category c = new Category(id, name, img);
                list.add(c);
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return list;
    }
//    ------------------------------------------------------MAIN---------------------------------------------------------------
    public static void main(String[] args) {
        ProductDAO pd = new ProductDAO();
//        System.out.println(pd.getProductImages(2).size());
//        System.out.println(pd.getProductByCid(0).size());
////        System.out.println(pd.getOrderFromManager());
//        for ( ManageOrder i : pd.getOrderFromManager()) {
//            System.out.println(i);
//        }
//        System.out.println(pd.countCustomer());
//        for (Category i : pd.getCategory()) {
//            System.out.println(i);
//        }
//
        for (Product i : pd.getProducts()) {
            System.out.println(i);
        }

//        System.out.println(pd.getProduct(1));
    }
}
