<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DTO.*" %> 
<%@page import="DAO.*" %> 
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Gas Store</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/productCard.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>

        </style>
    </head>
    <%
        ProductDAO pd = new ProductDAO();
        List<Product> list = (List<Product>) pd.getAllProduct();
    %>
    <body>


        <%@include file="component/topbar.jsp" %>
        <%@include file="component/navbar.jsp" %>

        <!-- Carousel Start -->
        <div class="container-fluid mb-3">
            <div class="row px-xl-5">
                <div class="col-lg-12">
                    <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#header-carousel" data-slide-to="1"></li>
                            <li data-target="#header-carousel" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item position-relative active" style="height: 430px;">
                                <img class="position-absolute w-100 h-100" src="images/news/Banner/${pdto.getPostbanner()}"
                                     style="object-fit: cover;">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown" style="font-size: 40px; font-weight: 20px">${pdto.getTitle()}</h1>
                                        <p class="mx-md-5 px-5 animate__animated animate__bounceIn" style="
                                           display: -webkit-box;
                                           -webkit-line-clamp: 3;
                                           -webkit-box-orient: vertical;
                                           overflow: hidden;
                                           text-overflow: ellipsis;">${pdto.getDescription()}</p>
                                        <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
                                           href="postDetail?postID=${pdto.getPostID()}">Read More</a>
                                    </div>
                                </div>
                            </div>
                            <c:forEach items="${requestScope.post}" var="c" varStatus="status">
                                <c:if test="${status.index > 0}">
                                    <div class="carousel-item position-relative" style="height: 430px;">
                                        <img class="position-absolute w-100 h-100" src="images/news/Banner/${c.getPostbanner()}"
                                             style="object-fit: cover;">
                                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                            <div class="p-3" style="max-width: 700px;">
                                                <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown" style="font-size: 40px; font-weight: 20px">${c.getTitle()}</h1>
                                                <p class="mx-md-5 px-5 animate__animated animate__bounceIn" style="
                                                   display: -webkit-box;
                                                   -webkit-line-clamp: 3;
                                                   -webkit-box-orient: vertical;
                                                   overflow: hidden;
                                                   text-overflow: ellipsis;">${c.getDescription()}</p>
                                                <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
                                                   href="postDetail?postID=${c.getPostID()}">Read More</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- Carousel End -->


        <!-- Featured Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                        <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured End -->


        <!-- Categories Start -->

        <!-- Categories End -->


        <!-- Products Start -->
        <c:forEach items="${topSell}" var="map">
            <c:set var="categoryName" value="${map.key}" />
            <c:set var="productList" value="${map.value}" />
            <div class="container-fluid pt-5 pb-3">
                <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">SẢN PHẨM ${categoryName} BÁN CHẠY</span></h2>
                <div class="row px-xl-5">

                    <section id="list-product">
                        <div class="product">              
                            <c:forEach items="${productList}" var="p">
                                <div class="card-product">           
                                    <div class="product-img">
                                        <img src="${p.getImage()}" alt="Your Image">
                                        <div class="overlay-product">
                                            <a href="productDetail?id=${p.getProductID()}"><i class="bx bx-search"></i></a>
                                        </div>
                                    </div>
                                    <div    class="product-detail">        
                                        <div class="intro">
                                            <div class="intro-name"><a href="productDetail?id=${p.getProductID()}">${p.getName()}</a></div>                    
                                        </div>
                                        <div class="component-product">
                                            <p><i class='bx bxs-hdd'></i>  Short Description ${p.getShortDescription()} </p>

                                            <p><i class='bx bx-chip' ></i>  Available ${p.getStockQuantity()}</p>
                                            <p><i class='bx bx-chip' ></i>  Sold ${p.getUnitOnOrders()}</p>
                                        </div>             
                                        <div class="button-product">
                                            <div class="price"><fmt:formatNumber value="${p.getUnitPrice()}" type="currency" currencySymbol="" maxFractionDigits="0"/>VND</div> 
                                            
                                            <a class="cart btnn" href = "productDetail?id=${p.getProductID()}">Buy Now</a>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>  
                        </div>
                    </section>

                </div>
            </div>
        </c:forEach>
        <!-- Products End -->


        <!-- Offer Start -->
        <!--        <div class="container-fluid pt-5 pb-3">
                    <div class="row px-xl-5">
                        <div class="col-md-6">
                            <div class="product-offer mb-30" style="height: 300px;">
                                <img class="img-fluid" src="images/Post/sale3.jpg" alt="">
                                <div class="offer-text">
                                    <h6 class="text-white text-uppercase">Save 20%</h6>
                                    <h3 class="text-white mb-3">Special Offer</h3>
                                    <a href="shop.jsp" class="btn btn-primary">Shop Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="product-offer mb-30" style="height: 300px;">
                                <img class="img-fluid" src="images/Post/sale2.jpg" alt="">
                                <div class="offer-text">
                                    <h6 class="text-white text-uppercase">Save 20%</h6>
                                    <h3 class="text-white mb-3">Special Offer</h3>
                                    <a href="shop.jsp" class="btn btn-primary">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
        <!-- Offer End -->

        <!-- Vendor End -->


        <!-- Footer Start -->
        <%@include file="component/footer.jsp" %>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script type="text/javascript">
            function buy(id) {
                var m = document.f.num.value;
                document.f.action = "buy?id=" + id + "&num=" + m;
                document.f.submit();
            }
        </script>
    </body>

</html>