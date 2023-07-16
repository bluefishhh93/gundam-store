<%-- 
    Document   : home-product
    Created on : Jul 10, 2023, 4:15:09 PM
    Author     : xuant
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- home-product.jsp -->
<div class="home-product">
    <div class="grid__row">
        <c:forEach items="${requestScope.data}" var="p">
            <div class="grid__col-2-4">
                <!-- Product item -->
                <a class="home-product-item" href="singleproduct?productid=${p.ID}">
                    <div class="home-product-item__img"
                         style="background-image:url('${p.images.get(0)}');">
                    </div>
                    <h4 class="home-product-item__name">${p.productName}</h4>
                    <div class="home-product-item__price">
                        <span class="home-product-item__price-old"><fmt:formatNumber type="number" groupingUsed="true" value="${p.price*1.1}"/> đ</span>
                        <span class="home-product-item__price-current"><fmt:formatNumber type="number" groupingUsed="true" value="${p.price}"/> đ</span>
                    </div>
                    <div class="home-product-item__action">
                        <span class="home-product-item__like home-product-item__like--liked">
                            <i class="home-product-item__like-icon-empty far fa-heart"></i>
                            <i class="home-product-item__like-icon-fill fas fa-heart"></i>
                        </span>
                        <div class="home-product-item__rating">
                            <i class="home-product-item__star--gold fas fa-star"></i>
                            <i class="home-product-item__star--gold fas fa-star"></i>
                            <i class="home-product-item__star--gold fas fa-star"></i>
                            <i class="home-product-item__star--gold fas fa-star"></i>
                            1`
                        </div>
                        <span class="home-product-item__sold">${p.getTotalProductSold()} đã bán</span>
                    </div>
                    <div class="home-product-item__origin">
                        <span class="home-product-item__brand">${p.brand}</span>
                        <span class="home-product-item__origin-name">Nhật Bản</span>
                    </div>
                    <div class="home-product-item__favourite">
                        <i class="fas fa-check"></i>
                        <span>Yêu thích</span>
                    </div>
                    <div class="home-product-item__sale-off">
                        <span class="home-product-item__sale-off-percent">10%</span>
                        <span class="home-product-item__sale-off-label">GIẢM</span>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>
<ul class="home-product__pagination pagnigation">
    
    
</ul>
 <script src="assets/js/paging.js"></script>
</div>
</div>
</div>
</div>
<!-- home-product.jsp -->



