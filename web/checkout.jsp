<%-- 
    Document   : checkout
    Created on : Jul 10, 2023, 4:19:45 PM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="notify.jsp" %>
<%@ include file="user.jsp" %>
<%@ include file="search.jsp" %>
<%@ include file="cart.jsp" %>
<div class="app__container">
    <div class="grid">
        <!-- <div class="grid__row app__content"> -->

        <!--  -->
        <div class="smal-container cart-page">

            <table>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
                <tr>
                    <td>
                        <div class="cart-info">
                            <img src="assets/img/img1.jpg" alt="">
                            <div>
                                <p>RG Gundam Quant</p>
                                <small>Price: $50.00</small>
                                <a href="#">Xóa</a>
                            </div>
                        </div>
                    </td>
                    <td><input type="number" value="1" readonly></td>
                    <td>$50.00</td>
                </tr>
                <tr>
                    <td>
                        <div class="cart-info">
                            <img src="assets/img/img2.jpg" alt="">
                            <div>
                                <p>RG Gundam Quant</p>
                                <small>Price: $50.00</small>
                                <a href="#">Xóa</a>
                            </div>
                        </div>
                    </td>
                    <td><input type="number" value="1" readonly></td>
                    <td>$50.00</td>
                </tr>
                <tr>
                    <td>
                        <div class="cart-info">
                            <img src="assets/img/img3.jpg" alt="">
                            <div>
                                <p>RG Gundam Quant</p>
                                <small>Price: $50.00</small>
                                <a href="#">Xóa</a>
                            </div>
                        </div>
                    </td>
                    <td><input type="number" value="1" readonly></td>
                    <td>$50.00</td>
                </tr>
            </table>


            <div class="total-price">
                <table>          
                    <tr>
                        <td>Total</td>
                        <td>$150.00</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <form action="MyServlet" method="post">
                                <span>Tỉnh/Thành phố:</span> <select name="province" id="province" required></select><br>
                                <span> Quận/Huyện:</span><select name="district" id="district" required>
                                    <option value="">Chọn quận</option>
                                </select><br>
                                <span>Xã/Phường/thị trấn:</span><select name="ward" id="ward" required>
                                    <option value="">Chọn phường</option>
                                </select><br>
                                <span>Địa chỉ:</span><input type="text" placeholder="Ví dụ: 123 Hùng Vương"><br>
                                <input type="submit" value="Thanh toán"><br>
                            </form>
                        </td>
                    </tr>
                </table>
            </div>

        </div>
        <!--  -->
        <!--  -->



    </div>
</div>

<%@ include file="footer.jsp" %>
<%@ include file="register.jsp" %>
<%@ include file="login.jsp" %>
