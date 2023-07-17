/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.regex.Pattern;
import model.User;

/**
 *
 * @author xuant
 */
@WebServlet(name="RegisterServlet", urlPatterns={"/register"})
public class RegisterServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ArrayList<String> messages = new ArrayList<String>();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String password = request.getParameter("pass");
        String confirmPassword = request.getParameter("cpass");
        String email = request.getParameter("email");

        String phoneRegex = "/^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/";
        String passwordRegex = "^\\S{3,8}$";
        Pattern patternPW = Pattern.compile(passwordRegex);
        Pattern patternPhone = Pattern.compile(phoneRegex);
        boolean checkPassword = patternPW.matcher(password).matches();
        boolean checkPhone = patternPhone.matcher(phone).matches();

        UserDAO ud = new UserDAO();
        //Create account
        User user = ud.getUserByEmail(email);
        if (user != null) {          
            messages.add("This email was registered!");
            request.setAttribute("messages", messages);      
            request.getRequestDispatcher("loadpage").forward(request, response);
        }
        //checking before create new account
        if (!checkPhone || !checkPassword) {
            if (!checkPhone) {
                messages.add("Invalid phone");
            }

            if (!checkPassword) {
                messages.add("Password length must be [3-8] and does not have space");
            }
            request.setAttribute("messages", messages);
            request.getRequestDispatcher("loadpage").forward(request, response);
        } else if (!password.equals(confirmPassword)) {
            messages.add("Password do not match!");
            request.setAttribute("messages", messages);
            request.getRequestDispatcher("loadpage").forward(request, response);
        }
        
        ud.Register(name, password, phone, email);
        request.getRequestDispatcher("loadpage").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
