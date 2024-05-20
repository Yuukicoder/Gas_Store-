<%-- 
    Document   : ManageAccount
    Created on : May 20, 2024, 12:47:37 PM
    Author     : vip2021
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DarkPan - Bootstrap 5 Admin Template</title>
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
    </head>

    <body>
        <div class="container-fluid position-relative d-flex p-0">
            <!-- Sidebar Start -->
            <%@include file="component/SideBarAdmin.jsp" %>
            <!-- Sidebar End -->

            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file="component/navbarAdmin.jsp" %>
                <!-- Navbar End -->

                <!-- Manage Account Section Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-secondary text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h2 class="mb-0">Account Management</h2>
                        </div>
                        <div class="row">
                            <!-- Manage User Card -->
                            <div class="col-md-4">
                                <a href="ManageUser" class="text-decoration-none">
                                    <div class="card bg-secondary text-center text-white rounded p-4">
                                        <h2 class="mb-0">Manage User</h2>
                                    </div>
                                </a>
                            </div>

                            <!-- Manage Admin Card -->
                            <div class="col-md-4">
                                <a href="ManageStaff" class="text-decoration-none">
                                    <div class="card bg-secondary text-center text-white rounded p-4">
                                        <h2 class="mb-0">Manage Admin</h2>
                                    </div>
                                </a>
                            </div>

                            <!-- Manage Supplier Card -->
                            <div class="col-md-4">
                                <a href="ManageSupplier" class="text-decoration-none">
                                    <div class="card bg-secondary text-center text-white rounded p-4">
                                        <h2 class="mb-0">Manage Supplier</h2>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Manage Account Section End -->
            </div>
            <!-- Content End -->
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
        <script src="admin/js/main.js"></script>

        <!-- Custom Styles for Tables -->
        <style>
            .card {
                transition: transform 0.2s;
            }

            .card:hover {
                transform: scale(1.05);
            }
        </style>
    </body>
</html>
