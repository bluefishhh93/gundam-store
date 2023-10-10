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
import model.Notification;
import model.User;

/**
 *
 * @author xuant
 */
public class UserDAO extends DBcontext {

    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM Users WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getInt("UserID"), rs.getString("Password"),
                        rs.getString("Name"), rs.getString("phone"),
                        rs.getString("Email"), rs.getBoolean("isAdmin"));

                return user;
            }

        } catch (Exception e) {
        }

        return null;
    }
    
    public User getUserById(int userId) {
        String sql = "SELECT * FROM Users WHERE [UserID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getInt("UserID"), rs.getString("Password"),
                        rs.getString("Name"), rs.getString("phone"),
                        rs.getString("Email"), rs.getBoolean("isAdmin"));

                return user;
            }

        } catch (Exception e) {
        }

        return null;
    }

    public User check(String email, String password) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Users]\n"
                + "  WHERE [Email] =?\n"
                + "  AND [Password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getInt("UserID"), rs.getString("Password"),
                        rs.getString("Name"), rs.getString("phone"),
                        rs.getString("Email"), rs.getBoolean("isAdmin"));
                
                NotifyDAO nd = new NotifyDAO();
                user.setNotifications(nd.getUserNotification(user.getUserID()));
                return user;

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void Register(String name, String password, String phone, String email) {
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([Name]\n"
                + "           ,[Password]\n"
                + "           ,[Phone]\n"
                + "           ,[Email]\n"
                + "           ,[isAdmin])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,0)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, password);
            st.setString(3, phone);
            st.setString(4, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public List<User> getAllUser() {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Users]";
        List<User> list = new ArrayList<>();
               
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("UserID"), rs.getString("Password"),
                        rs.getString("Name"), rs.getString("phone"),
                        rs.getString("Email"), rs.getBoolean("isAdmin"));
                
                NotifyDAO nd = new NotifyDAO();
                user.setNotifications(nd.getUserNotification(user.getUserID()));
                list.add(user);

            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
     public int getNumberUser(){
        String sql = "SELECT COUNT(*) FROM Users";
        int number = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                number = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return number;
    }
//     
//     public void deleteUser(int userId){
//         String sql = "DELETE FROM Users WHERE ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, userId);
//            st.executeUpdate();
//        } catch (Exception e) {
//        }
//     }
     
     public void disableUser(int userId){
         
     }
    

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
//        System.out.println(ud.check("thanh@gmail.com", "123321").getUncheckOrder());
//        System.out.println(ud.getNumberUser());
        User user = ud.getUserByEmail("johny@gmail.com");
           System.out.println(user.getUnfeedbackedOrder().get(0).getShippedDate());
           System.out.println(user.getUnfeedbackedProduct(48));
    }
}
