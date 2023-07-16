<%-- 
    Document   : product
    Created on : Jul 10, 2023, 4:50:18 PM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="notify.jsp" %>
<c:choose>
    <c:when test="${sessionScope.account != null}">
        <%@ include file="user.jsp" %>
    </c:when>
    <c:otherwise>
        <%@ include file="modallink.jsp" %>
    </c:otherwise>
</c:choose>
<%@ include file="search.jsp" %>
<%@ include file="cart.jsp" %>

<div class="app__container">
    <div class="grid">
        <div class="grid__row app__content">

            <!--  -->
            <div class="single-product">
                <c:set var="product" value="${requestScope.product}"/>
                <div class="grid__row" style="background-color: #fff;">
                    <div class="grid__col-6">
                        <img src="${product.images.get(0)}" width="100%" id="ProductImg">
                        <div class="small-img-row">
                            <c:forEach items="${product.images}" var="imageSRC">
                                <div class="small-img-col">
                                    <img src="${imageSRC}" width="100%" class="small-img">
                                </div> 
                            </c:forEach>
                        </div>
                    </div>
                    <div class="grid__col-6">
                        <p><a href="loadpage" style="text-decoration: none">Home</a> / ${product.category.name}</p>
                        <h1 style="color: var(--primary-color)">${product.productName}</h1>
                        <h4><fmt:formatNumber type="number" groupingUsed="true" value="${product.price}"/> đ</h4>
                        <p class="selled">Đã bán: <span class="selled-number" style="color: rgb(79, 123, 204);">${product.getTotalProductSold()}</span> sản phẩm</p>                       
                        <input id="quantity" type="number" value="1">
                        <c:set var="a" value="${sessionScope.account}"/>
                        <button class="btn single-product__btn" onclick="<c:choose><c:when test='${a == null}'>login()</c:when><c:otherwise>location.href = 'addtocart?productid=${product.ID}&quantity=' + document.getElementById('quantity').value</c:otherwise></c:choose>">
                            Add to cart
                        </button>
                                <h3>Product details <i class="fa fa-indent"></i></h3>
                                <p>
                            <c:forEach items="${product.productDetails}" var="productdetail">
                                ${productdetail} <br/>
                            </c:forEach>
                        </p>

                    </div>
                </div>
            </div>
            <!--  -->
            <!--  -->
            <!-- JSP code -->



        </div>
    </div>
</div>

<script>
    var ProductImg = document.getElementById("ProductImg");
    var SmallImg = document.getElementsByClassName("small-img");

    for (var i = 0; i < SmallImg.length; i++) {
        SmallImg[i].addEventListener("click", function () {
            ProductImg.src = this.src;
        });
    }


</script>
<%@ include file="footer.jsp" %>
<%@ include file="register.jsp" %>
<%@ include file="login.jsp" %>
