package admin;

import dal.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;

import java.io.IOException;
import java.util.ArrayList;
//import jakarta.io.IOException;

@WebServlet(name = "productList", value = "/product-list")
public class productList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        return to AdminTemplate/index.html
        try {
            ProductDAO pd = new ProductDAO();
            ArrayList<Product> list = pd.getProducts();
            request.setAttribute("list", list);
            request.getRequestDispatcher("product-list.jsp").forward(request, response);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}