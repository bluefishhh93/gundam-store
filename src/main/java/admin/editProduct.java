//package admin;
//
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
////import jakarta.io.IOException;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//
//@WebServlet(name = "editProduct", value = "/edit-product")
//public class editProduct extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int productId = Integer.parseInt(request.getParameter("id"));
////        request form edit product
////        request.getRequestDispatcher("product-edit.jsp").forward(request, response);
//
//        response.setContentType("text/html");
//        PrintWriter out = null;
//        try {
//            out = response.getWriter();
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
//
//        out.println("<html>");
//        out.println("<head>");
//        out.println("<title>Edit Product</title>");
//        out.println("</head>");
//        out.println("<body>");
//        out.println("<h1>Edit Product</h1>");
//
//        // Hiển thị form chỉnh sửa với thông tin sản phẩm
//        out.println("<form method=\"post\" action=\"editProductServlet\">");
//        out.println("Product ID: <input type=\"text\" name=\"id\" value=\"" + product.getID() + "\" readonly><br>");
//        out.println("Product Name: <input type=\"text\" name=\"productName\" value=\"" + product.getProductName() + "\"><br>");
//        out.println("Category: <input type=\"text\" name=\"category\" value=\"" + product.getCategory() + "\"><br>");
//        out.println("Price: <input type=\"text\" name=\"price\" value=\"" + product.getPrice() + "\"><br>");
//        out.println("Product Detail: <input type=\"text\" name=\"productDetail\" value=\"" + product.getProductDetail() + "\"><br>");
//        out.println("Units in Stock: <input type=\"text\" name=\"unitInStock\" value=\"" + product.getUnitInStock() + "\"><br>");
//        out.println("Picture: <input type=\"text\" name=\"picture\" value=\"" + product.getPicture() + "\"><br>");
//        out.println("<input type=\"submit\" value=\"Save\">");
//        out.println("</form>");
//
//        out.println("</body>");
//        out.println("</html>");
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
//}