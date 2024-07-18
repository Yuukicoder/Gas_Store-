<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>GasStore - View Feedback</title>
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
        <style>
            .feedback-item {
                padding: 15px;
                background-color: #fff;
                border: 1px solid #e9ecef;
                border-radius: 5px;
                margin-bottom: 20px;
            }

            .feedback-item p {
                margin: 0;
            }

            .star-rating {
                display: flex;
                align-items: center;
            }

            .star-rating .fa-star {
                font-size: 20px;
                color: #ffc107;
                cursor: pointer;
            }

            .star-rating .fa-star.far {
                color: #e4e5e9;
            }

            .star-rating input {
                display: none;
            }

            .breadcrumb {
                background-color: #ffffff;
                padding: 10px 20px;
                border-radius: 5px;
            }

            .table-light {
                border-collapse: separate;
                border-spacing: 0 15px;
            }

            .feedback-item {
                padding: 15px;
                background-color: #ffffff;
                border: 1px solid #e9ecef;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .star-rating {
                display: inline-flex;

                justify-content: center;
                cursor: pointer;
            }

            .star-rating i {
                color: #ddd;
                font-size: 24px;
                transition: color 0.2s;
            }

            .star-rating i.fas {
                color: #f8d64e;
            }

            .star-rating i:hover,
            .star-rating i:hover ~ i {
                color: #f8d64e;
            }

            .bg-light {
                background-color: #f8f9fa !important;
            }

            .table-borderless th,
            .table-borderless td,
            .table-borderless thead th,
            .table-borderless tbody + tbody {
                border: 0;
            }

            .back-to-top {
                position: fixed;
                bottom: 30px;
                right: 30px;
                z-index: 999;
            }

            .back-to-top i {
                font-size: 22px;
            }
        </style>
    </head>

    <body>
        <%@include file="component/topbar.jsp" %>
        <%@include file="component/navbar.jsp" %>

        <!-- Breadcrumb Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-12">
                    <nav class="breadcrumb bg-light mb-30">
                        <a class="breadcrumb-item text-dark" href="home">Home</a>
                        <a class="breadcrumb-item text-dark" href="shop">Shop</a>
                        <a class="breadcrumb-item text-dark" href="mypurchase">My Purchase</a>
                        <span class="breadcrumb-item active">View Feedback</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Feedback List Start -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="bg-light p-30">
                        <h4 class="mb-4 text-center">View Feedback</h4>
                        <table class="table table-light table-borderless table-hover text-center mb-4">
                            <img class="img-fluid w-100" src="${requestScope.productid.image}" style="width: 650px; height: 250px ;max-width: 70%; margin: 0 auto; display: block;" alt="">
                            <p style="text-align: center;">${requestScope.productid.name}</p>
                        </table>
                        <form action="view-feedback" method="Post">
                            <div class="feedback-item mb-4">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <input class="mb-1" name="id" value="${feedbackList.getFeedBackID()} " hidden>
                                        <p class="mb-1"><strong>${feedbackList.getAccountDTO().getFullName()}</strong></p>
                                        <div class="star-rating" data-productid="${requestScope.productid1}" data-orderid="${requestScope.orderid}">
                                            <c:forEach begin="1" end="5" varStatus="status">
                                                <i class="fa <c:if test='${status.index <= feedbackList.getStart()}'>fas</c:if><c:if test='${status.index > feedbackList.getStart()}'>far</c:if> fa-star" data-index="${status.index}"></i>
                                            </c:forEach>
                                                <div>
                                            <input name="rating" value="${feedbackList.getStart()}">
                                                </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="text" class="form-control mt-3" name="feedbackcontent" value="${feedbackList.getContext()}">
                            </div>
                            <button type="submit" class="btn btn-warning mt-3">Update feedback</button>
                        </form>
                        <hr>
                    </div>
                </div>
            </div>
        </div>
        <!-- Feedback List End -->  

        <%@include file="component/footer.jsp" %>

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

        <script>
            $(document).ready(function () {
                $('.star-rating .fa-star').on('click', function () {
                    var $star = $(this);
                    var index = $star.data('index');
                    var productid = $star.parent().data('productid');
                    var orderid = $star.parent().data('orderid');

                    $star.siblings('i').removeClass('fas').addClass('far');
                    for (var i = 1; i <= index; i++) {
                        $star.parent().find('i[data-index=' + i + ']').removeClass('far').addClass('fas');
                    }
                    $star.parent().find('input[name="rating"]').val(index);

                    $.post('view-feedback', {
                        action: 'updateRating',
                        productid: productid,
                        orderid: orderid,
                        rating: index
                    }, function (response) {
                        // Optionally handle the response
                    });
                });
            });
        </script>
    </body>

</html>
