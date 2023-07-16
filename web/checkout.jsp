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
                <c:set var="o" value="${sessionScope.cart}"/>
                <c:forEach items="${o.items}" var="i">
                    <tr>
                        <td>
                            <div class="cart-info">
                                <img src="${i.product.images.get(0)}" alt="">
                                <div>
                                    <p>${i.product.productName}</p>
                                    <small><fmt:formatNumber type="number" groupingUsed="true" value="${i.product.price}"/> đ</small>
                                    <a id="remove-product" href="">Xóa</a>
                                    <form name="processcartform" action="processcart" method="post">
                                        <input type="hidden" name="id" value="${i.product.ID}"/>
                                    </form>

                                </div>
                            </div>
                        </td>
                        <td>
                            <a style="padding-right: 15px" href="processcart?num=-1&id=${i.product.ID}"><i class="fas fa-minus"></i></a>                        
                            <input type="number" value="${i.quantity}" readonly>
                            <a href="processcart?num=1&id=${i.product.ID}"><i class="fas fa-plus"></i></a>                  
                        </td>
                        <td><fmt:formatNumber type="number" groupingUsed="true" value="${i.product.price * i.quantity}"/> đ</td>
                    </tr>
                </c:forEach>
            </table>


            <div class="total-price">
                <table>          
                    <tr>
                        <td>Total</td>
                        <td><fmt:formatNumber type="number" groupingUsed="true" value="${cart.getTotalMoney()}"/> đ</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <form action="checkout" method="post">
                                <span>Tỉnh/Thành phố:</span> <select name="province" id="province" required></select><br>
                                <span> Quận/Huyện:</span><select name="district" id="district" required>
                                    <option value="">Chọn quận</option>
                                </select><br>
                                <span>Xã/Phường/thị trấn:</span><select name="ward" id="ward" required>
                                    <option value="">Chọn phường</option>
                                </select><br>
                                <span>Địa chỉ:</span><input type="text" placeholder="Ví dụ: 123 Hùng Vương" name="address"><br>
                                <input type="submit" value="Thanh toán"><br>
                            </form>
                        </td>
                    </tr>
                </table>
            </div>

        </div>
        <!--  -->
        <!--  -->


        <script>
            // Get the link element by its id
            var link = document.getElementById("remove-product");
            // Get the form element by its name
            var form = document.forms["processcartform"];
            // Add a click event listener to the link
            link.addEventListener("click", function (event) {
                // Prevent the default behavior of the link
                event.preventDefault();
                // Submit the form
                form.submit();
            });
        </script>

    </div>
</div>

<%@ include file="footer.jsp" %>
<%@ include file="register.jsp" %>
<%@ include file="login.jsp" %>
