<%-- 
    Document   : feedback
    Created on : Aug 22, 2023, 10:50:14 AM
    Author     : xuant
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--foeach cho nay nhan vao mot cai list order co isFeedbacked = false moi phan tu trong list order la mot list cac product--> 
<c:if test="${not empty sessionScope.account.getUnfeedbackedOrder()}">
    <c:forEach items="${sessionScope.account.getUnfeedbackedOrder()}" var="order">
        <form action="feedback" class="auth-form feedback-form" id="feedback${order.orderID}" style="line-height: 2rem" method="get">
            <input type="hidden" name="orderId" value="${order.orderID}">
            <c:forEach items="${sessionScope.account.getUnfeedbackedProduct(order.orderID)}" var="product">
                <div class="auth-form__container">
                    <div class="auth-form__header">
                        <h3 class="auth-form__heading">Đánh giá sản phẩm</h3>
                        <!-- <span class="auth-form__switch-btn">Đăng ký</span> -->
                    </div>
                    <div class="feedback-product">
                        <img class="feedback-product__img" src="${product.images.get(0)}" alt="feedback-product" style="margin: 0; margin-top: 10px;"/>
                        <div class="feedback-product-info">
                            <p class="feedback-product__name">${product.productName}</p>
                            <p class="feedback-product__date">${order.getShippedDate()}</p>
                        </div>
                    </div>
                    <div class="auth-form__form">
                        <div class="rating-form">
                            <label for="rating_${product.ID}">Rating:</label>
                            <select id="rating_${product.ID}" name="rating_${product.ID}">
                                <!-- ... options ... -->
                                <option value="1">&#x2B50;</option>
                                <option value="2">&#x2B50;&#x2B50;</option>
                                <option value="3">&#x2B50;&#x2B50;&#x2B50;</option>
                                <option value="4">&#x2B50;&#x2B50;&#x2B50;&#x2B50;</option>
                                <option value="5">&#x2B50;&#x2B50;&#x2B50;&#x2B50;&#x2B50;</option>
                            </select>
                        </div>
                        <div class="auth-form__group">
                            <textarea name="feedback_${product.ID}" cols="30" rows="40" class="auth-form__input" placeholder="Chia sẻ trải nghiệm của bạn về sản phẩm"></textarea>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="auth-form__controls">   
                <span class="btn return">TRỞ LẠI</span>
                <button type="submit" class="btn btn--primary">Hoàn Thành</button>
            </div>
        </form>
    </c:forEach>
</c:if>

<!--<form action="feedback" class="auth-form feedback">
    <div class="auth-form__container">
        <div class="auth-form__header">
            <h3 class="auth-form__heading" style="margin: 0; margin-top: 10px;">Đánh giá sản phẩm</h3>
             <span class="auth-form__switch-btn">Đăng ký</span> 
        </div>
        <div class="feedback-product">
            <img class="feedback-product__img" src="assets/img/img1.jpg" alt="feedback-product"/>
            <span>RG Qant</span>

        </div>
        <div class="auth-form__form">
            <div class="rating-form">
                <label for="rating">Rating:</label>
                <select id="rating" name="rating">
                    <option value="1">&#x2B50;</option>
                    <option value="2">&#x2B50;&#x2B50;</option>
                    <option value="3">&#x2B50;&#x2B50;&#x2B50;</option>
                    <option value="4">&#x2B50;&#x2B50;&#x2B50;&#x2B50;</option>
                    <option value="5">&#x2B50;&#x2B50;&#x2B50;&#x2B50;&#x2B50;</option>
                </select>
            </div>

            <div class="auth-form__group">
                 <input type="text" class="auth-form__input" placeholder="Chia sẻ trải nghiệm của bạn về sản phẩm"> 
                <h2>Phản hồi</h2>
                <textarea name="" id="" cols="30" rows="40" class="auth-form__input" placeholder="Chia sẻ trải nghiệm của bạn về sản phẩm"></textarea>
            </div>
        </div>
    </div>
    <div class="auth-form__container">
        <div class="auth-form__header">
            <h3 class="auth-form__heading" style="margin: 0; margin-top: 10px;">Đánh giá sản phẩm</h3>
             <span class="auth-form__switch-btn">Đăng ký</span> 
        </div>
        <div class="feedback-product">
            <img class="feedback-product__img" src="assets/img/img1.jpg" alt="feedback-product"/>
            <span>RG Qant</span>

        </div>
        <div class="auth-form__form">
            <div class="rating-form">
                <label for="rating">Rating:</label>
                <select id="rating" name="rating">
                    <option value="1">&#x2B50;</option>
                    <option value="2">&#x2B50;&#x2B50;</option>
                    <option value="3">&#x2B50;&#x2B50;&#x2B50;</option>
                    <option value="4">&#x2B50;&#x2B50;&#x2B50;&#x2B50;</option>
                    <option value="5">&#x2B50;&#x2B50;&#x2B50;&#x2B50;&#x2B50;</option>
                </select>
            </div>

            <div class="auth-form__group">
                 <input type="text" class="auth-form__input" placeholder="Chia sẻ trải nghiệm của bạn về sản phẩm"> 
                <h2>Phản hồi</h2>
                <textarea name="" id="" cols="30" rows="40" class="auth-form__input" placeholder="Chia sẻ trải nghiệm của bạn về sản phẩm"></textarea>
            </div>
        </div>
    </div>
    <div class="auth-form__container">
        <div class="auth-form__header">
            <h3 class="auth-form__heading" style="margin: 0; margin-top: 10px;">Đánh giá sản phẩm</h3>
             <span class="auth-form__switch-btn">Đăng ký</span> 
        </div>
        <div class="feedback-product">
            <img class="feedback-product__img" src="assets/img/img1.jpg" alt="feedback-product"/>
            <span>RG Qant</span>

        </div>
        <div class="auth-form__form">
            <div class="rating-form">
                <label for="rating">Rating:</label>
                <select id="rating" name="rating">
                    <option value="1">&#x2B50;</option>
                    <option value="2">&#x2B50;&#x2B50;</option>
                    <option value="3">&#x2B50;&#x2B50;&#x2B50;</option>
                    <option value="4">&#x2B50;&#x2B50;&#x2B50;&#x2B50;</option>
                    <option value="5">&#x2B50;&#x2B50;&#x2B50;&#x2B50;&#x2B50;</option>
                </select>
            </div>

            <div class="auth-form__group">
                 <input type="text" class="auth-form__input" placeholder="Chia sẻ trải nghiệm của bạn về sản phẩm"> 
                <h2>Phản hồi</h2>
                <textarea name="" id="" cols="30" rows="40" class="auth-form__input" placeholder="Chia sẻ trải nghiệm của bạn về sản phẩm"></textarea>
            </div>
        </div>
    </div>


    <div class="auth-form__controls">
        <button class="btn btn--normal">TRỞ LẠI</button>
        <button class="btn btn--primary">Hoàn Thành</button>
    </div>
</form>-->
