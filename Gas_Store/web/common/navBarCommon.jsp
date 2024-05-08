<%-- 
Document   : navBarComponent
Created on : Feb 17, 2022, 9:00:41 PM
Author     : Le Hong Quan
--%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="Test/css/normalize.css">
<link rel="stylesheet" type="text/css" href="Test/icomoon/icomoon.css">
<link rel="stylesheet" type="text/css" href="Test/css/vendor.css">
<link rel="stylesheet" type="text/css" href="Test/style.css">
<script>
    function login() {
        window.location.href = "login.jsp";
    }
    function logout() {
        window.location.href = "logout";

    }
</script>


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
                        <div class="right-element">
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
                                    <i class="icon icon-user" aria-current="page"></i><span>Account ${sessionScope.acc.user}</span></a>

                            </c:if>
                            <!<!-- Carts -->
                            <a href="carts" class="cart for-buy"><i class="fa-solid fa-cart-plus"></i><span>Cart:${sessionScope.carts.size()}</span></a>
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
                            <a href="index.jsp"><img src="Test/images/main-logo.png" alt="logo"></a>
                        </div>

                    </div>

                    <div class="col-md-10">

                        <nav id="navbar">
                            <div class="main-menu stellarnav">
                                <ul class="menu-list">
                                    <li class="menu-item active"><a href="index.jsp">Home</a></li> <!-- href:#home to home -->
                                    <li class="menu-item has-sub">
                                        <a href="#pages" class="nav-link">Category</a>

                                        <ul>    <!-- category -->
                                            <c:forEach items="${listCategories}" var="C">
                                                <li class="list-group-item text-white ${tag == C.cid? "active":""}"><a href="category?categoryId=${C.cid}">${C.cname}</a></li>
                                                </c:forEach>
                                        </ul>

                                    </li>
                                    <li class="menu-item"><a href="index.jsp" class="nav-link">Featured</a></li>
                                    <li class="menu-item"><a href="index.jsp#popular-books" class="nav-link">Popular</a></li>
                                    <li class="menu-item"><a href="index.jsp#special-offer" class="nav-link">Offer</a></li>
                                    <li class="menu-item"><a href="index.jsp#latest-blog" class="nav-link">Articles</a></li>
                                    <li class="menu-item"><a href="index.jsp#download-app" class="nav-link">Download App</a></li>
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
        </header><!--<!-- header -->

    </div><!--header-wrap-->



    <!-- Navigation-->

    <script src="Test/js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
    <script src="Test/js/plugins.js"></script>
    <script src="Test/js/script.js"></script>