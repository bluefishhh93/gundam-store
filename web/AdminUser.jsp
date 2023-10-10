<%-- 
    Document   : AdminOrder
    Created on : Jul 18, 2023, 2:57:29 AM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="AdminHeader.jsp" %>   
<div class="grid__col-10 dashboard-content">
    <div class="logout"><a href="loadpage"><i class="fas fa-sign-out"></i></a></div>
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
                    <td>
                        <a href="disableUser?${user.userID}"><i class="fas fa-user-slash"></i></a>             
                        <a href="giftVoucher?${user.userID}"><i class="fas fa-tags"></i></a>                      
                    </td>

                </tr>
            </c:forEach>

        </table>
    </div>
</div>
<%@ include file="AdminFooter.jsp" %>    
