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

            <%@include file="component/SideBarStaff.jsp" %>

            <!-- Content Start -->
            <div class="content">
                <%@include file="component/narbarStaff.jsp" %>
                <!-- Blank Start -->

                <div class="container-fluid pt-4 px-4">
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">
                            <div class="bg-secondary text-center rounded p-4">
                                <h3 style="color: #E57C23">${msg}</h3>

                                <div class="d-flex align-items-center justify-content-between mb-4">
<!--                                    <form action="tableCategory" method="POST">       
                                        <a href="addCate" class="btn btn-primary">Add Category</a>
                                    </form>-->
                                    <form action="staffManageCate" method="post">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-dark border-0" placeholder="Search category" name="search" value="${search}">
                                            <input type="hidden" value="${tag}" name="pageIndex" id="pageIndex">
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
                                    <table id="categoryTable" class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col">Code</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Description</th>
                                                <!--<th scope="col">Action</th>-->
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="la" items="${listCategory}">
                                                <tr>
                                                    <td>${la.getCode()}</td>
                                                    <td>${la.getName()}</td>
                                                    <td>${la.getDescription()}</td>
<!--                                                    <td style=" padding: 0.5rem 0.5rem;
                                                        text-align: center;
                                                        font-size: larger;
                                                        transition: 0.5s;
                                                        color: var(--color-dark);">
                                                        <a href="deleteCate?id=${la.getCategoryID()}" class="bx bxs-trash"  style="  padding: 1rem 1rem; color:#176B87   " onclick="showMess(${la.getCategoryID()})" ></a>
                                                        <a class="bx bxs-pencil" href="editCate?cid=${la.getCategoryID()}" style="  padding: 1rem 1rem; color:#176B87"></a>
                                                    </td>-->
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>



                                    <nav style="float: right;margin-top: 25px; color: black" aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:if test="${tag > 1}">
                                                <li  class="page-item"><a style="color: black"  class="page-link" href="staffManageCate?indexPage=${tag-1}&search=${search}">Previous</a></li>
                                                </c:if>
                                                <c:forEach begin="1" end="${endPage}" var="i">
                                                <li style="color: black"  class="page-item ${tag == i ?"active":"" || page1 == i ?"active":""  } "><a style="color: white;background: #0077b6; border: none"  class="page-link" href="staffManageCate?indexPage=${i}&search=${search}">${i}</a></li>
                                                </c:forEach>
                                                <c:if test="${tag<endPage}">
                                                <li class="page-item"><a style="color: black"  class="page-link" href="staffManageCate?indexPage=${tag+1}&search=${search}">Next</a></li>
                                                </c:if>
                                        </ul>
                                    </nav>
                                </div>

                                <div id="pagination"></div>
                            </div>
                        </div>
                    </div>
                    <!-- Blank End -->
                    <!--Modal-->
                    <!-- Footer Start -->
                    <div class="container-fluid pt-4 px-4">
                        <div class="bg-secondary rounded-top p-4">
                            <div class="row">
                                <div class="col-12 col-sm-6 text-center text-sm-start">
                                    &copy; <a href="#">GasStore</a>, All Right Reserved. 
                                </div>
                                <div class="col-12 col-sm-6 text-center text-sm-end">
                                    <!--/*** This template is free as long as you keep the footer author?s credit link/attribution link/backlink. If you'd like to use the template without the footer author?s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                                    Designed By <a href="https://gitlab.com/asusrogg14/swp391-laptopshop">SWP391 - GROUP 6</a>
                                    <br>Distributed By: <a href="#" >All members</a>
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
            <script>
                                                            function showMess(id) {
                                                                var option = confirm('Are you sure to delete?');
                                                                if (option === true) {
                                                                    window.location.href = 'deleteCate?id=' + id;
                                                                    ;
                                                                } else {
                                                                    event.preventDefault();
                                                                }
                                                            }
            </script>
            <style>
                #categoryTable {
                    border-collapse: collapse;
                    width: 100%;
                }

                #categoryTable td, #categoryTable th {
                    border: 1px solid #ddd;
                    padding: 8px;
                }

                #categoryTable tr:nth-child(even){
                    background-color: #f2f2f2;
                }

                #categoryTable tr:hover {
                    background-color: #ddd;
                }

                #categoryTable th {
                    padding-top: 12px;
                    padding-bottom: 12px;
                    text-align: left;
                    background-color: #0077b6;
                    color: white;
                }
            </style>
    </body>

</html>