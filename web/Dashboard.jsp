<%-- 
    Document   : Dashboard
    Created on : Jul 18, 2023, 2:56:46 AM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="AdminHeader.jsp" %>   

<!-- AdminDashboard.jsp -->
<div class="grid__col-10 dashboard-content">
    <div class="logout"><a href="loadpage"><i class="fas fa-sign-out"></i></a></div>
    <div class="title">Bảng điều khiển</div>               
    <div class="information">
        <div class="information__item">
            <i class="fas fa-users"  style="background-color: rgb(169, 245, 169); color: green;"></i>
            <div class="information__item-content">
                <h2>Tổng khách hàng</h2>
                <h3>${requestScope.customerNum} khách hàng</h3>
                <p>Tổng số khách hàng được quản lý</p>
            </div>
        </div>
        <div class="information__item">
            <i class="fas fa-coins" style="background-color:  rgb(91, 176, 241); color: blue;"></i>
            <div class="information__item-content">
                <h2>Tổng sản phẩm</h2>
                <h3>${requestScope.productNum} sản phẩm</h3>
                <p>Tổng số sản phẩm được quản lý</p>
            </div>
        </div>
        <div class="information__item">
            <i class="fab fa-shopify" style="background-color: rgb(245, 212, 152); color: orange;"></i>
            <div class="information__item-content">
                <h2>Tổng đơn hàng</h2>
                <h3>${requestScope.orderNum} đơn hàng</h3>
                <p>Tổng số đơn hàng được quản lý</p>
            </div>
        </div>
        <div class="information__item">
            <i class="fas fa-exclamation-triangle" style="background-color:  rgb(238, 109, 109); color: red;"></i>
            <div class="information__item-content">
                <h2>Sắp hết hàng</h2>
                <h3>${requestScope.outOfStockNum} sản phẩm</h3>
                <p>Tổng số sản phẩm được quản lý</p>
            </div>
        </div>

    </div>
    <!-- AdminDashboard.jsp -->
    <!-- AdminOrderToday.jsp -->
    <div class="customer-today">
        <h1>Đơn hàng hôm nay</h1>
        <table>
            <tr>
                <th>ID đơn hàng</th>
                <th>ID Khách hàng</th>
                <th>Ngày đặt</th>
                <th>Địa chỉ</th>
                <th>Ngày nhận</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
            </tr>
            <c:forEach items="${requestScope.checkedlist}" var="order">
                <tr>
                <td>${order.orderID}</td>
                <td>${order.userID}</td>
                <td>${order.orderDate}</td>
                <td>${order.shipAddress}</td>
                <td>${order.shippedDate}</td>
                <td><fmt:formatNumber type="number" groupingUsed="true" value="${order.totalMoney}"/> đ</td>
                <td>Đã hoàn thành</td>
                </tr>
            </c:forEach>

        </table>
    </div>
    <!-- AdminOrderToday.jsp -->
</div>
<%@ include file="AdminFooter.jsp" %>    


