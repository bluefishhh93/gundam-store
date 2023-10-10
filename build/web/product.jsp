<%-- 
    Document   : product
    Created on : Jul 10, 2023, 4:50:18 PM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="notify.jsp" %>
<c:choose>
    <c:when test="${sessionScope.account != null}">
        <%@ include file="user.jsp" %>
    </c:when>
    <c:otherwise>
        <%@ include file="modallink.jsp" %>
    </c:otherwise>
</c:choose>
<%@ include file="search.jsp" %>
<%@ include file="cart.jsp" %>

<div class="app__container">
    <div class="grid">
        <div class="grid__row app__content">

            <!--  -->
            <div class="single-product">
                <c:set var="product" value="${requestScope.product}"/>
                <div class="grid__row" style="background-color: #fff;">
                    <div class="grid__col-6">
                        <img src="${product.images.get(0)}" width="100%" id="ProductImg">
                        <div class="small-img-row">
                            <c:forEach items="${product.images}" var="imageSRC">
                                <div class="small-img-col">
                                    <img src="${imageSRC}" width="100%" class="small-img">
                                </div> 
                            </c:forEach>
                        </div>
                    </div>
                    <div class="grid__col-6">
                        <p><a href="loadpage" style="text-decoration: none">Home</a> / ${product.category.name}</p>
                        <h1 style="color: var(--primary-color)">${product.productName}</h1>
                        <h4><fmt:formatNumber type="number" groupingUsed="true" value="${product.price}"/> đ</h4>
                        <p class="selled">Đã bán: <span class="selled-number" style="color: rgb(79, 123, 204);">${product.getTotalProductSold()}</span> sản phẩm</p>                       
                        <input id="quantity" type="number" value="1">
                        <c:set var="a" value="${sessionScope.account}"/>
                        <button class="btn single-product__btn" onclick="<c:choose><c:when test='${a == null}'>login()</c:when><c:otherwise>location.href = 'addtocart?productid=${product.ID}&quantity=' + document.getElementById('quantity').value</c:otherwise></c:choose>">
                                    Add to cart
                                </button>
                                <h3>Product details <i class="fa fa-indent"></i></h3>
                                <p>
                            <c:forEach items="${product.productDetails}" var="productdetail">
                                ${productdetail} <br/>
                            </c:forEach>
                        </p>

                    </div>
                </div>
            </div>
            <!--  -->
            <!--  -->
            <!-- JSP code -->
            <style>
                .user-review{
                    margin-bottom: 10px;

                }
                .heading {
                    font-size: 25px;
                    margin-right: 25px;
                }

                .fa {
                    font-size: 25px;
                }

                .checked {
                    color: orange;
                }

                /* Three column layout */
                .side {
                    float: left;
                    width: 15%;
                    margin-top:10px;
                }

                .middle {
                    margin-top:10px;
                    float: left;
                    width: 70%;
                }

                /* Place text to the right */
                .right {
                    text-align: right;
                }

                /* Clear floats after the columns */
                .row:after {
                    content: "";
                    display: table;
                    clear: both;
                }

                /* The bar container */
                .bar-container {
                    width: 100%;
                    background-color: #f1f1f1;
                    text-align: center;
                    color: white;
                }

                /* Individual bars */
                .bar-5 {
                    /*width: 60%;*/
                    height: 18px;
                    background-color: #04AA6D;
                }
                .bar-4 {
                    /*width: 30%;*/
                    height: 18px;
                    background-color: #2196F3;
                }
                .bar-3 {
                    /*width: 10%;*/
                    height: 18px;
                    background-color: #00bcd4;
                }
                .bar-2 {
                    /*width: 4%;*/
                    height: 18px;
                    background-color: #ff9800;
                }
                .bar-1 {
                    /*width: 15%;*/
                    height: 18px;
                    background-color: #f44336;
                }
                /* ---------Comments */
                .comment {
                    /* display: flex; */
                    align-items: center;
                    gap: 10px;
                    border-bottom: #00bcd4 solid 1px;
                }

                .comment img {
                    border-radius: 50%;
                }

                .comment h4 {
                    font-size: 1.2rem;
                    margin: 0;
                    display: inline-block;
                }

                .comment span {
                    color: #888;
                    font-size: 0.9rem;
                }

                .comment p {
                    font-size: 1.5rem;
                    margin-top: 10px;
                }

                .user-comment{
                    width: 600px;
                    display: inline-block;
                    

                }
                .rating{
                    width: 600px;
                    padding-bottom: 10px
                    /*display: block*/
                }


            </style>
            <div class="user-review">
                <div class="grid__row feedback" style="background-color: #fff;">
                    <div class="grid__col-6">
                        <span class="heading">Feedback</span>
                        <!-- DisPlay all comment feedback -->
                        <c:choose>
                            <c:when test="${not empty product.feedbacks}">
                                <c:forEach items="${product.feedbacks}" var="feedback">
                                    <div class="row user-comment">
                                        <div class="comment mt-4 text-justify float-left">
                                            <img src="https://i.imgur.com/yTFUilP.jpg" alt="" class="rounded-circle" width="40" height="40">
                                            <h4>${feedback.user.name}</h4>
                                            <span>- ${feedback.createAt}</span>
                                            <br>
                                            <p style="font-size: 1.5rem;">${feedback.content}</p>
                                        </div>
                                    </div>
                                </c:forEach>
                                <ul class="home-product__pagination pagnigation"></ul>
                            </c:when>
                            <c:otherwise>
                                <div class="user-comment">
                                    <h2>There is no feedbacks yet.</h2>
                                </div>
                            </c:otherwise>
                        </c:choose>

                        <!--                        <div class="row user-comment">
                                                    <div class="comment mt-4 text-justify float-left">
                                                        <img src="https://i.imgur.com/yTFUilP.jpg" alt="" class="rounded-circle" width="40" height="40">
                                                        <h4>Jhon Doe1</h4>
                                                        <span>- 20 October, 2018</span>
                                                        <br>
                                                        <p style="font-size: 1.5rem;">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusamus numquam assumenda hic aliquam vero sequi velit molestias doloremque molestiae dicta?</p>
                                                    </div>
                                                </div>
                                                <div class="row user-comment">
                                                    <div class="comment mt-4 text-justify float-left">
                                                        <img src="https://i.imgur.com/yTFUilP.jpg" alt="" class="rounded-circle" width="40" height="40">
                                                        <h4>Jhon Doe2</h4>
                                                        <span>- 20 October, 2018</span>
                                                        <br>
                                                        <p style="font-size: 1.5rem;">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusamus numquam assumenda hic aliquam vero sequi velit molestias doloremque molestiae dicta?</p>
                                                    </div>
                                                </div>
                                                <div class="row user-comment">
                                                    <div class="comment mt-4 text-justify float-left">
                                                        <img src="https://i.imgur.com/yTFUilP.jpg" alt="" class="rounded-circle" width="40" height="40">
                                                        <h4>Jhon Doe3</h4>
                                                        <span>- 20 October, 2018</span>
                                                        <br>
                                                        <p style="font-size: 1.5rem;">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusamus numquam assumenda hic aliquam vero sequi velit molestias doloremque molestiae dicta?</p>
                                                    </div>
                                                </div>
                                                <div class="row user-comment">
                                                    <div class="comment mt-4 text-justify float-left">
                                                        <img src="https://i.imgur.com/yTFUilP.jpg" alt="" class="rounded-circle" width="40" height="40">
                                                        <h4>Jhon Doe4</h4>
                                                        <span>- 20 October, 2018</span>
                                                        <br>
                                                        <p style="font-size: 1.5rem;">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusamus numquam assumenda hic aliquam vero sequi velit molestias doloremque molestiae dicta?</p>
                                                    </div>
                                                </div>
                                                <div class="row user-comment">
                                                    <div class="comment mt-4 text-justify float-left">
                                                        <img src="https://i.imgur.com/yTFUilP.jpg" alt="" class="rounded-circle" width="40" height="40">
                                                        <h4>Jhon Doe5</h4>
                                                        <span>- 20 October, 2018</span>
                                                        <br>
                                                        <p style="font-size: 1.5rem;">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusamus numquam assumenda hic aliquam vero sequi velit molestias doloremque molestiae dicta?</p>
                                                    </div>
                        </div>-->           

                        
                    </div>
                    <div class="grid__col-6 rating">                                  
                        <span class="heading">User Rating</span>
                        <!--custom tag-->
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                        <p>${product.averageStar()} average based on ${product.feedbacks.size()} reviews.</p>
                        <hr style="border:3px solid #f1f1f1">

                        <div class="row">
                            <div class="side">
                                <div>5 star</div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-5" style="width: ${product.handleStar().get(4) * 100.0 / product.feedbacks.size()}%"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>${product.handleStar().get(4)}</div>
                            </div>
                        </div>    
                        <div class="row">
                            <div class="side">
                                <div>4 star</div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-4" style="width: ${product.handleStar().get(3) * 100.0 / product.feedbacks.size()}%"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>${product.handleStar().get(3)}</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="side">
                                <div>3 star</div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-3" style="width: ${product.handleStar().get(2)  * 100.0 / product.feedbacks.size()}%"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>${product.handleStar().get(2)}</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="side">
                                <div>2 star</div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-2" style="width: ${product.handleStar().get(1)  * 100.0 / product.feedbacks.size()}%"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>${product.handleStar().get(1)}</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="side">
                                <div>1 star</div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-1" style="width: ${product.handleStar().get(0)  * 100.0 / product.feedbacks.size()}%"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>${product.handleStar().get(0)}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



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
<script src="assets/js/feedbackPaging.js"></script>
<%@ include file="footer.jsp" %>
<%@ include file="register.jsp" %>
<%@ include file="login.jsp" %>
