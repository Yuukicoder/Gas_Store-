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
                            <h2 class="mb-0">All Supplier</h2>
                        </div>
                        <div class="container-fluid pt-4 px-4">
                            <div class="bg-secondary text-center rounded p-4">
                                <div class="row">
                                    <div class="col-lg-12 col-12  m-3">
                                        <div class="col-lg-6 col-6 text-left">
                                            <form action="ManageSupplier" method="post">
                                                <div class="input-group mb-3">
                                                    <input type="text" class="form-control bg-dark border-0" placeholder="Search for account" name="search">
                                                    <div class="input-group-append">
                                                        <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-lg-6 col-6 col-md-6 m-3 text-right">

                                            <a href="add-supplier" class="btn btn-primary">Add new Supplier </a>

                                        </div>
                                    </div>
                                </div>


                                <div class="table-responsive">
                                    <table id="productTable" class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col"><a href="#"  style="color: #ffffff;">Supplier ID</a></th>
                                                <th scope="col"><a href="#"   style="color: #ffffff;">Company Name</a></th>
                                                <th scope="col"><a href="#"   style="color: #ffffff;">Email</a></th>
                                                <th scope="col">Supplier Page</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.sdata}" var="k">
                                                <tr>
                                                    <td>${k.getSupplierId()}</td>
                                                    <td>${k.getCompanyName()}</td>
                                                    <td>${k.getEmail()}</td>
                                                    <td><a href="${k.getHomePage()}">${k.getHomePage()}</a></td>
                                                    <td>
                                                        <a href="insert-supplier?type=0&id=${k.getSupplierId()}" class="update-button">View</a><br>
                                                        <a href="ManageSupplier?type=1&id=${k.getSupplierId()}">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="pagination row">
                                    <div class="col-lg-6">
                                        <c:if test="${pageNum>1}"><a href="?pageNum=${pageNum-1}">Previous</a></c:if>
                                        Page ${pageNum} of ${totalPages}
                                        <c:if test="${pageNum<totalPages}"><a href="?pageNum=${pageNum+1}">Next</a></c:if>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                    <!-- Blank End -->
                    <div class="m-4 mt-4">
                        <a href="adminHome" class="btn btn-primary">Back to Manager Account</a>
                    </div>

                </div>

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
                                                    function sortTable(columnIndex) {
                                                        var table, rows, switching, i, x, y, shouldSwitch;
                                                        table = document.getElementById("productTable");
                                                        switching = true;
                                                        while (switching) {
                                                            switching = false;
                                                            rows = table.rows;
                                                            for (i = 1; i < (rows.length - 1); i++) {
                                                                shouldSwitch = false;
                                                                x = rows[i].getElementsByTagName("TD")[columnIndex];
                                                                y = rows[i + 1].getElementsByTagName("TD")[columnIndex];
                                                                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                                                    shouldSwitch = true;
                                                                    break;
                                                                }
                                                            }
                                                            if (shouldSwitch) {
                                                                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                                                                switching = true;
                                                            }
                                                        }
                                                    }
            </script>
        
    </body>

</html>
