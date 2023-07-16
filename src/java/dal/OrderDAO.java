/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Cart;
import model.Item;
import model.User;

/**
 *
 * @author xuant
 */
public class OrderDAO extends DBcontext {

    public void addOrder(User u, Cart cart, String address) {
        java.util.Date currentDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
        try {
            // Add into Order table
            String sql = "INSERT INTO [Orders] (UserID, [OrderDate], [ShipAddress], [TotalMoney] , [OrderStatus]) VALUES(?,?,?,?,0)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getUserID());
            st.setDate(2, sqlDate);
            st.setString(3, address);
            st.setDouble(4, cart.getTotalMoney());
            st.executeUpdate();

            // Get the Order just added
            String sql1 = "SELECT TOP 1 OrderID FROM [Orders] ORDER BY OrderID DESC";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();

            // Add into OrderDetails
            if (rs.next()) {
                int orderId = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT INTO [OrderDetails] (OrderID, ProductID, UnitPrice, Quantity) VALUES(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, orderId);
                    st2.setInt(2, i.getProduct().getID());
                    st2.setDouble(3, i.getPrice());
                    st2.setInt(4, i.getQuantity());
                    st2.executeUpdate();

                    // Decrease UnitsInStock for the product
                    String updateStockSql = "UPDATE [Products] SET UnitsInStock = UnitsInStock - ? WHERE ProductID = ?";
                    PreparedStatement updateStockStmt = connection.prepareStatement(updateStockSql);
                    updateStockStmt.setInt(1, i.getQuantity());
                    updateStockStmt.setInt(2, i.getProduct().getID());
                    updateStockStmt.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
        ProductDAO pd = new ProductDAO();
        User user = ud.getUserByEmail("thanh@gmail.com");
        Cart cart = new Cart();
        ArrayList<Item> items = new ArrayList<>();
        items.add(new Item(pd.getProductByID(1), 2, pd.getProductByID(1).getPrice()));
        items.add(new Item(pd.getProductByID(2), 1, pd.getProductByID(1).getPrice()));
        cart.setItems(items);
        
        OrderDAO od = new OrderDAO();
        od.addOrder(user, cart, "hongkong macau");
    }
}
