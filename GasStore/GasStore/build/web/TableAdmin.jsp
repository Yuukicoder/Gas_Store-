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
        <style>
            #productTable {
                border-collapse: collapse;
                width: 100%;
                color: #333;
            }

            #productTable td, #productTable th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #productTable tr:nth-child(even) {
                background-color: #f2f2f2;
                color: #000;
            }

            #productTable tr:hover {
                background-color: #ddd;
                color: red;
            }

            #productTable th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #22A699;
                color: white;
            }

            #productTable td {
                color: #111;
            }

            #productTable tr:nth-child(even) td {
                color: #000;
            }

            #productTable tr:hover td {
                color: #000;
            }
            .image-container {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .image-container img {
                width: 100%;
                max-width: 3rem; /* Maximum width as specified */
                height: auto; /* Maintain aspect ratio */
                border: 1px solid #ddd; /* Optional border for better visuals */
                border-radius: 0.25rem; /* Slightly rounded corners */
                box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075); /* Optional shadow */
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
            <!-- Sidebar Start -->
            <%@include file="component/SideBarAdmin.jsp" %>
            <!-- Sidebar End -->

            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file="component/navbarAdmin.jsp" %>
                <!-- Navbar End -->

                <!-- Blank Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-secondary text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h2 class="mb-0">All Employee</h2>
                        </div>
                        <div class="container-fluid pt-4 px-4">
                            <div class="bg-secondary text-center rounded p-4">
                                <div class="row">
                                    <div class="col-lg-8 col-8 text-left m-3">
                                        <div class="col-lg-10 col-10">
                                            <form action="ManageStaff" method="post">
                                                <div class="input-group mb-3">
                                                    <input type="text" class="form-control bg-dark border-0" placeholder="Search for account" name="search">
                                                    <div class="input-group-append">
                                                        <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                                    </div>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-4 col-md-4 m-3 text-right">

                                        <a href="create-admin" class="btn btn-primary">Add new Employee</a>
                                    </div>
                                </div>




                                <div class="table-responsive">
                                    <table id="productTable" class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col">Avatar</th>
                                                <th scope="col">Username</th>
                                                <th scope="col">Role</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Active</th>

                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.adata}" var="l">
                                                <tr>
                                                    <td><div class="image-container"><img src="images/User/${l.getImg()}" alt="alt"/></div></td>
                                                    <td>${l.getUserName()}</td>
                                                    <td>${l.getName()}</td>
                                                    <td>${l.getEmail()}</td>

                                                    <td>${l.isIsActive()}</td>
                                                    <td>
                                                        <a href="create-admin?atype=0&aid=${l.getAdministratorID()}" class="update-button">Update</a><br>
                                                        <a href="ManageStaff?atype=1&aid=${l.getAdministratorID()}">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row">
                                    <div class="pagination ">
                                        <c:if test="${pageNum > 1}">
                                            <a href="?pageNum=${pageNum-1}">Previous</a>
                                        </c:if>
                                        Page ${pageNum} of ${totalPage}
                                        <c:if test="${pageNum < totalPage}">
                                            <a href="?pageNum=${pageNum+1}">Next</a>
                                        </c:if>
                                    </div>

                                </div>
                            </div>



                        </div>
                    </div>
                    <div class="m-3 mt-4">
                        <a href="adminHome" class="btn btn-primary">Back to Manage Account</a>
                    </div>
                </div>

                <!-- Main Content End --><a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
            </div>
            <!-- Content End -->



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
            <script>
                $(document).ready(function () {
                    $('.insert-div').hide(); // Hide the insert div initially

                    $('#toggleInsert').click(function (e) {
                        e.preventDefault();
                        $('.insert-div').toggle();
                    });

                    $('.update-button').click(function () {
                        if ($('.insert-div').is(':hidden')) {
                            $('.insert-div').show();
                        }
                    });
                });
            </script>
    </body>

</html>
