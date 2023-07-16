<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <li class="navigation-item"><a href="AdminTemplate/index.html"><i class="fas fa-tachometer-alt-fast"></i>Bảng điều khiển</a></li>
                            <li class="navigation-item"><a href="user_list.html"><i class="fas fa-user-circle"></i>Quản lí khách hàng</a></li>
                            <li class="navigation-item"><a href="product-list.html"><i class="fas fa-tags"></i>Quản lí sản phẩm</a></li>
                            <li class="navigation-item"><a href="order_list.html"><i class="fas fa-gift"></i>Quản lí đơn hàng</a></li>
                        </ul>
                    </div>
                </div>
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
                                      <th>Mã sản phẩm</th>
                                      <th>Danh mục</th>
                                      <th>Tên sản phẩm</th>
                                      <th>Giá</th>
                                      <th>Thông tin sản phẩm</th>
                                      <th>Số lượng</th>
                                      <th>Hình ảnh</th>
                                      <th>Tính năng</th>                                    
                                    </tr>
                                    <c:forEach items="${list}" var="product">
                                    <tr>
                                        <td>${product.ID}</td>
                                        <td>${product.category.name}</td>
                                        <td>${product.productName}</td>
                                        <td>${product.price}</td>
                                        <td>${product.productDetail}</td>
                                        <td>${product.unitInStock}</td>
                                        <td><img src="${product.images[0]}" alt=""></td>
                                        <td>
                                            <a href="edit-product?id=${product.ID}"><i class="fas fa-edit"></i></a>
                                            <a href="delete-product?id=${product.ID}"><i class="fas fa-trash-alt"></i></a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    
                                  </table>
                            </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/index.js"></script>
</body>
</html>