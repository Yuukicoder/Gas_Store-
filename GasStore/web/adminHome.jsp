<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>ADMIN SITE LAPTOPSHOP</title>
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
            <%@include file="component/SideBarAdmin.jsp" %>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file="component/navbarAdmin.jsp" %>
                <!-- Navbar End -->


                <!-- Sale & Revenue Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                <i class="bx bx-user fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">New Customer Today</p>
                                    <h6 class="mb-0">${newAccount}</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                <i class="bx bx-package fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">New Product Today</p>
                                    <h6 class="mb-0">${newProduct}</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                <i class="bx bx-shopping-bag fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Orders Today</p>
                                    <h6 class="mb-0">${orderToday}</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4" style="background-color: #22A699;">
                                <i class="bx bx-money-withdraw fa-3x text-primary" style="color: white;"></i>
                                <div class="ms-3">
                                    <p class="mb-2" style="color: white">Revenue Today</p>
                                    <h6 class="mb-0" style="color: white">$ ${incomeToday}</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4" >
                                <i class="bx bx-user fa-3x text-primary" ></i>
                                <div class="ms-3">
                                    <p class="mb-2">Total Customer</p>
                                    <h6 class="mb-0" >${totalCustomer}</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                <i class="bx bx-package fa-3x text-primary" ></i>
                                <div class="ms-3">
                                    <p class="mb-2" >Total Product</p>
                                    <h6 class="mb-0" >${totalProduct}</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4" >
                                <i class="bx bx-shopping-bag fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2" >Total Order Delivered</p>
                                    <h6 class="mb-0">${totalOrderDelivered}</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4" >
                                <i class="bx bx-money-withdraw fa-3x text-primary" ></i>
                                <div class="ms-3">
                                    <p class="mb-2" >Total Order Canceled</p>
                                    <h6 class="mb-0" >${totalOrderDelivered}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sale & Revenue End -->
                <!-- Recent Sales Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-secondary text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Recent Salse</h6>
                            <a href="tableOrder">Show All</a>
                        </div>
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-white">
                                        <th scope="col">Date</th>
                                        <th scope="col">Invoice</th>
                                        <th scope="col">Customer</th>
                                        <th scope="col">Amount</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="la" items="${ListOrder}">
                                        <c:set var="tt" value="${tt+1}"/>
                                        <tr>
                                            <td>${la.getOrderDate()}</td>
                                            <td>${la.getOrderID()}</td>
                                            <td>${la.getFullname()}</td>
                                            <td>${la.getTotalPrice()}</td>

                                            <td class="col-md-3">
                                                <c:if test="${la.getStatus() != 4 && la.getStatus() != 3}">
                                                    <select class="form-select form-select-sm col-md-3" aria-label=".form-select-sm example" onchange="handleOptionChange(this)">
                                                        <c:if test="${la.getStatus() == 0}">
                                                            <option>Waiting for progressing</option>
                                                            <option value="1" name="${la.getOrderID()}">Confirmed and packed</option>
                                                            <option value="2" name="${la.getOrderID()}">Being transported</option>
                                                            <option value="3" name="${la.getOrderID()}">Delivered</option>
                                                            <option value="4" name="${la.getOrderID()}">Cancel order</option>
                                                        </c:if>
                                                        <c:if test="${la.getStatus() == 1}">
                                                            <option>Confirmed and packed</option>
                                                            <option value="0" name="${la.getOrderID()}">Waiting for progressing</option>
                                                            <option value="2" name="${la.getOrderID()}">Being transported</option>
                                                            <option value="3" name="${la.getOrderID()}">Delivered</option>
                                                            <option value="4" name="${la.getOrderID()}">Cancel order</option>
                                                        </c:if>
                                                        <c:if test="${la.getStatus() == 2}">
                                                            <option>Being transported</option>
                                                            <option value="0" name="${la.getOrderID()}">Waiting for progressing</option>
                                                            <option value="1" name="${la.getOrderID()}">Confirmed and packed</option>
                                                            <option value="3" name="${la.getOrderID()}">Delivered</option>
                                                            <option value="4" name="${la.getOrderID()}">Cancel order</option>
                                                        </c:if>
                                                    </select>
                                                </c:if>
                                                <c:if test="${la.getStatus() == 3}">
                                                    <p style="color: green">Delivered</p>
                                                </c:if>
                                                <c:if test="${la.getStatus() == 4}">
                                                    <p>This order has been cancel</p>
                                                </c:if>
                                            </td>
                                            <td><a class="btn btn-sm btn-primary" href="detailOrder?id=${la.getOrderID()}">Detail</a></td>       
                                        </tr>
                                    </c:forEach>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Recent Sales End -->


             
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