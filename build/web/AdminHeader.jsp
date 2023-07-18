<%-- 
    Document   : AdminHeader
    Created on : Jul 18, 2023, 2:54:55 AM
    Author     : xuant
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Page</title>
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="dashboard">
            <div class="grid__full-width">
                <div class="grid__row">
                    <div class="grid__col-2 dashboard-sidebar">
                        <div class="dashboard-profile">
                            <div class="profile-avatar">
                                <img src="assets/img/admin.png" alt="admin">
                            </div>
                            <h4>Admin</h4>
                            <p class="profile-notify">Chào mừng bạn đã trở lại</p>
                        </div>
                        <div class="dashboard-navigation">
                            <ul class="navigation-list">
                                <li class="navigation-item"><a href="dashboardmanager"><i class="fas fa-tachometer-alt-fast"></i>Bảng điều khiển</a></li>
                                <li class="navigation-item"><a href="usermanager"><i class="fas fa-user-circle"></i>Quản lí khách hàng</a></li>
                                <li class="navigation-item"><a href="productmanager"><i class="fas fa-tags"></i>Quản lí sản phẩm</a></li>
                                <li class="navigation-item"><a href="ordermanager"><i class="fas fa-gift"></i>Quản lí đơn hàng</a></li>
                                <li class="navigation-item"><a href="categorymanager"><i class="fas fa-gift"></i>Quản lí danh mục</a></li>
                            </ul>
                        </div>
                    </div>
