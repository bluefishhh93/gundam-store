/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.FeedbackDAO;
import dal.NotifyDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.Product;
import model.User;

/**
 *
 * @author xuant
 */
@WebServlet(name = "FeedbackServlet", urlPatterns = {"/feedback"})
public class FeedbackServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FeedbackServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //get order id from the form
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        ProductDAO pd = new ProductDAO();

        //get order by orderid
        OrderDAO od = new OrderDAO();
        Order order = od.getOrderById(orderId);

        //get list of product of the order by id
        List<Product> orderList = pd.getProductsForOrder(orderId);

        //get feedback date
        java.util.Date currentDate = new java.util.Date();
        java.sql.Date createAt = new java.sql.Date(currentDate.getTime());

        FeedbackDAO fd = new FeedbackDAO();
        NotifyDAO nd = new NotifyDAO();
        for (Product product : orderList) {
            int star = Integer.parseInt(request.getParameter("rating_" + product.getID()));
            String content = request.getParameter("feedback_" + product.getID());
            fd.createNewFeedback(product.getID(), content, order.getUserID(), star, createAt);
            od.setIsFeedbacked(orderId);
            nd.removeFeedbackedNotify(orderId);
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        user.setNotifications(nd.getUserNotification(user.getUserID()));
//        user.setNotifications(nd.getUserNotification(user.getUserID()));

        String referer = request.getHeader("referer");
        if (referer != null) {
            response.sendRedirect(referer);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String[] productIds = request.getParameterValues("product[id]");
//        int orderId = Integer.parseInt(request.getParameter(string))
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
