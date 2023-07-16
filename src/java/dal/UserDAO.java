/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    public User check(String Email, String password) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Users]\n"
                + "  WHERE [Email] =?\n"
                + "  AND [Password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getInt("UserID"), rs.getString("Password"),
                        rs.getString("Name"), rs.getString("phone"),
                        rs.getString("Email"), rs.getBoolean("isAdmin"));

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

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
        System.out.println(ud.check("thanh@gmail.com", "123321").getName());
    }
}
