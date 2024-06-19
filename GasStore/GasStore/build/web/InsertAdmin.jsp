<%-- 
    Document   : InsertAdmin
    Created on : May 27, 2024, 10:59:57 AM
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
            /* Basic reset for margin and padding */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Style for the image container */
            .image-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-top: 1rem;
            }

            .image-container img {
                width: 100%;
                max-width: 20rem; /* Maximum width as specified */
                height: auto; /* Maintain aspect ratio */
                border: 1px solid #ddd; /* Optional border for better visuals */
                border-radius: 0.25rem; /* Slightly rounded corners */
                box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075); /* Optional shadow */
            }

            .mt-1 {
                margin-top: 1rem; /* Ensuring margin-top is consistent */
            }
            img {
                display: block;
                margin: 0 auto;
                width: 50%; /* Adjust as needed */
            }
            img.thumbnail {
                border: 1px solid #ddd;
                border-radius: 4px;
                padding: 5px;
                width: 150px; /* Adjust as needed */
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

                <div class="container-fluid pt-4 px-4">
                    <div class="bg-secondary text-center rounded p-4">
                        <h2 class="font-weight-bold mb-4">Insert New Account</h2>
                        <form action="create-admin" method="post" enctype="multipart/form-data">
                            <input type="hidden" value="${detail.administratorID}" name="accountID">
                            <div class="row">
                                <div class="col-lg-6 col-12 col-md-6 col-sm-12">

                                    <div class="image-container">
                                        <input type="file" name="pimg"  class="form-control">
                                        <input type="text" name="timg" value="${detail.img}" class="form-control" hidden>
                                        <div class="mt-1" style="width:30%;">
                                            <img style="width: 100%;" src="${detail.img}" alt="User Image"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-6 col-12 col-md-6 col-sm-12">
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="username" name="admin_name" value="${detail.userName}" placeholder="Username">
                                                <label for="username">Username</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="password" class="form-control" id="password" name="passWord" value="${detail.password}" placeholder="Password" <c:if test="${not empty detail.password}">readonly</c:if>>
                                                    <label for="password">Password</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input type="email" class="form-control" id="email" name="aemail" value="${detail.email}" placeholder="Email">
                                                <label for="email">Email</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <select name="active" class="form-control">
                                                    <option value="true" ${detail.isActive ? 'selected' : ''}>Yes</option>
                                                    <option value="false" ${!detail.isActive ? 'selected' : ''}>No</option>
                                                </select>
                                                <label for="active">isActive</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <select name="roleid" class="form-control">
                                                    <c:forEach items="${requestScope.rdata}" var="r">
                                                        <option value="${r.roleID}" <c:if test="${detail.roleID == r.roleID}">selected</c:if>>${r.name}</option>
                                                    </c:forEach>
                                                    <option value="3" <c:if test="${detail.roleID == 3}">selected</c:if>>Customer</option>
                                                </select>
                                                <label for="role">Role</label> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary w-100" name="btnInUp">Insert/Update</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="m-3 mt-4">
                    <a href="ManageStaff" class="btn btn-primary">Back to Manage Account</a>
                </div>
            </div>
            <!-- Main Content End -->

            <!-- Content End -->
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
        <script src="admin/js/main.js"></script>
        <script>
            const pictureURL = document.querySelector('.image-name');
            function changePicture() {
                document.querySelector('#image').src = pictureURL.value;
            }
            pictureURL.addEventListener("input", changePicture)
        </script>

    </body>
</html>
