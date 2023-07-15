

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    function filterProduct(sql) {
        window.location.href = "filterproduct?action=" + sql;
    }
</script>
<!-- home-filter.jsp -->
<div class="grid__col-10">
    <div class="home-filter">
        <span class="home-filter__label">Sắp xếp theo</span>
        <button class="home-filter__btn btn" onclick="filterProduct('popular')">Phổ biến</button>
        <button class="home-filter__btn btn" onclick="filterProduct('new')">Mới nhất</button>
        <button class="home-filter__btn btn" onclick="filterProduct('best')">Bán chạy</button>

        <div class="select-input">
            <span class="select-input__label">Giá</span>
            <i class="fas fa-angle-down"></i>
            <!-- List option -->
            <ul class="select-input__list">
                <li class="select-input__item">
                    <a href="#" class="select-input__link">Giá: Thấp đến cao</a>
                </li>
                <li class="select-input__item">
                    <a href="#" class="select-input__link">Giá: Cao đến thấp</a>
                </li>
            </ul>
        </div>
        <div class="home-filter__page">
            <span class="home-filter__page-num">
                <span class="home-filter__page-current">1</span>/14
            </span>
            <div class="home-filter__page-control">
                <a href="#" class="home-filter__page-btn home-filter__page-btn--disable">
                    <i class="home-filter__page-icon fas fa-angle-left"></i>

                </a>
                <a href="#" class="home-filter__page-btn">
                    <i class="home-filter__page-icon fas fa-angle-right"></i>

                </a>
            </div>
        </div>
    </div>

    <!-- home-filter.jsp -->
