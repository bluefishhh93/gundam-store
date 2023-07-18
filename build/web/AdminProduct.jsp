<%-- 
    Document   : AdminOrder
    Created on : Jul 18, 2023, 2:57:29 AM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="AdminHeader.jsp" %>   
<div class="grid__col-10 dashboard-content">
    <div class="logout"><i class="fas fa-sign-out"></i></div>
    <div class="title">Danh sách sản phẩm</div>               
    <style>
        .home-product__pagination {
            display: flex;
            gap: 10px;
            justify-content: center; /* Horizontally center the items */
            align-items: center;
        }




    </style>

    <div class="product-list">
        <div class="search">
            <input type="text" placeholder="Tìm kiếm...">
            <button type="submit"><i class="fas fa-search"></i></button>
        </div>
        <table class="admin-product-list">
            <tr>
                <th>Mã sản phẩm</th>
                <th>Danh mục</th>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
                <th>Thông tin sản phẩm</th>
                <th>Số lượng</th>
                <th>Hình ảnh</th>
                <th>Tính năng</th>                                    
            </tr>
            <c:forEach items="${requestScope.productlist}" var="product">
                <tr class="admin-product-list_item">
                    <td>${product.ID}</td>
                    <td>${product.category.name}</td>
                    <td>${product.productName}</td>
                    <td><fmt:formatNumber type="number" groupingUsed="true" value="${product.price}"/> đ</td>
                    <td>${fn:join(product.productDetails.toArray(), ". ")}</td>
                    <td>4</td>
                    <td><img src="${product.images.get(0)}" alt=""></td>
                    <td>
                        <i class="fas fa-trash-alt"></i>
                        <i class="fas fa-edit"></i>
                    </td>
                </tr>
            </c:forEach>             
        </table>
        <ul class="home-product__pagination pagnigation" style="list-style: none">
        </ul>
    </div>
</div>
<%@ include file="AdminFooter.jsp" %>    
