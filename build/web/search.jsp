<%-- 
    Document   : search
    Created on : Jul 10, 2023, 4:13:38 PM
    Author     : xuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- search.jsp -->
                </nav>
                <div class="header-with-search">
                    <div class="header__logo">
                        <a href="index.html" class="header__logo-link">
                            <img class="header__logo-img" src="assets/img/logo.svg.png" alt="">
                        </a>
                    </div>
                    <div class="header__search">
                        <div class="header__search-input-wrap">
                            <input type="text" class="header__search-input" placeholder="Nhập để tìm kiếm sản phẩm">
                            <!-- Search history -->
                            <div class="header__search-history">
                                <h3 class="header__search-history-heading">Lịch sử tìm kiếm</h3>
                                <ul class="header__search-history-list">
                                    <li class="header__search-history-item">
                                        <a href="">Kem dưỡng da</a>
                                    </li>
                                    <li class="header__search-history-item">
                                        <a href="">Kem trị mụn</a>
                                    </li>
                                </ul>

                            </div>
                        </div>
                        <div class="header__search-select">
                            <span class="header__search-select-label">Trong shop</span>
                            <i class="header__search-select-icon fas fa-angle-down"></i>
                            <ul class="header__search-option">
                                <li class="header__search-option-item">
                                    <span>Trong shop</span>
                                    <i class="fas fa-check"></i>
                                </li>
                                <li class="header__search-option-item">
                                    <span>Ngoài shop</span>
                                    <i class="fas fa-check"></i>
                                </li>
                            </ul>
                        </div>
                        <button class="header__search-btn">
                            <i class="header__search-btn-icon fas fa-search"></i>
                        </button>
                    </div>
<!-- search.jsp -->
<!--SEARCH HANDLER-->
<script>
    let searchButtonEl = document.querySelector('.header__search-btn');
    let searchInputEl = document.querySelector('.header__search-input');
    
    searchButtonEl.addEventListener("click",()=>{
        window.location.href = "filterproduct?action=search&searchcontent=" + searchInputEl.value;
    });
    
</script>