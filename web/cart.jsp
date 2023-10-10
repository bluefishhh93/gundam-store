<%-- 
    Document   : cart
    Created on : Jul 10, 2023, 4:14:06 PM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- cart.jsp  -->
<!-- Cart layout -->
<div class="header__cart-wrap">
    <div class="header__cart">
        <i class="header__cart-icon fas fa-shopping-cart"></i>
        <c:set var="size" value="${sessionScope.size}"/>
        <span class="header__cart-notice">${size}</span>
        <!-- No cart: header__cart-list--no-cart -->
        <div class="header__cart-list">
            <img src="./assets/img/no-cart.png" alt="" class="header__cart-no-cart-img">
            <span class="header__cart-list-no-cart-msg">Chưa có sản phầm</span>

            <!-- having product -->
            <h4 class="header__cart-heading">Sản phẩm đã thêm</h4>
            <ul class="header__cart-list-item">
                <!-- Cart item -->
                <c:set var="o" value="${sessionScope.cart}"/>
                <c:forEach items="${o.items}" var="i">     

                    <li class="header__cart-item">                       
                        <img src="${i.product.images.get(0)}"
                             alt="" class="header__cart-img">
                        <div class="header__cart-item-info">
                            <div class="header__cart-item-head">
                                <a class="home-product-item" href="singleproduct?productid=${i.product.ID}">
                                    <h5 class="header__cart-item-name">${i.product.productName}
                                    </h5>
                                </a>  
                                <div class="header__cart-item-price-wrap">
                                    <span class="header__cart-item-price"><fmt:formatNumber type="number" groupingUsed="true" value="${p.price}"/> đ</span>
                                    <span class="header__cart-item-multiply">x</span>
                                    <span class="header__cart-item-qnt">${i.quantity}</span>
                                </div>
                            </div>
                            <div class="header__cart-item-body">
                                <span class="header__cart-item-description">
                                    Phân loại: ${i.product.category.name}
                                </span>
                                <form name="processcartform2" action="processcart" method="post">
                                    <input type="hidden" name="idhome" value="${i.product.ID}"/>
                                </form>
                                <span class="header__cart-item-remove" onclick="document.processcartform2.submit()"> Xóa </span>
                            </div>
                        </div>                              
                    </li>
                </c:forEach>                  
            </ul>
            <a href="checkout.jsp" class="header__cart-view-cart btn btn--primary">Thanh toán</a>
            
        </div>
    </div>
</div>
</div>
</div>
</header>
<!-- cart.jsp  -->
