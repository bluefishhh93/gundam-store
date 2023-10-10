/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author xuant
 */
@WebServlet(name = "ProcessCartServlet", urlPatterns = {"/processcart"})
public class ProcessCartServlet extends HttpServlet {

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
            out.println("<title>Servlet ProcessCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessCartServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        //existed
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }

        String tnum = request.getParameter("num").trim();
        String tid = request.getParameter("id");
        int id, num;
        try {
            num = Integer.parseInt(tnum);
            id = Integer.parseInt(tid);
            if (num == -1 && cart.getQuantityById(id) <= 1) {
                cart.removeItem(id);
            } else {
                ProductDAO pdb = new ProductDAO();
                Product p = pdb.getProductByID(id);
                double price = p.getPrice(); //tang gia so voi gia binhthuong
                Item t = new Item(p, num, price);
                cart.addItem(t);
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        //existed
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        String tid = request.getParameter("id");
        String tidHome = request.getParameter("idhome");
        int id;
        try {
            if (tid != null) {
                id = Integer.parseInt(tid);
                cart.removeItem(id);
                List<Item> list = cart.getItems();
                session.setAttribute("cart", cart);
                session.setAttribute("size", list.size());
//                response.sendRedirect("checkout.jsp");
            } else {
                id = Integer.parseInt(tidHome);
                cart.removeItem(id);
                List<Item> list = cart.getItems();
                session.setAttribute("cart", cart);
                session.setAttribute("size", list.size());
//                response.sendRedirect("loadpage");
            }
        } catch (Exception e) {
        }
        String referer = request.getHeader("referer");
        if (referer != null) {
            response.sendRedirect(referer);
        }

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
