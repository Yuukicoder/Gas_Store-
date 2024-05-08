<%-- 
    Document   : index
    Created on : Mar 11, 2024, 8:33:54 PM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <script>
        function login() {
            window.location.href = "login.jsp";
        }
        function logout() {
            window.location.href = "logout";

        }
    </script>

    <head>
        <title>BookSaw - Free Book Store HTML CSS Template</title>
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
                                <a href="index.jsp"><img src="Test/images/main-logo.png" alt="logo"></a>
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

        <section id="billboard">

            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <button class="prev slick-arrow">
                            <i class="icon icon-arrow-left"></i>
                        </button>

                        <div class="main-slider pattern-overlay">
                            <div class="slider-item">
                                <div class="banner-content">
                                    <h2 class="banner-title">Life of the Wild</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu feugiat amet, libero
                                        ipsum enim pharetra hac. Urna commodo, lacus ut magna velit eleifend. Amet, quis
                                        urna, a eu.</p>
                                    <div class="btn-wrap">
                                        <a href="#" class="btn btn-outline-accent btn-accent-arrow">Read More<i
                                                class="icon icon-ns-arrow-right"></i></a>
                                    </div>
                                </div><!--banner-content-->
                                <img src="Test/images/main-banner1.jpg" alt="banner" class="banner-image">
                            </div><!--slider-item-->

                            <div class="slider-item">
                                <div class="banner-content">
                                    <h2 class="banner-title">Birds gonna be Happy</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu feugiat amet, libero
                                        ipsum enim pharetra hac. Urna commodo, lacus ut magna velit eleifend. Amet, quis
                                        urna, a eu.</p>
                                    <div class="btn-wrap">
                                        <a href="#" class="btn btn-outline-accent btn-accent-arrow">Read More<i
                                                class="icon icon-ns-arrow-right"></i></a>
                                    </div>
                                </div><!--banner-content-->
                                <img src="Test/images/main-banner2.jpg" alt="banner" class="banner-image">
                            </div><!--slider-item-->

                        </div><!--slider-->

                        <button class="next slick-arrow">
                            <i class="icon icon-arrow-right"></i>
                        </button>

                    </div>
                </div>
            </div>

        </section>

        <section id="client-holder" data-aos="fade-up">
            <div class="container">
                <div class="row">
                    <div class="inner-content">
                        <div class="logo-wrap">
                            <div class="grid">
                                <a href="#"><img src="Test/images/client-image1.png" alt="client"></a>
                                <a href="#"><img src="Test/images/client-image2.png" alt="client"></a>
                                <a href="#"><img src="Test/images/client-image3.png" alt="client"></a>
                                <a href="#"><img src="Test/images/client-image4.png" alt="client"></a>
                                <a href="#"><img src="Test/images/client-image5.png" alt="client"></a>
                            </div>
                        </div><!--image-holder-->
                    </div>
                </div>
            </div>
        </section>

        <section id="featured-books" class="py-5 my-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="section-header align-center">
                            <div class="title">
                                <span>Some quality items</span>
                            </div>
                            <h2 class="section-title">Featured Books</h2>
                        </div>

                        <div class="product-list" data-aos="fade-up">
                            <div class="row">

                                <div class="col-md-3">

                                    <div class="product-item">
                                        <figure class="product-style">
                                            <a href="detail?productId=${30}"><img src="Test/images/product-item1.jpg" alt="Books" class="product-item"></a
                                            <a href="addtocart?productId=${30}"><button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button></a>
                                        </figure>
                                        <figcaption>
                                            <h3>Simple way of piece life</h3>
                                            <span>Armor Ramsey</span>
                                            <div class="item-price">$ 40.00</div>
                                        </figcaption>
                                    </div>

                                </div>

                                <div class="col-md-3">
                                    <div class="product-item">
                                        <figure class="product-style">
                                            <a href="detail?productId=${31}"><img src="Test/images/product-item2.jpg" alt="Books" class="product-item"></a>
                                            <a href="addtocart?productId=${31}"><button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button></a>
                                        </figure>
                                        <figcaption>
                                            <h3>Great travel at desert</h3>
                                            <span>Sanchit Howdy</span>
                                            <div class="item-price">$ 38.00</div>
                                        </figcaption>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="product-item">
                                        <figure class="product-style">
                                            <a href="detail?productId=${32}"> <img src="Test/images/product-item3.jpg" alt="Books" class="product-item"></a>
                                            <a href="addtocart?productId=${32}"><button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button></a>
                                        </figure>
                                        <figcaption>
                                            <h3>The lady beauty Scarlett</h3>
                                            <span>Arthur Doyle</span>
                                            <div class="item-price">$ 45.00</div>
                                        </figcaption>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="product-item">
                                        <figure class="product-style">
                                            <a href="detail?productId=${33}"><img src="Test/images/product-item4.jpg" alt="Books" class="product-item"></a>
                                            <a href="addtocart?productId=${33}"><button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button></a>
                                        </figure>
                                        <figcaption>
                                            <h3>Once upon a time</h3>
                                            <span>Klien Marry</span>
                                            <div class="item-price">$ 35.00</div>
                                        </figcaption>
                                    </div>
                                </div>

                            </div><!--ft-books-slider-->
                        </div><!--grid-->


                    </div><!--inner-content-->
                </div>

                <div class="row">
                    <div class="col-md-12">

                        <div class="btn-wrap align-right">
                            <a href="home" class="btn-accent-arrow">View all products <i
                                    class="icon icon-ns-arrow-right"></i></a>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section id="best-selling" class="leaf-pattern-overlay">
            <div class="corner-pattern-overlay"></div>
            <div class="container">
                <div class="row justify-content-center">

                    <div class="col-md-8">

                        <div class="row">

                            <div class="col-md-6">
                                <figure class="products-thumb">
                                    <img src="Test/images/single-image.jpg" alt="book" class="single-image">
                                </figure>
                            </div>

                            <div class="col-md-6">
                                <div class="product-entry">
                                    <h2 class="section-title divider">Best Selling Book</h2>

                                    <div class="products-content">
                                        <div class="author-name">By Timbur Hood</div>
                                        <h3 class="item-title">Birds gonna be happy</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu feugiat amet,
                                            libero ipsum enim pharetra hac.</p>
                                        <div class="item-price">$ 45.00</div>
                                        <div class="btn-wrap">
                                            <a href="#" class="btn-accent-arrow">shop it now <i
                                                    class="icon icon-ns-arrow-right"></i></a>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <!-- / row -->

                    </div>

                </div>
            </div>
        </section>

        <section id="popular-books" class="bookshelf py-5 my-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="section-header align-center">
                            <div class="title">
                                <span>Some quality items</span>
                            </div>
                            <h2 class="section-title">Popular Books</h2>
                        </div>

                        <ul class="tabs">
                            <li data-tab-target="#all-genre" class="active tab">All Genre</li>
                            <li data-tab-target="#business" class="tab">Business</li>
                            <li data-tab-target="#technology" class="tab">Technology</li>
                            <li data-tab-target="#romantic" class="tab">Romantic</li>
                            <li data-tab-target="#adventure" class="tab">Adventure</li>
                            <li data-tab-target="#fictional" class="tab">Fictional</li>
                        </ul>

                        <div class="tab-content">
                            <div id="all-genre" data-tab-content class="active">
                                <div class="row">

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item1.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Portrait photography</h3>
                                                <span>Adam Silber</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item2.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Once upon a time</h3>
                                                <span>Klien Marry</span>
                                                <div class="item-price">$ 35.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item3.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Tips of simple lifestyle</h3>
                                                <span>Bratt Smith</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item4.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Just felt from outside</h3>
                                                <span>Nicole Wilson</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item5.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Peaceful Enlightment</h3>
                                                <span>Marmik Lama</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item6.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Great travel at desert</h3>
                                                <span>Sanchit Howdy</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item7.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Life among the pirates</h3>
                                                <span>Armor Ramsey</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item8.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Simple way of piece life</h3>
                                                <span>Armor Ramsey</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <div id="business" data-tab-content>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item2.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Peaceful Enlightment</h3>
                                                <span>Marmik Lama</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item4.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Great travel at desert</h3>
                                                <span>Sanchit Howdy</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item6.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Life among the pirates</h3>
                                                <span>Armor Ramsey</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item8.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Simple way of piece life</h3>
                                                <span>Armor Ramsey</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div id="technology" data-tab-content>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item1.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Peaceful Enlightment</h3>
                                                <span>Marmik Lama</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item3.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Great travel at desert</h3>
                                                <span>Sanchit Howdy</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item5.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Life among the pirates</h3>
                                                <span>Armor Ramsey</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item7.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Simple way of piece life</h3>
                                                <span>Armor Ramsey</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="romantic" data-tab-content>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item1.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Peaceful Enlightment</h3>
                                                <span>Marmik Lama</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item3.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Great travel at desert</h3>
                                                <span>Sanchit Howdy</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item5.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Life among the pirates</h3>
                                                <span>Armor Ramsey</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item7.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Simple way of piece life</h3>
                                                <span>Armor Ramsey</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="adventure" data-tab-content>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item5.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Life among the pirates</h3>
                                                <span>Armor Ramsey</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item7.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Simple way of piece life</h3>
                                                <span>Armor Ramsey</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="fictional" data-tab-content>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item5.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Life among the pirates</h3>
                                                <span>Armor Ramsey</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="Test/images/tab-item7.jpg" alt="Books" class="product-item">
                                                <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                    Cart</button>
                                            </figure>
                                            <figcaption>
                                                <h3>Simple way of piece life</h3>
                                                <span>Armor Ramsey</span>
                                                <div class="item-price">$ 40.00</div>
                                            </figcaption>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div><!--inner-tabs-->

                </div>
            </div>
        </section>

        <section id="quotation" class="align-center pb-5 mb-5">
            <div class="inner-content">
                <h2 class="section-title divider">Quote of the day</h2>
                <blockquote data-aos="fade-up">
                    <q>“The more that you read, the more things you will know. The more that you learn, the more places
                        you’ll go.”</q>
                    <div class="author-name">Dr. Seuss</div>
                </blockquote>
            </div>
        </section>

        <section id="special-offer" class="bookshelf pb-5 mb-5">

            <div class="section-header align-center">
                <div class="title">
                    <span>Grab your opportunity</span>
                </div>
                <h2 class="section-title">Books with offer</h2>
            </div>

            <div class="container">
                <div class="row">
                    <div class="inner-content">
                        <div class="product-list" data-aos="fade-up">
                            <div class="grid product-grid">
                                <div class="product-item">
                                    <figure class="product-style">
                                        <img src="Test/images/product-item5.jpg" alt="Books" class="product-item">
                                        <a href="addtocart?productId=${34}"><button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                Cart</button></a>
                                    </figure>
                                    <figcaption>
                                        <h3>Way of Happiness</h3>
                                        <span>Armor Ramsey</span>
                                        <div class="item-price">
                                            <span class="prev-price">$ 50.00</span>$ 40.00
                                        </div>
                                </div>
                                </figcaption>

                                <div class="product-item">
                                    <figure class="product-style">
                                        <img src="Test/images/product-item6.jpg" alt="Books" class="product-item">
                                        <a href="addtocart?productId=${35}"><button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                Cart</button></a>
                                    </figure>
                                    <figcaption>
                                        <h3>Life of Seacrits</h3>
                                        <span>Sanchit Howdy</span>
                                        <div class="item-price">
                                            <span class="prev-price">$ 50.00</span>$ 38.00
                                        </div>
                                </div>
                                </figcaption>

                                <div class="product-item">
                                    <figure class="product-style">
                                        <img src="Test/images/product-item7.jpg" alt="Books" class="product-item">
                                        <a href="addtocart?productId=${36}"><button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                Cart</button></a>
                                    </figure>
                                    <figcaption>
                                        <h3>Fashion System</h3>
                                        <span>Arthur Doyle</span>
                                        <div class="item-price">
                                            <span class="prev-price">$ 55.00</span>$ 45.00
                                        </div>
                                </div>
                                </figcaption>

                                <div class="product-item">
                                    <figure class="product-style">
                                        <img src="Test/images/product-item8.jpg" alt="Books" class="product-item">
                                        <a href="addtocart?productId=${37}"><button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                Cart</button></a>
                                    </figure>
                                    <figcaption>
                                        <h3>Musical</h3>
                                        <span>Klien Marry</span>
                                        <div class="item-price">
                                            <span class="prev-price">$ 38.00</span>$ 35.00
                                        </div>
                                </div>
                                </figcaption>

                                <div class="product-item">
                                    <figure class="product-style">
                                        <img src="Test/images/product-item2.jpg" alt="Books" class="product-item">
                                        <a href="addtocart?productId=${30}"><button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                                Cart</button></a>
                                    </figure>
                                    <figcaption>
                                        <h3>Simple way of piece life</h3>
                                        <span>Armor Ramsey</span>
                                        <div class="item-price">
                                            <span class="prev-price">$ 65.00</span>$ 60.00
                                        </div>
                                    </figcaption>
                                </div>
                            </div><!--grid-->
                        </div>
                    </div><!--inner-content-->
                </div>
            </div>
        </section>

        <section id="subscribe">
            <div class="container">
                <div class="row justify-content-center">

                    <div class="col-md-8">
                        <div class="row">

                            <div class="col-md-6">

                                <div class="title-element">
                                    <h2 class="section-title divider">Subscribe to our newsletter</h2>
                                </div>

                            </div>
                            <div class="col-md-6">

                                <div class="subscribe-content" data-aos="fade-up">
                                    <p>Sed eu feugiat amet, libero ipsum enim pharetra hac dolor sit amet, consectetur. Elit
                                        adipiscing enim pharetra hac.</p>
                                    <form id="form">
                                        <input type="text" name="email" placeholder="Enter your email addresss here">
                                        <button class="btn-subscribe">
                                            <span>send</span>
                                            <i class="icon icon-send"></i>
                                        </button>
                                    </form>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </section>

        <section id="latest-blog" class="py-5 my-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="section-header align-center">
                            <div class="title">
                                <span>Read our articles</span>
                            </div>
                            <h2 class="section-title">Latest Articles</h2>
                        </div>

                        <div class="row">

                            <div class="col-md-4">

                                <article class="column" data-aos="fade-up">

                                    <figure>
                                        <a href="#" class="image-hvr-effect">
                                            <img src="Test/images/post-img1.jpg" alt="post" class="post-image">
                                        </a>
                                    </figure>

                                    <div class="post-item">
                                        <div class="meta-date">Mar 30, 2021</div>
                                        <h3><a href="#">Reading books always makes the moments happy</a></h3>

                                        <div class="links-element">
                                            <div class="categories">inspiration</div>
                                            <div class="social-links">
                                                <ul>
                                                    <li>
                                                        <a href="#"><i class="icon icon-facebook"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#"><i class="icon icon-twitter"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#"><i class="icon icon-behance-square"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div><!--links-element-->

                                    </div>
                                </article>

                            </div>
                            <div class="col-md-4">

                                <article class="column" data-aos="fade-up" data-aos-delay="200">
                                    <figure>
                                        <a href="#" class="image-hvr-effect">
                                            <img src="Test/images/post-img2.jpg" alt="post" class="post-image">
                                        </a>
                                    </figure>
                                    <div class="post-item">
                                        <div class="meta-date">Mar 29, 2021</div>
                                        <h3><a href="#">Reading books always makes the moments happy</a></h3>

                                        <div class="links-element">
                                            <div class="categories">inspiration</div>
                                            <div class="social-links">
                                                <ul>
                                                    <li>
                                                        <a href="#"><i class="icon icon-facebook"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#"><i class="icon icon-twitter"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#"><i class="icon icon-behance-square"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div><!--links-element-->

                                    </div>
                                </article>

                            </div>
                            <div class="col-md-4">

                                <article class="column" data-aos="fade-up" data-aos-delay="400">
                                    <figure>
                                        <a href="#" class="image-hvr-effect">
                                            <img src="Test/images/post-img3.jpg" alt="post" class="post-image">
                                        </a>
                                    </figure>
                                    <div class="post-item">
                                        <div class="meta-date">Feb 27, 2021</div>
                                        <h3><a href="#">Reading books always makes the moments happy</a></h3>

                                        <div class="links-element">
                                            <div class="categories">inspiration</div>
                                            <div class="social-links">
                                                <ul>
                                                    <li>
                                                        <a href="#"><i class="icon icon-facebook"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#"><i class="icon icon-twitter"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#"><i class="icon icon-behance-square"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div><!--links-element-->

                                    </div>
                                </article>

                            </div>

                        </div>

                        <div class="row">

                            <div class="btn-wrap align-center">
                                <a href="#" class="btn btn-outline-accent btn-accent-arrow" tabindex="0">Read All Articles<i
                                        class="icon icon-ns-arrow-right"></i></a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section id="download-app" class="leaf-pattern-overlay">
            <div class="corner-pattern-overlay"></div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="row">

                            <div class="col-md-5">
                                <figure>
                                    <img src="Test/images/device.png" alt="phone" class="single-image">
                                </figure>
                            </div>

                            <div class="col-md-7">
                                <div class="app-info">
                                    <h2 class="section-title divider">Download our app now !</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis sed ptibus
                                        liberolectus nonet psryroin. Amet sed lorem posuere sit iaculis amet, ac urna.
                                        Adipiscing fames semper erat ac in suspendisse iaculis.</p>
                                    <div class="google-app">
                                        <img src="Test/images/google-play.jpg" alt="google play">
                                        <img src="Test/images/app-store.jpg" alt="app store">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer id="footer">
            <div class="container">
                <div class="row">

                    <div class="col-md-4">

                        <div class="footer-item">
                            <div class="company-brand">
                                <img src="Test/images/main-logo.png" alt="logo" class="footer-logo">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis sed ptibus liberolectus
                                    nonet psryroin. Amet sed lorem posuere sit iaculis amet, ac urna. Adipiscing fames
                                    semper erat ac in suspendisse iaculis.</p>
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

        <div id="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="copyright">
                            <div class="row">

                                <div class="col-md-6">
                                    <p>© 2022 All rights reserved. Free HTML Template by <a
                                            href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a></p>
                                </div>

                                <div class="col-md-6">
                                    <div class="social-links align-right">
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
                                    </div>
                                </div>

                            </div>
                        </div><!--grid-->

                    </div><!--footer-bottom-content-->
                </div>
            </div>
        </div>
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
