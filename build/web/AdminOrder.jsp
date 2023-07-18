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
            </tr>
            <tr>
                <td>1</td>
                <td>Mai Lê</td>
                <td>0134245345</td>
                <td>Da Nang</td>
                <td>2023-02-02</td>
                <td>520.000$</td>
                <td>Đã hoàn thành</td>
            </tr>
            <tr>
                <td>2</td>
                <td>Thanh Lê</td>
                <td>0134245345</td>
                <td>Quang Nam</td>
                <td>2023-02-02</td>
                <td>780.000$</td>
                <td>Đã hoàn thành</td>
            </tr>

        </table>
    </div>
</div>
<%@ include file="AdminFooter.jsp" %>    
