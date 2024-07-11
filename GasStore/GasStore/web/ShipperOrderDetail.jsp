<%-- 
    Document   : ShipperOrderDetail
    Created on : Jul 6, 2024, 4:32:52 PM
    Author     : Vu anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Admin</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="admin/css/style.css" rel="stylesheet">

        <style>
            /* CSS style for center aligning content in table cells */
            .table th,td {
                text-align: center;
            }
        </style>
    </head>

    <body>
        <div class="container-fluid position-relative d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <%@include file="component/SideBarShipper.jsp" %>

            <!-- Content Start -->
            <div class="content">
                <%@include file="component/navbarShipper.jsp" %>
                <!-- Blank Start -->

                <div class="container-fluid pt-4 px-4">
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">
                            <div class="bg-secondary text-center rounded p-4">
                                <div class="table-responsive">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <a href="ShipperOrderList">Order List</a>
                                    </div>
                                    <h3>Customer Information</h3>
                                    <table id="categoryTable" class="table text-start align-middle table-bordered table-hover mb-0" style="text-align: center">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col">Customer Name</th>
                                                <th scope="col">Phone number</th>
                                                <th scope="col">Ship Address</th>
                                                <th scope="col">Shipped Date</th>
                                                <th scope="col">Payment</th>
                                                <th scope="col" style="text-align: right">Total Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>${customer.getFullName()}</td>
                                                <td>${customer.getPhone()}</td>
                                                <td>${order.getShipAddress()}</td>
                                                <c:if test="${order.getShippedDate() == null}">
                                                    <td>Being ship</td>
                                                </c:if>

                                                <c:if test="${order.getShippedDate() != null}">
                                                    <td>${order.getShippedDate()}</td>
                                                </c:if>
                                                <td></td>
                                                <td style="text-align: right"><fmt:formatNumber value="${order.getTotalMoney()}" pattern="#,##0.#"/>&nbsp;đ</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <br>
                                <div class="table-responsive">     
                                    <h3>Order Detail</h3>
                                    <table id="categoryTable" class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col">No</th>
                                                <th scope="col">OrderID</th>
                                                <th scope="col">Product </th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Unit Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="tt" value="0"/>
                                            <c:forEach var="orderDetail" items="${orderDetails}">
                                                <c:set var="tt" value="${tt+1}"/>
                                                <tr>
                                                    <td>${tt}</td>
                                                    <td>${orderDetail.orderID}</td>
                                                    <td>${pDAO.getProductByID(orderDetail.getProductID()).getName()}</td>
                                                    <td>${orderDetail.quantity}</td>
                                                    <td><fmt:formatNumber value="${orderDetail.unitPrice}" pattern="#,##0.#"/>	&nbsp;đ</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="pagination"></div>
                            </div>
                        </div>
                    </div>

                    <div class="container-fluid pt-4 px-4">
                        <div class="bg-secondary rounded-top p-4">
                            <div class="row">
                                <div class="col-12 col-sm-6 text-center text-sm-start">
                                    &copy; <a href="#">GAS STORE</a>, All Right Reserved. 
                                </div>
                                <div class="col-12 col-sm-6 text-center text-sm-end">
                                    <!--/*** This template is free as long as you keep the footer author?s credit link/attribution link/backlink. If you'd like to use the template without the footer author?s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                                    Designed By <a href="https://gitlab.com/asusrogg14/swp391-laptopshop">SWP - GROUP 6</a>
                                    <br>Distributed By: <a href="https://gitlab.com/asusrogg14/swp391-laptopshop" target="_blank">ALL members</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Footer End -->
                </div>
                <!-- Content End -->


                <!-- Back to Top -->
                <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
            </div>

            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="admin/lib/chart/chart.min.js"></script>
            <script src="admin/lib/easing/easing.min.js"></script>
            <script src="admin/lib/waypoints/waypoints.min.js"></script>
            <script src="admin/lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="admin/lib/tempusdominus/js/moment.min.js"></script>
            <script src="admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

            <!-- Template Javascript -->
            <script src="admin/js/main.js"></script>

    </body>

</html>