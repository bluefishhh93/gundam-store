<%-- 
    Document   : user
    Created on : Jul 10, 2023, 4:13:20 PM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--                        <li class="register-button header__navbar-item header__navbar-item--strong  header__navbar-item--separate">Đăngký</li>
                        <li class="login-button header__navbar-item header__navbar-item--strong">Đăng nhập</li>-->
                         <li class="header__navbar-item header__navbar-user">
                            <img class="header__navbar-user-img"
                                 src="assets/img/user.jpg"
                                alt="">
                            <span class="header__navbar-user-name">${sessionScope.account.name}</span>
                            <ul class="header__navbar-user-menu">
                                <li class="header__navbar-user-item"><a href="#">Tài khoản của tôi</a></li>
                                <li class="header__navbar-user-item"><a href="#">Đơn mua</a></li>
                                <li class="header__navbar-user-item"><a href="#">Đăng xuất</a></li>
                            </ul>
                        </li> 
                    </ul>
