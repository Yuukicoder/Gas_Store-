<%-- 
    Document   : EditTierBenefit
    Created on : 23 Jul 2024, 22:39:07
    Author     : Vu Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <%@include file="component/SideBarAdmin.jsp" %>

            <!-- Content Start -->
            <div class="content">
                <%@include file="component/navbarAdmin.jsp" %>
                <!-- Blank Start -->

                <div class="container-fluid pt-4 px-4">
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">
                            <div class="col-sm-12 col-xl-6">
                                <div class="bg-secondary rounded h-100 p-4">
                                    <h6 class="mb-4">Edit Category</h6>
                                    <form action="UpdateTierBenefit" method="POST">
                                        <div class="mb-3">
                                            <label class="form-label">Name</label>
                                            <input type="text" class="form-control" name="name" id="name" value="${m.getTierName()}">                                         
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Min Point</label>
                                            <input type="number" class="form-control" name="minPoint" id="minPoint" value="${m.getMinPoints()}">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Max Point</label>
                                            <input type="number" class="form-control" name="maxPoint" id="maxPoint" value="${m.getMaxPoints()}">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">	Discount Percentage</label>
                                            <input type="number" class="form-control" name="discount" id="discount" value="${m.getDiscountPercentage()}">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Bonus Point Rate</label>
                                            <input type="number" class="form-control" name="pointRate" id="pointRate" value="${m.getBonusPointsRate()}">
                                        </div>
                                        <input type="hidden" id="id" name="id" value="${m.getTierID()}">
                                        <button type="submit" class="btn btn-primary">Edit Benefit</button>
                                    </form>
                                    <div style="color: red">
                                        <p>${mess}</p>
                                    </div>
                                </div>
                            </div> 

                        </div>
                    </div>
                    <!-- Blank End -->
                    <!--Modal-->
                    <!-- Footer Start -->
                    <div class="container-fluid pt-4 px-4">

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