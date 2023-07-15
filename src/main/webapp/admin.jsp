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
                            <li class="navigation-item"><a href="admin.jsp"><i class="fas fa-tachometer-alt-fast"></i>Bảng điều khiển</a></li>
                            <li class="navigation-item"><a href="user_list.html"><i class="fas fa-user-circle"></i>Quản lí khách hàng</a></li>
                            <li class="navigation-item"><a href="product-list.html"><i class="fas fa-tags"></i>Quản lí sản phẩm</a></li>
                            <li class="navigation-item"><a href="order_list.html"><i class="fas fa-gift"></i>Quản lí đơn hàng</a></li>
                        </ul>
                    </div>
                </div>
                <div class="grid__col-10 dashboard-content">
                    <div class="logout"><i class="fas fa-sign-out"></i></div>
                    <div class="title">Bảng điều khiển</div>               
                    <div class="information">
                                <div class="information__item">
                                    <i class="fas fa-users"  style="background-color: rgb(169, 245, 169); color: green;"></i>
                                    <div class="information__item-content">
                                    <h2>Tổng khách hàng</h2>
                                    <h3>5 khách hàng</h3>
                                    <p>Tổng số khách hàng được quản lý</p>
                                    </div>
                                </div>
                                <div class="information__item">
                                    <i class="fas fa-coins" style="background-color:  rgb(91, 176, 241); color: blue;"></i>
                                    <div class="information__item-content">
                                    <h2>Tổng sản phẩm</h2>
                                    <h3>13 sản phẩm</h3>
                                    <p>Tổng số khách hàng được quản lý</p>
                                    </div>
                                </div>
                                <div class="information__item">
                                    <i class="fab fa-shopify" style="background-color: rgb(245, 212, 152); color: orange;"></i>
                                    <div class="information__item-content">
                                    <h2>Tổng đơn hàng</h2>
                                    <h3>14 đơn hàng</h3>
                                    <p>Tổng số khách hàng được quản lý</p>
                                    </div>
                                </div>
                                <div class="information__item">
                                    <i class="fas fa-exclamation-triangle" style="background-color:  rgb(238, 109, 109); color: red;"></i>
                                    <div class="information__item-content">
                                    <h2>Sắp hết hàng</h2>
                                    <h3>1 sản phẩm</h3>
                                    <p>Tổng số khách hàng được quản lý</p>
                                    </div>
                                </div>
                    
                            </div>

                            <div class="customer-today">
                                <h1>Đơn hàng hôm nay</h1>
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
            </div>
        </div>
    </div>
    <script src="assets/js/index.js"></script>
</body>
</html>