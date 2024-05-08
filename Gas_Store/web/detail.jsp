

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>detail</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <!-- Back to top button -->
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
        <link href="css/style1.css" rel="stylesheet"/>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <style>

            .card {
                width: 100%; /* Đặt chiều rộng của khung chứa chi tiết sản phẩm */
                margin-left: 25%; /* Tạo khoảng trống bên trái */
                margin-right: 25%; /* Tạo khoảng trống bên phải */

            }

            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: 300px;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
        </style>
    </head>
    <body>
        <%@include file="common/navBarCommon.jsp" %>

        <!-- Product section-->
        <div class="container">
            <div class="row">

                <div class="col-sm-9">
                    <div class="container">
                        <div class="card">
                            <div class="row" style="background-color:#F3F2EC">
                                <aside class="col-sm-5 border-right">
                                    <article class="gallery-wrap"> 
                                        <div class="img-big-wrap">
                                            <div> <a href="#"><img src="${product.imageUrl}"></a></div>
                                        </div> <!-- slider-product.// -->
                                        <div class="img-small-wrap">
                                        </div> <!-- slider-nav.// -->
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${product.name}</h3>

                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="currency"></span><span class="num">${product.price}</span>
                                            </span> 


                                        </p> <!-- price-detail-wrap .// -->

                                        <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd >
                                                <div id="description-container">
                                                    <p id="description-text">${product.description}</p>
                                                    <button id="see-more-btn" class="btn btn-outline-dark flex-shrink-0">See more</button>

                                                </div>
                                            </dd>
                                        </dl>



                                        <div class="d-flex">
                                            <a href="addtocart?productId=${product.id}" class="btn btn-outline-dark flex-shrink-0" type="button">
                                                <i class="bi-cart-fill me-1"></i>
                                                Add to cart
                                            </a>


                                        </div>
                                    </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                        </div> <!-- card.// -->


                    </div>
                </div>
            </div>
        </div>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Sale products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                    <c:forEach items="${listLast}" var="L">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Sale badge-->
                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                <!-- Product image-->
                                <a href="detail?productId=${L.id}">
                                    <img class="card-img-top" src="${L.imageUrl}" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="bolder">${L.name}</h5>


                                            <!-- Product price-->
                                            <span class="text-muted text-decoration-line-through num">${L.price+10000}VND</span>
                                            <br>
                                            <span class="num">${L.price}</span>
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <!--                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="addtocart?productId=${L.id}">Add to cart</a></div>
                                                                        </div>
                                    -->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center">
                                            <a class="btn btn-outline-dark mt-auto mr-2" href="addtocart?productId=${L.id}">Add to cart</a>

                                        </div>
                                    </div>

                            </div>
                        </div>
                    </c:forEach>


                </div>
            </div>
        </section>

        <%@include file="common/footerCommon.jsp" %>
        <!-- Back to top button -->
        <button type="button" class="btn btn-floating btn-lg" id="btn-back-to-top">
            <i class="fas fa-arrow-up"></i>
        </button>
        <script src="js/Checkboxs.js" ></script>
        <script src="js/Money_charge.js" type="text/javascript"></script>
        <script src="js/scripts.js" type="text/javascript"></script>
    </body>
</html>

