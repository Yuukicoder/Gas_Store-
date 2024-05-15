<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <div class="bg-secondary text-center rounded p-4">

                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">All user</h6>
                            </div>
                            <div class="container-fluid pt-4 px-4">
                                <div class="container-fluid pt-4 px-4">
                                    <div class="bg-secondary text-center rounded p-4">
                                        <div class="col-lg-4 col-6 text-left">


                                            <form action="search1" method="post">
                                                <div class="input-group" style="margin-bottom: 1rem">
                                                    <input type="text" class="form-control bg-dark border-0" placeholder="Search for account" name="search">
                                                    <div class="input-group-append">
                                                        <span class="input-group-text bg-transparent text-primary" style="    border: none;
                                                              margin-top: 4px;">
                                                            <button type="submit" class="fa fa-search" style="text-decoration: none; border: none;background: white;"></button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>



                                        <div class="table-responsive">
                                            <table id="productTable" class="table text-start align-middle table-bordered table-hover mb-0">
                                                <thead>
                                                    <tr class="text-white">
                                                        <th scope="col">Account ID</th>
                                                        <th scope="col">Username</th>
                                                        <th scope="col">Full Name</th>
                                                        <th scope="col">Phone</th>
                                                        <th scope="col">Email</th>
                                                        <th scope="col">Address</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="la" items="${requestScope.listAccount}">
                                                        <c:if test="${la.getRole() == 0}">
                                                            <tr>
                                                                <td>${la.getAccountID()}</td>
                                                                <td>${la.getUsername()}</td>
                                                                <td>${la.getFullname()}</td>
                                                                <td>${la.getPhone()}</td>
                                                                <td>${la.getEmail()}</td>
                                                                <td>${la.getAddress()}</td>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                </tbody>
                                            </table>


                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Blank End -->


                            <!-- Footer Start -->

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
                    <style>
                        #productTable {
                            border-collapse: collapse;
                            width: 100%;
                        }

                        #productTable td, #productTable th {
                            border: 1px solid #ddd;
                            padding: 8px;
                        }

                        #productTable tr:nth-child(even){
                            background-color: #f2f2f2;
                        }

                        #productTable tr:hover {
                            background-color: #ddd;
                        }

                        #productTable th {
                            padding-top: 12px;
                            padding-bottom: 12px;
                            text-align: left;
                            background-color: #22A699;
                            color: white;
                        }
                    </style>
                    </body>

                    </html>