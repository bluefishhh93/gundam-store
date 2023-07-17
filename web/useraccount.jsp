<%-- 
    Document   : checkout
    Created on : Jul 10, 2023, 4:19:45 PM
    Author     : xuant
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">


        <title>profile edit data and skills - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="assets/css/base.css">
        <link rel="stylesheet" href="assets/css/main.css">
        <style type="text/css">
            body{
                background: #f7f7ff;
                margin-top:20px;
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid transparent;
                border-radius: .25rem;
                margin-bottom: 1.5rem;
                box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
            }
            .me-2 {
                margin-right: .5rem!important;
            }

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
    </head>
    <body style="margin: 0; font-size: 1.5rem">
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
                        <%@ include file="notify.jsp" %>
                        <%@ include file="user.jsp" %>
                        <%@ include file="search.jsp" %>
                        <%@ include file="cart.jsp" %>
                        <div class="container">
                            <div class="main-body">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <c:set value="${sessionScope.account}" var="u"/>
                                                <div class="d-flex flex-column align-items-center text-center">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
                                                    <div class="mt-3">
                                                        <h4>${u.name}</h4>
                                                        <p class="text-secondary mb-1">Full Stack Developer</p>
                                                        <p class="text-muted font-size-sm">Bay Area, San Francisco, CA</p>
                                                        <button class="btn btn-primary">Change avatar</button>
                                                        <button class="btn btn-outline-primary">Message</button>
                                                    </div>
                                                </div>
                                                <hr class="my-4">
                                                <ul class="list-group list-group-flush">                                                
                                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                        <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-instagram me-2 icon-inline text-danger"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>Instagram</h6>
                                                        <!--<span class="text-secondary">bootdey</span>-->
                                                    </li>
                                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                        <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-facebook me-2 icon-inline text-primary"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>Facebook</h6>
                                                        <!--<span class="text-secondary">bootdey</span>-->
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row mb-3">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">Full Name</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        <input type="text" class="form-control" value="${u.name}">
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">Email</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        <input type="text" class="form-control" value="${u.email}">
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">Phone</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        <input type="text" class="form-control" value="${u.phone}">
                                                    </div>
                                                </div>                                             
                                                <div class="row mb-3">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">Password</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        <input type="password" class="form-control" value="${u.password}">
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">Confirm password</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        <input type="password" class="form-control" value="${u.password}">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-3"></div>
                                                    <div class="col-sm-9 text-secondary">
                                                        <input type="button" class="btn btn-primary px-4" value="Save Changes">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h5 class="d-flex align-items-center mb-3">Order Status</h5>
                                                        <table style="font-size: 1rem" class="order-table">
                                                            <tr>
                                                                <th>Mã đơn hàng</th>
                                                                <th>Ngày đặt</th>
                                                                <th>Địa chỉ</th>
                                                                <th>Số điện thoại</th>
                                                                <th>Tổng Tiền</th>
                                                                <th>Trạng thái</th>
                                                                <th>Tính năng</th>                                    
                                                            </tr>
                                                            <c:forEach items="${u.getUncheckOrder()}" var="uncheckorder">
                                                            <tr>
                                                                <td>${uncheckorder.orderID}</td>
                                                                <td>${uncheckorder.orderDate}</td>
                                                                <td>${uncheckorder.shipAddress}</td>
                                                                <td>${u.phone}</td>
                                                                <td><fmt:formatNumber type="number" groupingUsed="true" value="${uncheckorder.totalMoney}"/> đ</td>
                                                                <td>Đang vận chuyển</td>
                                                                <td>
                                                                    <a href="processorder?action=reject&id=${uncheckorder.orderID}&uid=${u.userID}"><i class="fas fa-trash-alt"></i></a>
                                                                    <a href="processorder?action=accept&id=${uncheckorder.orderID}&uid=${u.userID}"><i class="fas fa-check"></i></a>
                                                                </td>
                                                            <script>
                                                                
                                                            </script>
                                                            </tr>              
<!--                                                            <tr>
                                                                <td>SP1</td>
                                                                <td>2023-17-07</td>
                                                                <td>Đà nẵng</td>
                                                                <td>0372343515</td>
                                                                <td>520.000$</td>
                                                                <td>Trạng thái</td>
                                                                <td>
                                                                    <i class="fas fa-trash-alt"></i>
                                                                    <i class="fas fa-check"></i>
                                                                </td>
                                                            </tr>              -->
                                                            </c:forEach>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%@ include file="footer.jsp" %>
