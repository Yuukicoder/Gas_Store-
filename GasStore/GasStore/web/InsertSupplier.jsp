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
                                        <input type="text" class="form-control" id="username" name="username" value="${detail.companyName}" placeholder="Company Name" readonly>
                                        <label for="username">Company Name</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="email" name="email" value="${detail.email}" placeholder="Email" readonly>
                                        <label for="password">Email</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="phone" name="phone" value="${detail.phone}" placeholder="Phone" readonly>
                                        <label for="first_name">Phone</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="last_name" name="HomePage" value="${detail.homePage}" placeholder="HomePage" readonly>
                                        <label for="last_name">Home Page</label>
                                    </div>
                                </div>
                                
                                
                            </div>
                        </form>
                    </div>
                </div>
                <div class="container-fluid pt-4 px-4">
                    
                        <div class="row g-4">
                            <div class="col-sm-12 col-xl-6
                                 ">
                            </div> 
                            <div class="bg-secondary text-center rounded p-4">
                                <h3 style="color: #E57C23">${msg}</h3>

                                <div class="d-flex align-items-center justify-content-between mb-4">

                                    <div class="bg-secondary rounded h-100 p-4">

                                        <h5 ><a href="productManage">All Product </a></h5>
                                    </div>
                                    <form action="supplier-product?action=show" method="post">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-dark border-0" placeholder="Search name product" name="search">
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
                                                <th scope="col"></th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Category</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Price</th>
                                                <!--<th scope="col"></th>-->

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.productCmap}" var="c">
                                                <tr>
                                                    <td><img style="width: 80px" src="${c.getKey().getImage()}" alt="alt"/></td>
                                                    <td >
                                                        <a class="name"  href="productUpdate?pid=${c.getKey().getProductID()}">${c.getKey().getName()}</a>
                                                    </td>  
                                                    <td>${c.getValue()}</td>
                                                    <td>
                                                        <c:if test="${c.getKey().getStockQuantity() != 0}">
                                                            <span class="status-green"></span>
                                                            ${c.getKey().getStockQuantity()}
                                                        </c:if>
                                                        <c:if test="${c.getKey().getStockQuantity() == 0}">
                                                            <span class="status-red"></span>
                                                            ${c.getKey().getStockQuantity()}
                                                        </c:if>                                         
                                                    </td>
                                                    <td>${c.getKey().getUnitPrice()}</td>
                                                    
<!--                                                    <td style=" padding: 0.5rem 0.5rem;
                                                        text-align: center;
                                                        font-size: larger;
                                                        transition: 0.5s;
                                                        color: var(--color-dark);">
                                                        <a href="#" class="bx bxs-hide" 
                                                           style="  padding: 1rem 1rem; color:#176B87
                                                           " onclick="showMess(${c.getKey().getProductID()})"
                                                           ></a>
                                                        <a class="bx bxs-pencil" href="productUpdate?pid=${c.getKey().getProductID()}" style="  padding: 1rem 1rem; color:#176B87"></a>
                                                    </td>-->
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
<!--                                    <a href="productAdd" class="btn btn-primary">Add new product</a>
                                    <button style="    background: #0077b6;
                                            text-decoration: none;
                                            border: none;
                                            height: 2.3rem;
                                            border-radius: 5px; margin-top: 25px"><a href="productManage?action=hide" style="color: white"> Hide Product</a>
                                    </button>-->

                                    
                                </div>

                                <div id="pagination"></div>
                            </div>
                        </div>
                    
                    <!-- Blank End -->
                    <!--Modal-->
                    <!-- Footer Start -->

                    <!-- Footer End -->
                </div>

                <!-- Footer Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-secondary text-center rounded p-4">
                        <div class="text-center">
                            &copy; <a href="#">GasStore</a>, All Right Reserved.
                            <!-- Designed By <a href="https://htmlcodex.com">HTML Codex</a> -->
                        </div>
                    </div>
                </div>
                <!-- Footer End -->
                <div class="m-4 mt-4">
                    <a href="ManageSupplier" class="btn btn-primary">Back</a>
                </div>
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
