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
        <!--    <style>
                .insert-div {
                    display: none;
                }
            </style>-->
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
                <div class="container-fluid pt-4 px-4 insert-div">
                    <div class="bg-secondary text-center rounded p-4">
                        <c:if test="${empty detail.supplierId}">
                            <h2 class="font-weight-bold mb-4">Insert New Supplier Account</h2>
                        </c:if>
                        <c:if test="${not empty detail.supplierId}">
                            <h2 class="font-weight-bold mb-4">View Supplier Account</h2>
                        </c:if>
                        <form action="insert-supplier" method="post">
                            <input type="hidden" value="${detail.supplierId}" name="account_id">

                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="username" name="username" value="${detail.companyName}" placeholder="Company Name">
                                        <label for="username">Company Name</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="email" name="email" value="${detail.email}" placeholder="Email">
                                        <label for="password">Email</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="phone" name="phone" value="${detail.phone}" placeholder="Phone">
                                        <label for="first_name">Phone</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="last_name" name="HomePage" value="${detail.homePage}" placeholder="HomePage">
                                        <label for="last_name">Home Page</label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary w-100" name="btnInUp">Insert/Update</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

               
                
                                <div class="m-4 mt-4">
                    <a href="ManageSupplier" class="btn btn-primary">Back</a>
                </div>
            </div>
            <!-- Blank End -->




            <!-- Content End -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>
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
            const toggleInsertAnchor = document.getElementById('toggleInsert');
            const insertDiv = document.querySelector('.insert-div');

            toggleInsertAnchor.addEventListener('click', function (event) {
                event.preventDefault();
                if (insertDiv.style.display === 'none') {
                    insertDiv.style.display = 'block';
                } else {
                    insertDiv.style.display = 'none';
                }
            });

            const updateButtons = document.querySelectorAll('.update-button');

            updateButtons.forEach(button => {
                button.addEventListener('click', function () {
                    if (insertDiv.style.display === 'none') {
                        insertDiv.style.display = 'block';
                    }
                });
            });
        </script>
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

    </body>

</html>
