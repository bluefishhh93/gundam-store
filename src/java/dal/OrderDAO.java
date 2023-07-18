/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Item;
import model.Order;
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
            int orderId = 0;
            // Add into OrderDetails
            if (rs.next()) {
                orderId = rs.getInt(1);
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

            // Add notifycation
            String sql2 = "INSERT INTO [Notifications] values (?, ? ,?, ?, 1)";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, u.getUserID());
            String message = "Đơn hàng " + orderId + " đang trog quá trình vận chuyển và sẽ được giao trong 3-5 ngày tới";
            st2.setString(2, "Đang vận chuyển");
            st2.setString(3, message);
            st2.setDate(4, sqlDate);
            st2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Order> uncheckedOrders(int userID) {
        String sql = "SELECT * FROM ORDERS WHERE OrderStatus = 0 ";
        List<Order> list = new ArrayList<>();
        if (userID != 0) {
            sql += "AND userID =" + userID;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt("OrderID"), rs.getDate("OrderDate"), rs.getDouble("TotalMoney"), rs.getString("ShipAddress"));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public void acceptOrder(int userID, int orderID) {
        java.util.Date currentDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
        String sql = "Update Orders SET OrderStatus = ?, ShippedDate = ? WHERE OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, 1);
            st.setDate(2, sqlDate);
            st.setInt(3, orderID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

        try {
            String sql2 = "INSERT INTO [Notifications] values (?, ? ,?, ?, 2)";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, userID);
            String message = "Đơn hàng " + orderID + " giao dịch thành công, cảm ơn bạn đã sử dụng phục vụ của GundamShop";
            st2.setString(2, "Xác nhận đơn hàng");
            st2.setString(3, message);
            st2.setDate(4, sqlDate);
            st2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void rejectOrder(int userID, int orderID) {
        java.util.Date currentDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
        String sql1 = "SELECT * FROM OrderDetails WHERE OrderID = " + orderID;
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                int quantity = rs.getInt("quantity");
                String sql2 = "UPDATE Products SET UnitsInStock = UnitsInStock + " + quantity + " WHERE ProductID = " + productID;
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.executeUpdate();
            }
            String sql3 = "DELETE FROM OrderDetails WHERE OrderID = " + orderID;
            PreparedStatement st3 = connection.prepareStatement(sql3);
            st3.executeUpdate();

            String sql4 = "Update Orders SET OrderStatus = 2 WHERE OrderID = " + orderID;
            PreparedStatement st4 = connection.prepareStatement(sql4);
            st4.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
        try {
            String sql2 = "INSERT INTO [Notifications] values (?, ? ,?, ?, 3)";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, userID);
            String message = "Bạn đã từ chối đơn hàng " + orderID + ", giao dịch không thành công";
            st2.setString(2, "Xác nhận hủy đơn");
            st2.setString(3, message);
            st2.setDate(4, sqlDate);
            st2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Order> checkedOrdersToDay() {
        String sql = "SELECT * FROM ORDERS WHERE OrderStatus = 1 AND CAST(ShippedDate AS DATE) = CAST(GETDATE() AS DATE);";
        List<Order> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt("OrderID"), rs.getInt("UserID"), rs.getDate("OrderDate"), rs.getDate("ShippedDate"), rs.getDouble("TotalMoney"), rs.getString("ShipAddress"));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public int getNumberOfOrderByID(int userID) {
       String sql = "SELECT COUNT(OrderID) AS Orders\n"
                + "FROM Orders\n"
                + "WHERE UserID = ?";
        int quantity = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID); // set the parameter value
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                quantity = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        
        return quantity;
        
    }

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
        ProductDAO pd = new ProductDAO();
        User user = ud.getUserByEmail("thanh@gmail.com");
//        Cart cart = new Cart();
//        ArrayList<Item> items = new ArrayList<>();
//        items.add(new Item(pd.getProductByID(1), 2, pd.getProductByID(1).getPrice()));
//        items.add(new Item(pd.getProductByID(2), 1, pd.getProductByID(1).getPrice()));
//        cart.setItems(items);
//        
        OrderDAO od = new OrderDAO();
//        System.out.println(od.uncheckedOrders(1).get(0).getTotalMoney());
//        od.addOrder(user, cart, "hongkong macau");
//        od.acceptOrder(1, 29);
System.out.println(od.getNumberOfOrderByID(2));
    }
}
