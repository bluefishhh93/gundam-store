<%-- 
    Document   : AdminOrder
    Created on : Jul 18, 2023, 2:57:29 AM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="AdminHeader.jsp" %>   
<div class="grid__col-10 dashboard-content">
    <div class="logout"><i class="fas fa-sign-out"></i></div>
    <div class="title">Danh sách đơn hàng</div>               


    <div class="order-list">
        <div class="search">
            <input type="text" placeholder="Tìm kiếm...">
            <button type="submit"><i class="fas fa-search"></i></button>
        </div>
        <table>
            <tr>
                <th>ID đơn hàng</th>
                <th>Khách hàng</th>
                <th>Số điện thoại</th>
                <th>Địa chỉ</th>
                <th>Ngày mua</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
                <th>Tính năng</th>
            </tr>
            <c:forEach items="${requestScope.uncheckedlist}" var="order">
                <tr>
                    <td>${order.orderID}</td>
                    <td>${order.userID}</td>
                    <td>${order.orderDate}</td>
                    <td>${order.shipAddress}</td>
                    <td>${order.shippedDate}</td>
                    <td><fmt:formatNumber type="number" groupingUsed="true" value="${order.totalMoney}"/> đ</td>
                    <td>Đang vận chuyển</td>
                    <td>
                        <i class="fas fa-trash-alt"></i>
                        <i class="fas fa-edit"></i>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>
</div>
<%@ include file="AdminFooter.jsp" %>    
