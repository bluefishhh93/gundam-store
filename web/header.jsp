<%-- 
    Document   : header
    Created on : Jul 10, 2023, 4:11:10 PM
    Author     : xuant
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- header.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
        integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
    <div class="app">

        <header class="header">
            <div class="grid">
                <nav class="header__navbar">
                    <ul class="header__navbar-list">
                        <li class="header__navbar-item">Kênh Người Bán</li>
                        <li class="header__navbar-item header__navbar-item--has-qr header__navbar-item--separate">
                            Tải
                            ứng dụng
                            <div class="header__qr">
                                <img src="assets/img/qrCode.png" alt="QR code" class="header__qr-img">
                                <div class="header__qr-apps">
                                    <a target=”_blank” href="https://apps.apple.com/vn/app/id959841449"
                                        class="header__qr-link"> <img src="./assets/img/appstore.png" alt="App Store"
                                            class="header__qr-download-img"></a>
                                    <a target=”_blank”
                                        href="https://play.google.com/store/apps/details?id=com.shopee.vn&hl=vi&gl=US&pli=1"
                                        class="header__qr-link"> <img src="./assets/img/ggplay.png" alt="Google Play"
                                            class="header__qr-download-img"></a>
                                    <a target=”_blank” href="https://appgallery.huawei.com/app/C101433653"
                                        class="header__qr-link"> <img src="./assets/img/appgallery.png" alt="Gallary"
                                            class="header__qr-download-img"></a>
                                </div>
                            </div>
                        </li>
                        <li class="header__navbar-item">
                            <span class="header__navbar-item--no-pointer">Kết nối</span>
                            <a href="https://www.facebook.com/ShopeeVN" target=”_blank”
                                class="header__navbar-item-link"><i
                                    class="header__navbar-icon fa-brands fa-facebook"></i></a>
                            <a href="https://www.instagram.com/Shopee_VN/" target=”_blank”
                                class="header__navbar-item-link"><i
                                    class="header__navbar-icon fa-brands fa-instagram"></i></a>
                        </li>
                        <!-- <li class="header_navbar-item"></li>
                    <li class="header_navbar-item"></li>
                    <li class="header_navbar-item"></li> -->
                    </ul>
<!-- header.jsp -->
