/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Notification;

/**
 *
 * @author xuant
 */
public class NotifyDAO extends DBcontext{
    public List<Notification> getUserNotification(int userID){
        List<Notification> list = new ArrayList<>();
        String sql = "SELECT * FROM [Notifications] WHERE [UserID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                int notificationID = rs.getInt("NotificationID");
                String title = rs.getString("Title");
                String message = rs.getString("Message");
                Date createAt = rs.getDate("CreatedAt");
                int type = rs.getInt("type");
                Notification notify = new Notification(notificationID, userID, title, message, createAt ,type);
                list.add(notify);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public void removeUserNotication(int notificationID){
        String sql = "DELETE FROM Notifications WHERE NotificationID = " + notificationID;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        
    }
    public static void main(String[] args) {
        NotifyDAO nd = new NotifyDAO();
        nd.removeUserNotication(2);
    }
}
