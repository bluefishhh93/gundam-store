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


    <div class="product-list">
        <div class="search">
            <input type="text" placeholder="Tìm kiếm...">
            <button type="submit"><i class="fas fa-search"></i></button>
        </div>
        <table>
            <tr>
                <th>Mã danh muc</th>
                <th>Tên danh mục</th>
                <th>Hình ảnh</th>
                <th>Tính năng</th>                                  
            </tr>
            <tr>
                <td>1</td>
                <td>RG</td>
                <td><img src="../assets/img/HGlogo.jpg" alt=""></td>
                <td>
                    <i class="fas fa-trash-alt"></i>
                    <i class="fas fa-edit"></i>
                </td>


        </table>
    </div>
</div>
<%@ include file="AdminFooter.jsp" %>    
