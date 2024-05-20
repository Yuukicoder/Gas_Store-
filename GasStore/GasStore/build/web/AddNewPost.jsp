<%-- 
    Document   : EditPost
    Created on : Jul 9, 2023, 3:17:13 PM
    Author     : 1234
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="ckeditor/ckeditor.js"></script>
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

            <%@include file="component/SideBarAdmin.jsp" %>
            <!-- Content Start -->
            <div class="content">
                <%@include file="component/navbarAdmin.jsp" %>
                <form action="AddPost" method="post" enctype="multipart/form-data"onsubmit="return validate_Form()">

                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="left-side">
                                    <label class="form-label" style="color: #E57C23">Title</label>
                                    <textarea id="w3review" name="title" rows="4" cols="50" class="form-control col-3" ></textarea>
                                    <label class="form-label" style="color: #E57C23">Category</label>
                                    <select name="category" id="category" class="form-control col-4">
                                        <c:forEach items="${requestScope.postCategoryDTOs}" var="c">
                                            <option value="${c.getName()}">${c.getName()}</option>
                                        </c:forEach>                                     
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="right-side">
                                    <label class="form-label" style="color: #E57C23">Banner</label>

                                    <input type="file" value="" id="img" class="form-control col-3" name="banner" style="width: 80%; margin-bottom: .5rem; margin-top: .5rem">
                                </div>
                            </div>
                        </div>
                        <label class="form-label" style="color: #E57C23">Content</label>

                        <textarea id="content" name="content" rows="5" cols="80" ></textarea>
                        <script>
                            CKEDITOR.replace('content');
                        </script>
                        <button type="submit"   class="btn btn-primary" style="margin-top: 30px" value="imageAdd" name="update">Add  Post</button> 
                    </div>

                </form>
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


                <script>
                            function validate_Form() {
                                var title = document.getElementById("w3review").value;
                                var banner = document.getElementById("img").value;
                                var description = document.getElementById("content").value;
                              
                                // Kiểm tra  không chứa ký tự đặc biệt
                                var specialCharRegex = /[!@#$%^&*{}|<>]/;

                                if (title === ""|| description === "") {
                                    alert("Please complete full informaton !!!");
                                    return false;
                                }
                                if (specialCharRegex.test(title)) {
                                    alert("Title cannot contain special characters!");
                                    return false;
                                }
                                if (title.trim().length === 0 || title.trim().length <=6) {
                                    alert("Title must not empty and longer than 6 characters!");
                                    return false;
                                }
                                if (banner === "") {
                                    alert("Please choose image to add post !");
                                    return false;
                                }
                                if (description.trim().length <20) {
                                    alert("Content must have more than 20 character !!!");
                                    return false;
                                }

                                return true;

                            }


                </script>

                </body>
                </html>
