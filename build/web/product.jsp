<%-- 
    Document   : product
    Created on : Jul 10, 2023, 4:50:18 PM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="notify.jsp" %>
<%@ include file="user.jsp" %>
<%@ include file="search.jsp" %>
<%@ include file="cart.jsp" %>
<div class="app__container">
    <div class="grid">
        <div class="grid__row app__content">

            <!--  -->
            <div class="single-product">
                <div class="grid__row" style="background-color: #fff;">
                    <div class="grid__col-6">
                        <img src="assets/img/img1.jpg" width="100%" id="ProductImg">
                        <div class="small-img-row">
                            <div class="small-img-col">
                                <img src="assets/img/img1.jpg" width="100%" class="small-img">
                            </div>   
                            <div class="small-img-col">
                                <img src="assets/img/img2.jpg" width="100%" class="small-img">
                            </div>   
                            <div class="small-img-col">
                                <img src="assets/img/img3.jpg" width="100%" class="small-img">
                            </div>   
                            <div class="small-img-col">
                                <img src="assets/img/img4.jpg" width="100%" class="small-img">
                            </div>   
                        </div>
                    </div>
                    <div class="grid__col-6">
                        <p>Home / RG</p>
                        <h1>RG Qant Gundam</h1>
                        <h4>520.000</h4>

                        <p class="selled">Đã bán: <span class="selled-number" style="color: rgb(79, 123, 204);">20</span> sản phẩm</p>                       
                        <input type="number" value="1">
                        <button href="#" class="btn single-product__btn">Add to cart</button>
                        <h3>Product details <i class="fa fa-indent"></i></h3>
                        <p>Mô hình lắp ráp tỉ lệ 1/144.<br/>
                            Hãng sản xuất : Bandai (Nhật Bản).<br/>
                            Thích hợp với người chơi trình độ sơ cấp trở lên.<br/> 
                            Chất liệu nhựa, thân thiện và an toàn với môi trường.
                        </p>

                    </div>
                </div>
            </div>
            <!--  -->
            <!--  -->

        </div>
    </div>
</div>

<script>
    var ProductImg = document.getElementById("ProductImg");
    var SmallImg = document.getElementsByClassName("small-img");

    for (var i = 0; i < SmallImg.length; i++) {
        SmallImg[i].addEventListener("click", function () {
            ProductImg.src = this.src;
        });
    }


</script>
<%@ include file="footer.jsp" %>
<%@ include file="register.jsp" %>
<%@ include file="login.jsp" %>