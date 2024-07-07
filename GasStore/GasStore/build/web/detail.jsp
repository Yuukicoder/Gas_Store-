<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.*" %>
<%@page import="DTO.*" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">

        <title>GasStore - Online Shop Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        
        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            .carousel-inner img {
                width: 100%;
                height: 500px; 
                object-fit: cover;
            }
            
            .container-fluid i{
                color: black;
            }
            .custom-nav {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                width: 100%;
                display: flex;
                justify-content: space-between;
                z-index: 1000; /* Đảm bảo nút điều hướng hiển thị trên carousel */
            }

            .owl-prev,
            .owl-next {
                background-color: rgba(255, 255, 255, 0.5);
                border: none;
                cursor: pointer;
                padding: 10px;
            }

            .owl-prev:hover,
            .owl-next:hover {
                background-color: rgba(255, 255, 255, 0.8);
            }

            .owl-next {
                margin-right: 30px;
            }
        </style>
    </head>

    <body>
        <%@include file="component/topbar.jsp" %>
        <%@include file="component/navbar.jsp" %>
        <%@ page pageEncoding="UTF-8" %>

        <!-- Breadcrumb Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-12">
                    <nav class="breadcrumb bg-light mb-30">
                        <a class="breadcrumb-item text-dark" href="home">Home</a>
                        <a class="breadcrumb-item text-dark" href="shop">Shop</a>
                        <span class="breadcrumb-item active">Shop Detail</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

                    <!-- Shop Detail Start -->
                    <c:set var="pro" value="${requestScope.detail}" />
                    <div class="container-fluid pb-5">
                        <div class="row px-xl-5">
                            <div class="col-lg-5 mb-30">
                                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner bg-light">
                                        <div class="carousel-item active">
                                            <img  src="${pro.image}" alt="Image">
                                        </div>
                                        <c:forEach items="${requestScope.pimgs}" var="c">
                                            <div class="carousel-item">
                                                <img  src="${c.getPath()}" alt="Image">
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                                    </a>
                                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="col-lg-7 h-auto mb-30">
                                <div class="h-100 bg-light p-30">
                                    <h3>${pro.name}</h3>
                                    <h3 class="font-weight-semi-bold mb-4" style="color: green;">${formattedPrice} VND</h3>  
                                    <div class="d-flex mb-3">
                                        <i class="fa fa-pen"></i>&nbsp;&nbsp;
                                        <strong class="text-dark mr-3">${pro.shortDescription}</strong>
                                    </div>
                                    <div class="d-flex mb-3">
                                        <i class="fa fa-tag"></i>&nbsp;&nbsp;
                                        <strong class="text-dark mr-3">Category: ${requestScope.categoryName}</strong>
                                    </div>
                                    <div class="d-flex mb-3">
                                        <i class="fa fa-industry"></i>&nbsp;&nbsp;
                                        <strong class="text-dark mr-3">Supplier: ${requestScope.supplierName}</strong>
                                    </div>
                                    <div class="d-flex mb-3">
                                        <i class="fa fa-store"></i>&nbsp;&nbsp;
                                        <strong class="text-dark mr-3">Stock Quantity: ${pro.stockQuantity}</strong>
                                    </div>
                                    <div class="d-flex mb-3">
                                        <i class="fa fa-box"></i>&nbsp;&nbsp;
                                        <strong class="text-dark mr-3">Units on Order: ${pro.unitOnOrders}</strong>
                                    </div>
                                    

                                    <form name="f" action="" method="post">
                                        <div class="d-flex align-items-center mb-4 pt-2">
                                            <div class="input-group quantity mr-3" style="width: 130px;">
                                                <div class="input-group-btn">
                                                    <button type="button" class="btn btn-warning btn-minus" style="background-color: #ffc107; border-color: #ffc107;">
                                                        <i class="fa fa-minus" style="color: #000000;"></i>
                                                    </button>
                                                </div>
                                                <input type="text" class="form-control bg-secondary border-0 text-center" name="num" value="1"/> 
                                                <div class="input-group-btn">
                                                    <button type="button" class="btn btn-warning btn-plus" style="background-color: #ffc107; border-color: #ffc107;">
                                                        <i class="fa fa-plus" style="color: #000000;"></i>
                                                    </button>
                                                </div>
                                            </div>

                                            <button class="btn btn-warning px-3" style="background-color: #ffc107; border-color: #ffc107;" onclick="buy('${pro.productID}')">
                                                <i class="fa fa-shopping-cart mr-1" style="color: #000000;"></i> 
                                                Add To Cart
                                            </button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row px-xl-5">
                        <div class="col">
                            <div class="bg-light p-30">
                                <div class="nav nav-tabs mb-4">
                                    <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Description</a>
                                </div>
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="tab-pane-1">
                                        <h4 class="mb-3">Product Description</h4>
                                        <p>${pro.description}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Shop Detail End -->

                    <!-- Products Start -->
                    <div class="container-fluid py-5">
                        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">You May Also Like</span></h2>
                        <div class="col">
                            <div class="owl-carousel related-carousel">
                                <c:forEach var="pro" items="${requestScope.alsoLike}">
                                    <div class="product-item bg-light">
                                        <div class="product-img position-relative overflow-hidden">
                                            <img class="img-fluid w-100" src="${pro.image}" style="width: 650px; height: 250px" alt="">
                                        </div>
                                        <div class="text-center py-4">
                                            <a class="h6 text-decoration-none text-truncate" href="productDetail?id=${pro.productID}">${pro.name}</a>
                                            <div class="d-flex align-items-center justify-content-center mt-2">
                                                <h5 style="color: green">${pro.getFormattedPrice()} VND</h5><h6 class="text-muted ml-2"></h6>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-center mb-1">
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="custom-nav">
                                <button class="owl-prev"><i class="fa fa-chevron-left"></i></button>
                                <button class="owl-next"><i class="fa fa-chevron-right"></i></button>
                            </div>
                        </div>

                    </div>
                    <!-- Products End -->


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
                        // Hiển thị alert "add thành công" sau khi form được submit
                        showSuccessAlert();
                    }
                    function showSuccessAlert() {
                        alert("Product added successfully to the cart!");
                    }
                    </script>

                    <script>
                        var quantityFromServlet = "${detail.stockQuantity}";
                        var quantity = parseInt(quantityFromServlet);
                        if (isNaN(quantity)) {
                            quantity = 0;
                        }
                    </script>
                    
                    
                    <script>
                        $(document).ready(function(){
                            $('.related-carousel').owlCarousel({
                                loop:true,
                                margin:10,
                                nav:false,
                                responsive:{
                                    0:{
                                        items:1
                                    },
                                    600:{
                                        items:3
                                    },
                                    1000:{
                                        items:5
                                    }
                                }
                            });
                            $('.owl-next').click(function() {
                                $('.related-carousel').trigger('next.owl.carousel');
                            });
                            $('.owl-prev').click(function() {
                                $('.related-carousel').trigger('prev.owl.carousel');
                            });
                        });
                    </script>

                    <style>
                        .tick-icon {
                            display: inline-block;
                            width: 10px;
                            height: 10px;
                            border-radius: 50%;
                            background-color: #3cb371;
                            margin-right: 5px;
                        }

                        .brand {
                            color: #009981;
                        }

                    </style>
    </body>
</html>