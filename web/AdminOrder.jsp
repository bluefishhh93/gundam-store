<%-- 
    Document   : AdminOrder
    Created on : Jul 18, 2023, 2:57:29 AM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="AdminHeader.jsp" %>   
<div class="grid__col-10 dashboard-content">
    <div class="logout"><a href="loadpage"><i class="fas fa-sign-out"></i></a></div>
    <div class="title">Danh sách đơn hàng</div>               
    <style>
/*        .order-table tr td:last-child{
            display: flex;
            justify-content: space-between
            
        }*/
        .order-table .fas{
                padding: 10px;
                border-radius: 5px;
                cursor: pointer;
            }

            .order-table a:first-child {
                background-color: rgb(238, 109, 109);
                color: red;
                border-radius: 2px;
                padding: 5px
            }

            .order-table a:nth-child(2) {
                background-color: rgb(169, 245, 169);
                color: green;
                border-radius: 2px;
                padding: 5px
            }
    </style>

    <div class="order-list">
        <div class="search">
            <input type="text" placeholder="Tìm kiếm...">
            <button type="submit"><i class="fas fa-search"></i></button>
        </div>
        <table class="order-table">
            <tr>
                <th>ID đơn hàng</th>
                <th>ID Khách hàng</th>
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
                    <td>${order.shipAddress}</td>
                    <td>${order.orderDate}</td>
                    <td><fmt:formatNumber type="number" groupingUsed="true" value="${order.totalMoney}"/> đ</td>
                    <td>Đang vận chuyển</td>
                    <td>
                        <a href="processorder?action=reject&id=${order.orderID}&uid=${u.userID}"><i class="fas fa-trash-alt"></i></a>
                        <a href="processorder?action=accept&id=${order.orderID}&uid=${u.userID}"><i class="fas fa-check"></i></a>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>
</div>
<%@ include file="AdminFooter.jsp" %>    
