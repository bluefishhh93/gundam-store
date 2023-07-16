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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author xuant
 */
@WebServlet(name = "FilterProductServlet", urlPatterns = {"/filterproduct"})
public class FilterProductServlet extends HttpServlet {

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
            out.println("<title>Servlet FilterProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterProductServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        String sql = "";
        if (action.equals("popular") || action.equals("new") || action.equals("ascprice") || action.equals("descprice")) {
            sql = "SELECT [ProductID]\n"
                    + "      ,[ProductName]\n"
                    + "      ,[CategoryID]\n"
                    + "      ,[price]\n"
                    + "      ,[UnitsInStock]\n"
                    + "      ,[Brand]\n"
                    + "  FROM [dbo].[products]\n";

            switch (action) {
                case "popular":
                    sql += "  ORDER BY UnitsInStock DESC";
                    break;
                case "new":
                    sql += "  ORDER BY ProductID DESC";
                    break;
                case "ascprice":
                    sql += "  ORDER BY price";
                    break;
                case "descprice":
                    sql += "  ORDER BY price DESC";
                    break;
                default:
                    break;
            }

        } else if (action.equals("best")) {
            sql = "SELECT Products.ProductName, Products.CategoryID, Products.Price, Products.UnitsInStock, Products.Brand, SUM(OrderDetails.Quantity) AS TotalQuantitySold\n"
                    + "FROM Products\n"
                    + "INNER JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID\n"
                    + "GROUP BY Products.ProductName, Products.CategoryID, Products.Price, Products.UnitsInStock, Products.Brand\n"
                    + "ORDER BY TotalQuantitySold DESC;";
        } else if (action.equals("search")) {
            String key = request.getParameter("searchcontent");
            sql = "SELECT * FROM Products WHERE Productname like '%" + key + "%'";
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie cookie : arr) {
                    if (cookie.getName().equals("searchhistory")) {
                        txt += cookie.getValue();
                        // Remove the line below if you want to update the cookie value instead of deleting it
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            }
            if (txt.isEmpty()) {
                txt = key;
            } else {
                txt = txt + "/" + key;
            }

            Cookie c = new Cookie("searchhistory", txt);
            c.setMaxAge(2 * 60);
            response.addCookie(c);
        } else {
            sql = "SELECT * FROM Products WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName =";
            switch (action) {
                case "HG":
                    sql += "'HG')";
                    break;
                case "RG":
                    sql += "'RG')";
                    break;
                case "MG":
                    sql += "'MG')";
                    break;
                case "PG":
                    sql += "'PG')";
                    break;
                case "TOOL":
                    sql += "'TOOL')";
                    break;
                default:
                    break;
            }
        }

        ProductDAO pd = new ProductDAO();

        request.setAttribute(
                "data", pd.getProductByFilter(sql));
        request.getRequestDispatcher(
                "loadpage").forward(request, response);

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
        processRequest(request, response);
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


/*
} else if (action.equals("new")) {
            sql = "SELECT [ProductID]\n"
                    + "      ,[ProductName]\n"
                    + "      ,[CategoryID]\n"
                    + "      ,[price]\n"
                    + "      ,[UnitsInStock]\n"
                    + "      ,[Brand]\n"
                    + "  FROM [dbo].[products]\n"
                    + "  ORDER BY ProductID DESC";
 */
