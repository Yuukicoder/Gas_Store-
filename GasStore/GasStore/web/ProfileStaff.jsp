<%-- 
    Document   : ProfileStaff
    Created on : 24 Jul 2024, 01:13:26
    Author     : Vu Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>ADMIN SITE Gas Store</title>
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
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

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


            <!-- Sidebar Start -->
            <%@include file="component/SideBarStaff.jsp" %>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file="component/narbarStaff.jsp" %>
                <!-- Navbar End -->


                <!-- Sale & Revenue Start -->
                <div class="container-fluid pt-4 px-4">

                    <div class="container rounded bg-white mt-3 mb-5">
                        <form action="StaffProfile" method="post" id="formUpdate" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-md-3 col-lg-4 col-6 col-sm-12 border-right">

                                    <input type="text" name="imgString" value="${sessionScope.account.getImg()}" hidden>

                                    <div class="d-flex flex-column align-items-center text-center p-3 py-5 position-relative">                                        
                                        <img id="profileImage" class="mt-5 rounded-circle" width="50%;" src="images/User/${sessionScope.account.getImg()}" alt="images/User/Place Holder.jpg"/>
                                        <div id="imageOverlay" class="image-overlay">
                                            <span class="edit-icon">&#9998;</span> <!-- Unicode for a pen icon -->
                                        </div>
                                        <input type="file" name="pimg" id="imageUpload" class="d-none">

                                        <span class="font-weight-bold">${sessionScope.account.getUserName()}</span>
                                        <span class="text-black-50">${sessionScope.account.getAdminName()}</span>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="p-3 center">
                                            <button class="btn btn-primary" onclick="openPasswordModal()" type="button">
                                                <i class="fa fa-edit"></i>&nbsp;Change Password
                                            </button>
                                        </div>
                                        <br>
                                    </div>

                                </div>

                                <div class="col-md-3 col-lg-4 col-6 col-sm-12 border-right">
                                    <div class="p-3 py-5">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="text-right">Profile Settings</h4>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <label class="labels">User Name</label>
                                                <input type="text" class="form-control" value="${sessionScope.account.getUserName()}" name="username" id="username" required>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Full name</label>
                                                <input type="text" class="form-control" value="${sessionScope.account.getAdminName()}" name="adminName" id="adminName" required>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Email</label>
                                                <input type="text" class="form-control" value="${sessionScope.account.getEmail()}" name="email" id="email" required>
                                            </div>
                                        </div>
                                        <div class="mt-5 text-center">
                                            <button class="btn btn-primary profile-button" type="submit">Save Profile</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </form> 
                        <div style="color: green">
                            ${success}
                        </div>
                        <div style="color: red">
                            ${mess}
                        </div>
                    </div>

                    <!-- Nội dung cửa sổ chứa màn hình chèn phủ -->
                    <div class="overlay" id="modalWrapper" style="display: none;">
                        <div class="col-md-5 border-right" style="background-color: white; max-width: 30%;">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h4 class="text-right">Change Password</h4>
                                </div>

                                <form action="AdminChangePass" method="get">
                                    <div class="row mt-3">
                                        <div class="col-md-12">
                                            <label class="labels">Enter old password</label>
                                            <input type="password" class="form-control" name="oldpass" value="${oldpass}">
                                        </div>
                                        <p style="color: red">${wrongOldPass}</p>
                                        <div class="col-md-12">
                                            <label class="labels">Enter new Password</label>
                                            <input type="password" class="form-control" name="newpass" value="${newpass}">
                                        </div>
                                        <p id="passwordMismatchRegex" style="color: red">${wrongNewPass}</p>
                                        <div class="col-md-12">
                                            <label class="labels">Re-Enter new Password</label>
                                            <input type="password" class="form-control" name="repass" value="${repass}">
                                        </div>
                                        <p id="passwordMismatch" style="color: red">${wrongRePass}</p>
                                    </div>
                                    <div class="mt-5 text-center">
                                        <button class="btn btn-primary profile-button" type="submit">Save Password</button>
                                        <button class="btn btn-secondary profile-button" type="button" onclick="closePasswordModal()">Cancel</button>
                                    </div>
                                    <div class="mt-5 text-center">
                                        <a href="forgotpass">Forget Password?</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!--div để chứa thông báo -->


                </div>
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

        <!-- Template Javascript -->
        <script src="admin/js/main.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>


        <script>
                                            var passAcc = '<%= request.getAttribute("passAcc") %>';
        </script>

        <script>
            function confirmSave() {
                var result = confirm("Are you sure you want to update profile?");
                if (result) {
                    document.getElementById("formUpdate").submit();
                    return true;
                } else {
                    return false;
                }
            }
            function openPasswordModal() {
                document.getElementById('modalWrapper').style.display = 'flex';
                document.body.classList.add('modal-open');
            }

            function closePasswordModal() {
                document.getElementById('modalWrapper').style.display = 'none';
                document.body.classList.remove('modal-open');
            }

            // Check if we need to open the password modal
            document.addEventListener("DOMContentLoaded", function () {
                const openModal = "<%= request.getAttribute("openPasswordModal") != null %>";
                if (openModal === "true") {
                    openPasswordModal();
                }
            });
        </script>

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
            document.getElementById('profileImage').addEventListener('click', function () {
                this.classList.toggle('blur');
                document.getElementById('imageOverlay').style.display = 'flex';
            });

            document.getElementById('imageOverlay').addEventListener('click', function () {
                document.getElementById('imageUpload').click();
            });

            document.getElementById('imageUpload').addEventListener('change', function (event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById('profileImage').src = e.target.result;
                        document.getElementById('profileImage').classList.remove('blur');
                        document.getElementById('imageOverlay').style.display = 'none';
                    }
                    reader.readAsDataURL(file);
                }
            });
        </script>

        <style>
            .image-overlay {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                display: none;
                justify-content: center;
                align-items: center;
                color: white;
                font-size: 24px;
                cursor: pointer;
            }


            #profileImage:hover + #imageOverlay,
            #imageOverlay:hover {
                display: flex;
                background: rgba(0, 0, 0, 0.5);
                width: 180px;
                height: 180px;
                border-radius: 50%;
            }
            /* CSS để cấu trúc giao diện */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
            }

            .col-md-3, .col-md-4, .col-md-5 {
                flex-basis: 0;
                flex-grow: 1;
                max-width: 100%;
            }

            .border-right {
                border-right: 1px solid #ccc;
            }

            .d-flex {
                display: flex;
            }

            .align-items-center {
                align-items: center;
            }

            .text-center {
                text-align: center;
            }

            .py-5 {
                padding-top: 3rem;
                padding-bottom: 3rem;
            }

            .mt-5 {
                margin-top: 3rem;
            }

            /* CSS để tạo cửa sổ */
            .overlay {
                display: flex;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;

            }
            body.modal-open {
                overflow: hidden;
            }
            /* CSS để tạo màn hình che phủ */


            /* Default and focus styles */
            .form-control {
                padding: 10px;
                border: 1px solid #ccc;
                transition: border-color 0.3s ease-in-out, background-color 0.3s ease-in-out;
            }

            /* Styles when input is focused or clicked */
            .form-control:focus{
                border-color: dodgerblue; /* Change border color */
                background-color: lightblue; /* Change background color */
                outline: none; /* Optional: Remove default focus outline */
            }

        </style>
    </body>

</html>