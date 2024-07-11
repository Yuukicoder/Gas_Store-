<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            /* CSS style for center aligning content in table cells */
            .table th,td {
                text-align: center;
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
            <!-- Spinner End -->

            <%@include file="component/SideBarShipper.jsp" %>

            <!-- Content Start -->
            <div class="content">
                <%@include file="component/navbarShipper.jsp" %>
                <!-- Blank Start -->

                <div class="container-fluid pt-4 px-4">
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">
                            <div class="bg-secondary text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">All Order</h6>

                                </div>
                                <!--                                <form action="searchOrder" method="get">
                                                                    <div class="input-group">
                                                                        <input type="text"  placeholder="Search for order" name="search">
                                                                        <div class="input-group-append">
                                                                            <button type="submit" class="btn btn-primary">
                                                                                <i class="fa fa-search"></i>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </form>-->
                                <div class="table-responsive">
                                    <table id="categoryTable" class="table text-start align-middle table-bordered table-hover mb-0" style="text-align: center">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col">No</th>
                                                <th scope="col">Order Date</th>
                                                <th scope="col">Customer</th>
                                                <th scope="col" style="text-align: right">Total Price</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">
                                                    <form method="get" action="ShipperOrderList">
                                                        <select name="numPage" onchange="this.form.submit()">
                                                            <option value="5" ${numPage == '5' ? 'selected' : ''}>5</option>
                                                            <option value="10" ${numPage == '10' ? 'selected' : ''}>10</option>
                                                            <option value="20" ${numPage == '20' ? 'selected' : ''}>20</option>
                                                            <option value="50" ${numPage == '50' ? 'selected' : ''}>50</option>
                                                            <option value="all" ${numPage == 'all' ? 'selected' : ''}>All</option>
                                                        </select>
                                                        <input type="hidden" name="indexPage" value="${tag}" />
                                                        <input type="hidden" name="action" value="${action}" />

                                                    </form>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="index" value="0" />
                                            <c:forEach items="${listOrder}" var="entry">
                                                <tr>
                                                    <td>${index + 1}</td>
                                                    <td>${entry.key.getOrderDate()}</td>                                     
                                                    <td>${entry.value.getFullName()}</td>
                                                    <td style="text-align: right"><fmt:formatNumber value="${entry.key.getTotalMoney()}" pattern="#,##0.#"/>&nbsp;đ</td>
                                                    <td class="col-md-3">
                                                        <c:if test="${entry.key.status != 4 && entry.key.status != 3}">
                                                            <select class="form-select form-select-sm col-md-3" aria-label=".form-select-sm example" onchange="handleOptionChange(this)">
                                                                <c:if test="${entry.key.status == 1}">
                                                                    <option>Confirmed and packed</option>
                                                                    <option value="2" name="${entry.key.orderID}">Being transported</option>
                                                                    <option value="3" name="${entry.key.orderID}">Delivered</option>
                                                                    <option value="4" name="${entry.key.orderID}">Cancel order</option>
                                                                </c:if>
                                                                <c:if test="${entry.key.status == 2}">
                                                                    <option>Being transported</option>
                                                                    <option value="3" name="${entry.key.orderID}">Delivered</option>
                                                                    <option value="4" name="${entry.key.orderID}">Cancel order</option>
                                                                </c:if>
                                                            </select>
                                                        </c:if>
                                                        <c:if test="${entry.key.status == 3}">
                                                            <p style="color: green">Delivered</p>
                                                        </c:if>
                                                        <c:if test="${entry.key.status == 4}">
                                                            <p style="color: red">This order has been cancel</p>
                                                        </c:if>
                                                    </td>
                                                    <td><a class="btn btn-sm btn-primary" href="ShipperOrderDetail?id=${entry.key.orderID}">Detail</a></td>       
                                                </tr>
                                                <c:set var="index" value="${index + 1}" />
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <%--<c:if test="${endPage != 0}">--%>
                                <div id="pagination">
                                    <nav style="float: right;margin-top: 25px; color: black" aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:if test="${tag > 1}">
                                                <li  class="page-item"><a style="color: black"  class="page-link" href="ShipperOrderList?indexPage=${tag-1}&amp;numPage=${numPage != null ? numPage : '5'}"">Previous</a></li>
                                                </c:if>
                                                <c:forEach begin="1" end="${endPage}" var="i">
                                                <li style="color: black"  class="page-item ${tag == i ?"active":"" || page1 == i ?"active":""  } "><a style="color: black"  class="page-link" href="ShipperOrderList?indexPage=${i}&amp;numPage=${numPage != null ? numPage : '5'}">${i}</a></li>
                                                </c:forEach>
                                                <c:if test="${tag<endPage}">
                                                <li class="page-item"><a style="color: black"  class="page-link" href="ShipperOrderList?indexPage=${tag+1}&amp;numPage=${numPage != null ? numPage : '5'}">Next</a></li>
                                                </c:if>
                                        </ul>
                                    </nav> 
                                </div>
                                <%--</c:if>--%>  
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
                                                                function handleOptionChange(selectElement) {
                                                                    var selectedOption = selectElement.value;
                                                                    var name = selectElement.options[selectElement.selectedIndex].getAttribute('name');
                                                                    if (selectedOption === "1") {
                                                                        window.location.href = "ChangeShipperOrderStatus?id=" + name + "&status=1";
                                                                    } else if (selectedOption === "2") {
                                                                        window.location.href = "ChangeShipperOrderStatus?id=" + name + "&status=2";
                                                                    } else if (selectedOption === "3") {
                                                                        window.location.href = "ChangeShipperOrderStatus?id=" + name + "&status=3";
                                                                    } else if (selectedOption === "4") {
                                                                        window.location.href = "ChangeShipperOrderStatus?id=" + name + "&status=4";
                                                                    }
                                                                }
            </script>
    </body>

</html>