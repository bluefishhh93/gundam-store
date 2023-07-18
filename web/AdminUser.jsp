<%-- 
    Document   : AdminOrder
    Created on : Jul 18, 2023, 2:57:29 AM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="AdminHeader.jsp" %>   
<div class="grid__col-10 dashboard-content">
    <div class="logout"><i class="fas fa-sign-out"></i></div>
    <div class="title">Danh sách khách hàng</div>               


    <div class="user-list">
        <div class="search">
            <input type="text" placeholder="Tìm kiếm...">
            <button type="submit"><i class="fas fa-search"></i></button>
        </div>
        <table>
            <tr>
                <th>ID khách hàng</th>
                <th>Tên khách hàng</th>
                <th>Email</th>
                <th>Số đơn hàng đã mua</th>
                <th>isAdmin</th>
                <th>Tính năng</th>                                    
            </tr>
            <c:forEach items="${requestScope.userlist}" var="user">
                <tr>
                <td>${user.userID}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.getNumberOfOrder()}</td>
                <td>${user.isAdmin}</td>
                <td><a><i class="fas fa-trash-alt"></i></a></td>
            </tr>
            </c:forEach>

        </table>
    </div>
</div>
<%@ include file="AdminFooter.jsp" %>    
