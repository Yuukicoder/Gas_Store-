<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.*" %>
<%@page import="DTO.*" %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">

        <title>LaptopShop - Online Shop Website Template</title>
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
                                <img class="w-100 h-100" src="images/Product/${pro.image}" alt="Image">
                            </div>
                            <c:forEach items="${requestScope.pimgs}" var="c">
                                <div class="carousel-item">
                                    <img class="w-100 h-100" src="images/Product/${c.getPath()}" alt="Image">
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
                        <h3 class="font-weight-semi-bold mb-4" style="color: green;"> $ ${pro.price}</h3>
                        <p class="mb-4"></p>
                        <div class="d-flex mb-4">
                            <i class="fas fa-memory"></i>&nbsp;&nbsp;
                            <strong class="text-dark mr-3">Ram: ${pro.ram}</strong>
                        </div>
                        <div class="d-flex mb-3">
                            <i class="fas fa-hdd"></i>&nbsp;&nbsp;
                            <strong class="text-dark mr-3">Storage: ${pro.storage}</strong>
                        </div>
                        <div class="d-flex mb-3">
                            <i class="fas fa-microchip"></i>&nbsp;&nbsp;
                            <strong class="text-dark mr-3">CPU: ${pro.cpu}</strong>
                        </div>
                        <div class="d-flex mb-3">
                            <i class="fas fa-laptop"></i>&nbsp;&nbsp;
                            <strong class="text-dark mr-3">VGA: ${pro.vga} </strong> 
                        </div>
                        <div class="d-flex mb-3">
                            <i class="fas fa-store"></i>&nbsp;&nbsp;
                            <strong class="text-dark mr-3">Quantity Available: ${pro.quantity} </strong> 
                        </div>
                        <form name="f" action="" method="post">
                            <div class="d-flex align-items-center mb-4 pt-2">
                                <div class="input-group quantity mr-3" style="width: 130px;">
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-primary btn-minus">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control bg-secondary border-0 text-center" name="num" value="1"/> 
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>

                                <button class="btn btn-primary px-3" onclick="buy('${pro.productID}')">
                                    <i class="fa fa-shopping-cart mr-1"></i> 
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
                        <!--                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-2">Information</a>-->
                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-3">Reviews</a>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab-pane-1">
                            <h4 class="mb-3">Product Description</h4>
                            <p>${pro.description}</p>
                        </div>


                        <div class="tab-pane fade" id="tab-pane-3">
                            <div class="row">
                                <div class="col-md-6">

                                    <div class="row">
                                        <div class="col-8">
                                            <div class="progress-block">
                                                <div class="progress-block__line">
                                                    <style>.badge {
                                                            border: none;
                                                            background-color: transparent;
                                                            color: inherit;
                                                        }
                                                        button.badge.badge-outline-grayscale.badge-xs{
                                                            border: 1px solid #edeeef;
                                                        }
                                                        .tags {
                                                            display: inline-flex;
                                                            margin-bottom: 20px;
                                                        }

                                                    </style>
                                                    <h4 class="mb-4">${requestScope.getcount} review for "Product Name"</h4>

                                                    <div class="tags">
                                                        <div class="text text-grayscale-600">Lọc xem theo:</div>
                                                        <div class="list">
                                                            <button class="badge badge-outline-grayscale badge-xs" data-sort="3"><i class="cm-ic-check"></i><span>5 sao</span></button>
                                                            <button class="badge badge-outline-grayscale badge-xs" data-sort="4"><i class="cm-ic-check"></i><span>4 sao</span></button>
                                                            <button class="badge badge-outline-grayscale badge-xs" data-sort="5"><i class="cm-ic-check"></i><span>3 sao</span></button>
                                                            <button class="badge badge-outline-grayscale badge-xs" data-sort="6"><i class="cm-ic-check"></i><span>2 sao</span></button>
                                                            <button class="badge badge-outline-grayscale badge-xs" data-sort="7"><i class="cm-ic-check"></i><span>1 sao</span></button>
                                                        </div>
                                                    </div>



                                                    <c:forEach items="${requestScope.feedback}" var="c">
                                                        <div class="media mb-4">
                                                            <img src="img/No Image.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                                            <div class="media-body">
                                                                <h6>${c.accountDTO.fullname}<small> - <i>${c.date}</i></small></h6>
                                                                <c:if test="${c.start == 1}">
                                                                    <div class="text-primary mb-2">
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="far fa-star"></i>
                                                                        <i class="far fa-star"></i>
                                                                        <i class="far fa-star"></i>
                                                                        <i class="far fa-star"></i>
                                                                    </div>
                                                                </c:if>

                                                                <c:if test="${c.start == 2}">
                                                                    <div class="text-primary mb-2">
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="far fa-star"></i>
                                                                        <i class="far fa-star"></i>
                                                                        <i class="far fa-star"></i>
                                                                    </div>
                                                                </c:if>

                                                                <c:if test="${c.start == 3}">
                                                                    <div class="text-primary mb-2">
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="far fa-star"></i>
                                                                        <i class="far fa-star"></i>
                                                                    </div>
                                                                </c:if>

                                                                <c:if test="${c.start == 4}">
                                                                    <div class="text-primary mb-2">
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="fas fa-star "></i>
                                                                        <i class="far fa-star"></i>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${c.start == 5}">
                                                                    <div class="text-primary mb-2">
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="fas fa-star"></i>
                                                                    </div>
                                                                </c:if>


                                                                <p style="max-width: 30ch; overflow-wrap: break-word;">${c.context}</p> 


                                                                <c:forEach items="${feedbackReplyDAO.getLisfeedbackreply(c.feedBackID)}" var="f"  >
                                                                    <div class="media mb-4">
                                                                        <img src="img/No Image.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                                                        <div class="media-body">  
                                                                            <h6>${f.accountDTO.fullname}<small> - <i style="margin-right: 10px">${f.date}</i> <c:if test="${f.accountDTO.role ==1}"><i class="tick-icon" style="color: #009981"></i> <span class="brand">LapTopShop</span></c:if> </small></h6>

                                                                                <p style="max-width: 30ch; overflow-wrap: break-word;">${f.reply}</p>   
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>




                                                            </div>
                                                        </div>



                                                    </c:forEach>
                                                    <c:set var="idproduct" value="${pro.productID}" />

                                                </div>
                                                <nav style="float: right;margin-top: 25px; color: black" aria-label="Page navigation example">
                                                    <ul class="pagination">
                                                        <c:if test="${tag > 1}">
                                                            <li  class="page-item"><a style="color: black"  class="page-link" href="detailProduct?id=${idproduct}&index=${tag-1}">Previous</a></li>

                                                        </c:if>

                                                        <c:if test="${tag<endP}">
                                                            <c:forEach begin="1" end="${endP}" var="i">


                                                                <li style="color: black"  class="page-item ${tag == i ?"active":"" || page1 == i ?"active":""  } "><a style="color: black"  class="page-link" href="detailProduct?id=${idproduct}&index=${i}">${i}</a></li>
                                                                </c:forEach>
                                                            </c:if>
                                                            <c:if test="${tag<endP}">
                                                            <li class="page-item"><a style="color: black"  class="page-link" href="detailProduct?id=${idproduct}&index=${tag+1}">Next</a></li>

                                                        </c:if>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
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
                                <c:forEach var="pro" items="${requestScope.alsolike}">
                                    <div class="product-item bg-light">
                                        <div class="product-img position-relative overflow-hidden">
                                            <img class="img-fluid w-100" src="images/Product/${pro.image}" style="width: 650px; height: 250px" alt="">
                                            <div class="product-action">

                                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="text-center py-4">
                                            <a class="h6 text-decoration-none text-truncate" href="detailProduct?id=${pro.productID}">${pro.name}</a>
                                            <div class="d-flex align-items-center justify-content-center mt-2">
                                                <h5>$ ${pro.price}</h5><h6 class="text-muted ml-2"></h6>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-center mb-1">
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small>(99)</small>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
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
                        var quantityFromServlet = "${detail.quantity}";
                        var quantity = parseInt(quantityFromServlet);
                        if (isNaN(quantity)) {
                            quantity = 0;
                        }</script>

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