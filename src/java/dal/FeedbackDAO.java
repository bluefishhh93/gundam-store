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
import model.Feedback;
import model.Notification;

/**
 *
 * @author xuant
 */
public class FeedbackDAO extends DBcontext {

    public List<Feedback> getFeedbackByProductId(int productId) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM [Feedbacks] WHERE [productId] = ?";
        UserDAO ud = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int feedbackID = rs.getInt("FeedbackID");
                String content = rs.getString("Content");
                int userId = rs.getInt("UserID");
                int star = rs.getInt("Star");
                Date createAt = rs.getDate("CreatedAt");
                Feedback feedback = new Feedback(feedbackID, productId, content, ud.getUserById(userId), star, createAt);
                list.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Integer> getNumberOfEachStar(int productId) {
        List<Integer> starCounts = new ArrayList<>();
        String sql = "SELECT Star, COUNT(*) AS count \" +\n"
                + "                       \"FROM Feedbacks \" +\n"
                + "                       \"WHERE ProductId = ? \" +\n"
                + "                       \"GROUP BY Star ORDER BY Star";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int count = rs.getInt("count");
                starCounts.add(count);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return starCounts;
    }

    public int getNumberOfFeedback(int productId) {
        String sql = "SELECT ProductID, COUNT(*) AS count FROM Feedbacks WHERE ProductID = ?"
                + "GROUP BY ProductID"
                + "WHERE ProductID = ?";
        int numberOfFeedback = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                numberOfFeedback = rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return numberOfFeedback;
    }

    public void createNewFeedback(int productId, String content, int userId, int star, Date createAt) {
        String sql = "INSERT INTO Feedbacks VALUES(?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            if (content == null || content.trim().isEmpty()) {
                st.setNull(2, java.sql.Types.VARCHAR);
            } else {
                st.setString(2, content);
            }

            st.setInt(3, userId);
            st.setInt(4, star);
            st.setDate(5, createAt);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        FeedbackDAO fd = new FeedbackDAO();
        System.out.println(fd.getFeedbackByProductId(2).get(0).getUser().getName());
        UserDAO ud = new UserDAO();
        System.out.println(ud.getUserById(5).getName());
    }
    

}
