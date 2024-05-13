<%-- 
    Document   : ArticleDetail
    Created on : May 12, 2024, 6:13:01 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script>
        function login() {
            window.location.href = "login.jsp";
        }
        function logout() {
            window.location.href = "logout";

        }

    </script>

    <style>
        .fix{
            width:107px;
            height:80px;
            margin-right:10px;
            padding-left: 25px;

        }
    </style>

    <head>
        <title>GAS STORE</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <!-- Back to top button -->
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
        <link href="css/style1.css" rel="stylesheet"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="ArticlesCSS/css/style.css">
        <link rel="stylesheet" type="text/css" href="Test/css/normalize.css">
        <link rel="stylesheet" type="text/css" href="Test/icomoon/icomoon.css">
        <link rel="stylesheet" type="text/css" href="Test/css/vendor.css">
        <link rel="stylesheet" type="text/css" href="Test/style.css">

    </head>

    <body data-bs-spy="scroll" data-bs-target="#header" tabindex="0">

        <div id="header-wrap">

            <div class="top-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="social-links">
                                <ul>
                                    <li>
                                        <a href="#"><i class="icon icon-facebook"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="icon icon-twitter"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="icon icon-youtube-play"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="icon icon-behance-square"></i></a>
                                    </li>
                                </ul>
                            </div><!--social-links-->
                        </div>
                        <div class="col-md-6">
                            <div class="right-element"><!<!-- Name account -->
                                <!<!-- Name account -->
                                <c:if test="${sessionScope.acc.isAdmin == 1}">
                                    <a href="managerAccount" class="user-account for-buy">
                                        <i class="icon icon-user" aria-current="page" "></i><span>Manager Account</span></a>
                                    <a href="managerCategory" class="user-account for-buy">
                                        <i class="icon icon-user" aria-current="page" ></i><span>Manager Category</span></a>
                                        </c:if>
                                        <c:if test="${sessionScope.acc.isSell == 1}">
                                    <a href="manager" class="user-account for-buy">
                                        <i class="icon icon-user" aria-current="page" ></i><span>Manager Product</span></a>
                                        </c:if>

                                <c:if test="${sessionScope.acc != null}">
                                    <a href="LoadOrderForUser" class="user-account for-buy">
                                        <i class="icon icon-user" aria-current="page"></i><span>Account ${sessionScope.acc.user}</span></a>                                    <a href="LoadOrderForUser" class="user-account for-buy">
                                        </c:if>
                                    <!<!-- Carts -->
                                    <a href="carts" class="cart for-buy"><i class="fa-solid fa-cart-plus"></i><span> Cart:${sessionScope.carts.size()}</span></a>
                                    <!-- Search bar -->
                                    <div class="action-menu">
                                        <div class="search-bar">
                                            <a href="#" class="search-button search-toggle" data-selector="#header-wrap">
                                                <i class="icon icon-search"></i>
                                            </a>
                                            <form  action="search" role="search" method="get" class="search-box">
                                                <input 
                                                    value ="${key}"
                                                    class="search-field text search-input" 
                                                    placeholder="Search"
                                                    type="search"
                                                    name="keyword"
                                                    >
                                            </form>
                                        </div>
                                    </div>

                            </div><!--top-right-->
                        </div>

                    </div>
                </div>
            </div><!--top-content-->

            <header id="header">
                <div class="container-fluid">
                    <div class="row">

                        <div class="col-md-2">
                            <div class="main-logo"><!<!-- change to index.jsp -->
                                <a href="index.jsp"><img src="Test/images/Gas_Store.png" alt="logo" class="fix"></a>
                            </div>

                        </div>

                        <div class="col-md-10">

                            <nav id="navbar">
                                <div class="main-menu stellarnav">
                                    <ul class="menu-list">
                                        <li class="menu-item active"><a href="#">Home</a></li> <!-- href:#home to home -->
                                        <li class="menu-item has-sub">
                                            <a href="#pages" class="nav-link">Pages</a>

                                            <ul>
                                                <li class="active"><a href="index.jsp">Home</a></li>
                                                <li><a href="#">About <span class="badge bg-dark">PRO</span></a></li>
                                                <li><a href="#">Styles <span class="badge bg-dark">PRO</span></a></li>
                                                <li><a href="#">Blog <span class="badge bg-dark">PRO</span></a></li>
                                                <li><a href="#">Post Single <span class="badge bg-dark">PRO</span></a></li>
                                                <li><a href="#">Our Store <span class="badge bg-dark">PRO</span></a></li>
                                                <li><a href="#">Product Single <span class="badge bg-dark">PRO</span></a></li>
                                                <li><a href="#">Contact <span class="badge bg-dark">PRO</span></a></li>
                                                <li><a href="#">Thank You <span class="badge bg-dark">PRO</span></a></li>
                                            </ul>

                                        </li>
                                        <li class="menu-item"><a href="#featured-books" class="nav-link">Featured</a></li>
                                        <li class="menu-item"><a href="#popular-books" class="nav-link">Popular</a></li>
                                        <li class="menu-item"><a href="#special-offer" class="nav-link">Offer</a></li>
                                        <li class="menu-item"><a href="#latest-blog" class="nav-link">Articles</a></li>
                                        <li class="menu-item"><a href="#download-app" class="nav-link">Download App</a></li>
                                        <!-- Login -->
                                        <li class="menu-item">
                                            <c:choose>
                                                <c:when test="${sessionScope.acc == null}">
                                                    <a onclick="login()" class="btn btn-outline-dark rounded-pill m-0" target="_blank">Login</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                <a onclick="logout()" class="btn btn-outline-dark rounded-pill m-0" target="_blank">Log Out</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>

                                    <div class="hamburger">
                                        <span class="bar"></span>
                                        <span class="bar"></span>
                                        <span class="bar"></span>
                                    </div>

                                </div>
                            </nav>

                        </div>

                    </div>
                </div>
            </header>

        </div><!--header-wrap-->



        <div class="container">
            <div class="card" style="font-weight: bold; --heading-font: initial" >
                <h2 align="center">Nguyên nhân hở van gas & lưu ý cần nhớ </h2>
                
                <img src="http://bepgashathanh.vn/imgs/4-nguyen-tac-su-dung-bep-gas-am-hieu-qua-31.jpg" 
                     class="img-fluid mx-4 mb-4" alt="">
                
                <p class="mx-4">Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
                    Accusantium magnam, ipsam animi quis sequi provident nam laudantium dolorum. 
                    A blanditiis obcaecati similique laudantium, temporibus dolorem dignissimos non et vitae quos.
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
                    Accusantium magnam, ipsam animi quis sequi provident nam laudantium dolorum. 
                    A blanditiis obcaecati similique laudantium, temporibus dolorem dignissimos non et vitae quos.
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
                    Accusantium magnam, ipsam animi quis sequi provident nam laudantium dolorum. 
                    A blanditiis obcaecati similique laudantium, temporibus dolorem dignissimos non et vitae quos.
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
                    Accusantium magnam, ipsam animi quis sequi provident nam laudantium dolorum. 
                    A blanditiis obcaecati similique laudantium, temporibus dolorem dignissimos non et vitae quos.</p>            
            </div>
        </div>



        <footer id="footer">
            <div class="container">
                <div class="row">

                    <div class="col-md-4">

                        <div class="footer-item">
                            <div class="company-brand">
                                <img src="Test/images/Gas_Store.png" alt="logo" class="footer-logo">

                            </div>
                        </div>

                    </div>

                    <div class="col-md-2">

                        <div class="footer-menu">
                            <h5>About Us</h5>
                            <ul class="menu-list">
                                <li class="menu-item">
                                    <a href="#">vision</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">articles </a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">careers</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">service terms</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">donate</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <div class="col-md-2">

                        <div class="footer-menu">
                            <h5>Discover</h5>
                            <ul class="menu-list">
                                <li class="menu-item">
                                    <a href="#">Home</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Books</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Authors</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Subjects</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Advanced Search</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <div class="col-md-2">

                        <div class="footer-menu">
                            <h5>My account</h5>
                            <ul class="menu-list">
                                <li class="menu-item">
                                    <c:choose>
                                        <c:when test="${sessionScope.acc == null}">
                                            <a onclick="login()" >Sign In</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <a onclick="login()">Log Out</a></li>
                                    </c:otherwise>
                                </c:choose>
                                <li class="menu-item">
                                    <a href="#">View Cart</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">My Wishtlist</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Track My Order</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <div class="col-md-2">

                        <div class="footer-menu">
                            <h5>Help</h5>
                            <ul class="menu-list">
                                <li class="menu-item">
                                    <a href="#">Help center</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Report a problem</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Suggesting edits</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Contact us</a>
                                </li>
                            </ul>
                        </div>

                    </div>

                </div>
                <!-- / row -->

            </div>
        </footer>


        <!--Back to top button-->
        <button class="btn-floating btn-lg" id="btn-back-to-top">
            <i class="icon"><span class="icon-arrow-up2"></span></i>
        </button>
        <script src="js/Checkbox.js"></script>
        <script src="Test/js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
        <script src="Test/js/plugins.js"></script>
        <script src="Test/js/script.js"></script>

    </body>
</html>
