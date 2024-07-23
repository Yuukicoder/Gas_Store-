<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="DAO.*" %>
<%@page import="DTO.*" %>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%@ page import="java.util.List, java.util.Map" %>
<%
    List<FeedbackDTO> productFeedback = (List<FeedbackDTO>) request.getAttribute("productFeedback");
    Map<Integer, Map<Integer, FeedbackReplyDTO>> allReplies = (Map<Integer, Map<Integer, FeedbackReplyDTO>>) request.getAttribute("allReplies");
%>


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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

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
            .card {
                border: none;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .card-title {
                font-weight: bold;
            }

            .card-text {
                font-size: 16px;
            }

            .text-primary i {
                font-size: 20px;
            }
        </style>
    </head>

    <body>
        
        <%@ page pageEncoding="UTF-8" %>
 <%--<%@include file="component/SideBarAdmin.jsp" %>--%>

        <!-- Breadcrumb Start -->
        
        <!-- Breadcrumb End -->

        <!-- Shop Detail Start -->
        <c:set var="pro" value="${requestScope.detail}" />
        <div class="container-fluid pb-5">
            <div class="row px-xl-5" style="margin-top:33px;">
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


                       

                    </div>
                </div>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="bg-light p-30">
                    <div class="nav nav-tabs mb-4">
                        <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Feedback</a>
                    </div>
                    <div class="tab-content">
                        
                        <div class="tab-pane fade show active" id="tab-pane-1">
                            <h4 class="mb-3">Customer's Feedback & Voting "${pro.name}"</h4>

                            <!-- Average Rating Display -->
                            <div class="mb-4 text-center">
                                <h1 class="text-primary display-4">${averageRating1}/5</h1>
                                <div class="text-primary mb-2">
                                    <c:forEach begin="1" end="${averageRating1}">
                                        <i class="fas fa-star"></i>
                                    </c:forEach>
                                    <c:forEach begin="${averageRating1 + 1}" end="5">
                                        <i class="far fa-star"></i>
                                    </c:forEach>
                                </div>
                                <p class="text-muted">(${totalFeedbackCount} Feedback & Voting)</p>
                            </div>

                            <!-- Feedback List -->
                            <div >
                                <c:forEach var="feedback" items="${requestScope.productFeedback}" varStatus="loop">
                                    <div class="card mb-3 " >
                                            <div class="card-body">
                                                <h5 class="card-title">${feedback.getAccountDTO().getFirstName()}</h5>
                                            <div class="d-flex my-3">
                                                <div class="text-primary mr-2">
                                                    <c:forEach begin="1" end="${feedback.start}">
                                                        <i class="fas fa-star"></i>
                                                    </c:forEach>
                                                    <c:forEach begin="${feedback.start + 1}" end="5">
                                                        <i class="far fa-star"></i>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <h6 class="card-text">${feedback.context}</h6>
                                            <!-- Phản hồi -->
                                            <c:forEach var="replyEntry" items="${allReplies[feedback.feedBackID].entrySet()}">
                                                <div style="margin-left: 20px;">
                                                    <c:set var="reply" value="${replyEntry.value}" />
                                                    <div class="card mb-3 feedbackItem">
                                                        <div class="card-body">
                                                            <!--<p>Reply ID: $replyEntry.replyID}</p>--><h6><i class="fas fa-reply fa-rotate-180"></i>  ${reply.getAccountDTO().getUserName()}</h6>
                                                            <!-- Giả sử 'replyID' là thuộc tính của FeedbackReplyDTO -->
                                                            <p style="margin-left: 30px;">Reply: ${reply.getReply()}</p> 
                                                            <!-- Giả sử 'reply' là thuộc tính của FeedbackReplyDTO -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:forEach>


                                <!-- Load More Button -->
                                <!--<button id="loadMoreBtn" class="btn btn-warning btn-block" style="width: 30%;">View More</button>-->

                            </div>



                        </div>
                    </div>
                </div>
            </div>
        </div>
                            <div class="m-3 mt-4">
                        <a href="tableFeedback" class="btn btn-primary">Back </a>
                    </div>
        <script>
            function setRating(rating) {
                const stars = document.querySelectorAll('#rating .fa-star');
                document.getElementById('rating-input').value = rating;
                stars.forEach((star, index) => {
                    if (index < rating) {
                        star.classList.remove('far');
                        star.classList.add('fas');
                    } else {
                        star.classList.remove('fas');
                        star.classList.add('far');
                    }
                });
            }
        </script>
<!--        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var feedbackList = document.getElementById('feedbackList');
                var loadMoreBtn = document.getElementById('loadMoreBtn');
                var itemsToShow = 1; // Số lượng phản hồi hiển thị ban đầu
                var itemsPerLoad = 5; // Số lượng phản hồi thêm mỗi lần nhấp vào "Xem thêm"

                // Ẩn các phản hồi vượt quá số lượng ban đầu hiển thị
                var feedbackItems = feedbackList.getElementsByClassName('feedbackItem');
                for (var i = itemsToShow; i < feedbackItems.length; i++) {
                    feedbackItems[i].style.display = 'none';
                }

                // Bắt sự kiện khi nhấp vào nút "Xem thêm"
                loadMoreBtn.addEventListener('click', function () {
                    var hiddenItems = feedbackList.querySelectorAll('.feedbackItem:not(:visible)');
                    var itemsToShowNext = Math.min(hiddenItems.length, itemsPerLoad);

                    // Hiển thị thêm số lượng phản hồi được chỉ định
                    for (var i = 0; i < itemsToShowNext; i++) {
                        hiddenItems[i].style.display = 'block';
                    }

                    // Cập nhật số lượng phản hồi đã hiển thị
                    itemsToShow += itemsToShowNext;

                    // Ẩn nút "Xem thêm" nếu không còn phản hồi để hiển thị
                    if (itemsToShow >= feedbackItems.length) {
                        loadMoreBtn.style.display = 'none';
                    }
                });
            });
        </script>-->
        <!-- Shop Detail End -->

       
        <!-- Products End -->


        <!-- Footer Start -->
       
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            $(document).ready(function () {
                $('.related-carousel').owlCarousel({
                    loop: true,
                    margin: 10,
                    nav: false,
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 3
                        },
                        1000: {
                            items: 5
                        }
                    }
                });
                $('.owl-next').click(function () {
                    $('.related-carousel').trigger('next.owl.carousel');
                });
                $('.owl-prev').click(function () {
                    $('.related-carousel').trigger('prev.owl.carousel');
                });
            });
        </script>
<!--        <script>
            $(document).ready(function () {
                var itemsToShow = 5;
                var itemsPerLoad = 5;
                var $feedbackItems = $('.feedbackItem');

                $feedbackItems.slice(itemsToShow).hide();

                $('#loadMoreBtn').on('click', function () {
                    var $hiddenItems = $feedbackItems.filter(':hidden');
                    var itemsToShowNext = Math.min($hiddenItems.length, itemsPerLoad);

                    $hiddenItems.slice(0, itemsToShowNext).fadeIn();

                    itemsToShow += itemsToShowNext;

                    if (itemsToShow >= $feedbackItems.length) {
                        $('#loadMoreBtn').hide();
                    }
                });
            });
        </script>-->
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