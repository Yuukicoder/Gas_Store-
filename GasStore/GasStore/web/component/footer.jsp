
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* CSS for footer */
            .container-fluid {
                /*                background-color: #003049;  Dark blue background for the entire footer */
/*                color: #ffffff;  White text color for better readability */
            }

            .text-secondary {
                color: #f0f0f0;  /*Lighter text color for secondary text */
            }

            .text-primary {
                /*color: #780000;  Red color for primary elements like links and icons */
            }

            a.text-secondary:hover {
                /*color: #cccccc;  Lighter grey for hover state of links */
            }

            .btn-primary {
                background-color: #780000; /* Red background for social media buttons */
                border-color: #780000; /* Red border for social media buttons */
            }

            .btn-primary:hover {
                background-color: #a00000; /* Slightly lighter red for hover state */
                border-color: #a00000; /* Slightly lighter red border for hover state */
            }

            .border-top {
                border-color: rgba(255, 255, 255, .1) !important; /* Light border top with opacity */
            }

            /* Ensuring that the footer stays dark blue */
            .bg-dark {
                background-color: #003049 !important;
            }

            /* Specific adjustments for link colors */
            a {
                color: #780000;
                text-decoration: none; /* Remove underline from links */
            }

            a:hover {
                color: #a00000; /* Lighter red for hover state */
            }
            /* CSS to change the color of social media icons */
            .fab {
                color: #ffffff; /* Set the icon color to white */
            }

            .btn-primary:hover .fab {
                color: #dddddd; /* Slightly darker color for icons on hover */
            }


        </style>

    </head>
    <body>
        <div class="container-fluid bg-dark text-secondary mt-5 pt-5" style="color: #ffffff;">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <h5 class="text-secondary text-uppercase mb-4">VỀ Gas Store & MORE</h5>
                    <p class="mb-4">Welcome to Gas Store- Convenient Energy, Comfortable Living.</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Residential land Hoa Lac, Km29, ĐCT08, Thach Hoa, Thach That, Ha Noi</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>https://gitlab.com/asusrogg14/swp391-laptopshop</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                </div>
                <div class="col-lg-8 col-md-12">

                    <div class="row">
                        <c:forEach items="${footerList}" var="map">
                            <c:set var="categoryName" value="${map.key}" />
                            <c:set var="postList" value="${map.value}" />

                            <div class="col-md-4 mb-5">
                                <h5 class="text-secondary text-uppercase mb-4">${categoryName}</h5>
                                <div class="d-flex flex-column justify-content-start">
                                    <!--<a class="text-secondary mb-2" href="home"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                    <a class="text-secondary mb-2" href="shop"><i class="fa fa-angle-right mr-2"></i>Shop</a>
                                    <a class="text-secondary mb-2" href="cart"><i class="fa fa-angle-right mr-2"></i>Cart</a>-->
                                    <c:forEach items="${postList}" var="p">
                                        <a class="text-secondary mb-2" href="postDetail?postID=${p.getPostID()}"><i class="fa fa-angle-right mr-2"></i>${p.getTitle()}</a>
                                        </c:forEach>

                                </div>
                            </div>
                        </c:forEach>
                        <!--<div class="col-md-4 mb-5">
                        <h5 class="text-secondary text-uppercase mb-4">My Account</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-secondary mb-2" href="home"><i class="fa fa-angle-right mr-2"></i>Home</a>
                            <a class="text-secondary mb-2" href="shop"><i class="fa fa-angle-right mr-2"></i>Shop</a>

                            <a class="text-secondary mb-2" href="cart"><i class="fa fa-angle-right mr-2"></i>Card</a>
                        </div>
                    </div>-->
                        <div class="col-md-4 mb-5">

                            <h6 class="text-secondary text-uppercase mt-4 mb-3">Social Media</h6>
                            <div class="d-flex">
                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                                <a class="btn btn-primary btn-square" href="https://www.instagram.com/newt_tryhard/ "><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row border-top mx-xl-5 py-4" style="border-color: rgba(256, 256, 256, .1) !important;">
                <div class="col-md-6 px-xl-0">
                    <p class="mb-md-0 text-center text-md-left text-secondary">
                        &copy;Design by SWP391- GROUP 6
                        <a class="text-primary" href="https://github.com/Yuukicoder/Gas_Store-"> View & Reference to Gitlab</a>
                    </p>
                </div>
                <div class="col-md-6 px-xl-0 text-center text-md-right">
                    <img class="img-fluid" src="img/payments.png" alt="">
                </div>
            </div>
        </div>
    </body>
</html>
