<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>GasStore</title>
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

    <!-- View Feedback Start -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="bg-light p-30">
                    <h4 class="mb-4 text-center">View Feedback</h4>

                    <table class="table table-light table-borderless table-hover text-center mb-4">
                        <img class="img-fluid w-100" src="${feedback.product.image}" style="width: 650px; height: 250px; max-width: 70%; margin: 0 auto; display: block;" alt="">
                        <p style="text-align: center;">${feedback.product.name}</p>
                    </table>

                    <div class="d-flex my-3">
                        <p class="mb-0 mr-2">Your Rating * :</p>
                        <div class="text-primary">
                            <c:forEach var="i" begin="1" end="5">
                                <i class="${i <= feedback.rating ? 'fas' : 'far'} fa-star text-primary"></i>
                            </c:forEach>
                        </div>
                    </div>
                    <p style="color: black; text-align: center;">${feedback.ratingText}</p>
                    <div class="form-group">
                        <label for="message">Your Review:</label>
                        <textarea id="message" cols="30" rows="5" class="form-control" readonly>${feedback.text}</textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- View Feedback End -->

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
</body>

</html>
