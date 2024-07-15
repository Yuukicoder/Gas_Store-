<%@page import="DTO.OrderDetail"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Admin</title>
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
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ccc;
            padding-bottom: 20px;
        }
        .header-left h2 {
            margin: 0;
        }
        .header-right {
            text-align: left;
            margin-right: 79px;
        }
        .header-right p {
            margin: 0;
        }
        .order-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
        }
        .order-info h3 {
            margin-left: 500px;
            text-align: left; 
        }
        .order-actions {
            display: flex;
            align-items: center;
        }
        .order-actions span {
            margin-right: 10px;
        }
        .order-actions a {
            margin-left: 10px;
            text-decoration: none;
        }
        .table th{
           
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

        <%@include file="component/SideBarAdmin.jsp" %>

        <!-- Content Start -->
        <div class="content">
            <%@include file="component/navbarAdmin.jsp" %>
            <!-- Blank Start -->

            <div class="container-fluid pt-4 px-4">
                <header class="header">
                    <div class="header-left">
                        <h2 style="color: #402E7A">GAS STORE COMPANY</h2>
                    </div>
                    <div class="header-right">
                        <p>Address: FPT University, Ha Noi</p>
                        <p>Phone: 012 345 67890</p>
                        <p>Email: info@gasstore.com</p>
                    </div>
                </header>

                <!-- Body Content -->
                <div class="body-content">
                    <!-- Order Information -->
                        <div class="order-container">
                            <div class="order-info">
                                <h3 style="color: #402E7A">ORDER: #${order.orderID}</h3>
                            </div>
                            <div class="order-actions">
                                <span>Date: ${formattedDate}</span> |
                                <a href="#" onclick="document.getElementById('emailForm').submit(); return false;"> Email</a>
                            </div>
                        </div>

                    <!-- Customer Information -->
                    <div class="customer-info" style="margin-bottom: 30px">
                        <h4>CUSTOMER INFORMATION</h4>
                        <p><strong>Customer Name:</strong> ${customer.firstName} ${customer.lastName}</p>
                        <p><strong>Phone:</strong> ${customer.phone}</p>
                        <p><strong>Email:</strong> ${customer.email}</p>
                        <p><strong>Address:</strong> ${customer.address}</p>
                    </div>

                    <!-- Order Details Table -->
                    <div class="order-table">
                        <h4>ORDER DETAILS</h4>
                        <p style="text-align: right"><strong>Price Unit:</strong> VND</p>
                        <table class="table table-bordered" style="border-bottom: 1px solid #ddd">
                            <thead>
                                <tr>
                                    <th scope="col" style="text-align: center; border-bottom:1px solid #ddd; border-top:1px solid #ddd;">No.</th>
                                    <th scope="col" style="border-bottom: 1px solid #ddd; border-top:1px solid #ddd;"">Product Name</th>
                                    <th scope="col" style="text-align: right;  border-bottom: 1px solid #ddd; border-top:1px solid #ddd;"">Unit Price</th>
                                    <th scope="col" style="text-align: right;  border-bottom: 1px solid #ddd; border-top:1px solid #ddd;"">Quantity</th>
                                    <th scope="col" style="text-align: right;  border-bottom: 1px solid #ddd; border-top:1px solid #ddd;"">Total Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${orderDetails}" varStatus="loop">
                                    <tr>
                                        <td style="text-align: center">${loop.index + 1}</td>
                                        <td>${pDAO.getProductByID(item.getProductID()).getName()}</td>
                                        <td style="text-align: right"><fmt:formatNumber value="${item.unitPrice}" pattern="#,##0.#" /></td>
                                        <td style="text-align: right">${item.quantity}</td>
                                        <td style="text-align: right"><fmt:formatNumber value="${item.getTotalPrice()}" pattern="#,##0.#" /></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Total Amount -->
                    <div class="total-amount">
                        <p style="text-align: right; color: #FC4100"><strong>Total Amount:</strong> <fmt:formatNumber value="${order.totalMoney}" pattern="#,##0.#"/> VND</p>
                    </div>
                </div>
                <form id="emailForm" style="display:none" action="sendOrderEmail" method="post">
                    <input type="hidden" name="orderDate" value="${formattedDate}">
                    <input type="hidden" name="orderID" value="${order.orderID}">
                    <input type="hidden" name="totalMoney" value="${order.totalMoney}">
                    <input type="hidden" name="customerFirstName" value="${customer.firstName}">
                    <input type="hidden" name="customerLastName" value="${customer.lastName}">
                    <input type="hidden" name="customerPhone" value="${customer.phone}">
                    <input type="hidden" name="customerAddress" value="${customer.address}">
                    <input type="hidden" name="customerEmail" value="${customer.email}">
                    <% 
                        List<OrderDetail> orderDetails = (List<OrderDetail>)request.getAttribute("orderDetails"); 
                        session.setAttribute("orderDetails", orderDetails);
                    %>
                </form>
            </div>
            
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
         <!-- Custom JavaScript -->
         
             <script>
                // Function to show the success message in an alert
                function showSuccessMessage(message) {
                    alert(message);
                }

                <% if (request.getAttribute("msg") != null) { %>
                    showSuccessMessage("<%= request.getAttribute("msg") %>");
                <% } %>
            </script>

    </div>

</body>

</html>
