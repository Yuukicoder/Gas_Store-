<%@page import="DTO.Discount"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta charset="utf-8">
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
        .left-side {
            float: left;
            width: 50%;
        }

        .right-side {
            float: right;
            width: 50%;
        }
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
            background-color: #22A699;
            color: white;
        }
    </style>

    <div class="left-side">
        <!-- Các phần tử trong left-side -->
    </div>

    <div class="right-side">
        <!-- Các phần tử trong right-side -->
    </div>

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
        <%
            // Lấy đối tượng discount từ requestScope
            Discount discount = (Discount) request.getAttribute("discount");
        %>
        <div class="content">
            <%@include file="component/navbarAdmin.jsp" %>
            <!-- Blank Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="">
                            <div class="bg-secondary rounded h-100 p-4">
                                <h1 class="mb-4">Discount Detail</h1>
                                <form action="discountDetail" method="POST" onsubmit="return validateForm();">
                                    <div class="left-side">
                                        <div class="col-md-6">
                                            <label class="form-label">Discount Name</label>
                                            <input type="text" class="form-control col-4" name="name"  value="${requestScope.discount.getName()}" id="name" required>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label">Start Date</label>
                                            <input type="date" class="form-control col-3" name="start"  value="${requestScope.discount.getStartDate()}" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">End Date</label>
                                            <input type="date" class="form-control col-3" name="end"  value="${requestScope.discount.getEndDate()}" required>
                                        </div>
                                        <div class="col-md-6">  
                                            <label class="form-label">Discount Type</label>
                                            <select id="discountType" class="form-control col-3" name="discountType" required onchange="checkDiscountType()">
                                                <option value="PERCENT" <%= (discount != null && discount.getDiscountType().equals("PERCENT")) ? "selected" : "" %>>PERCENT</option>
                                                <option value="FIXED" <%= (discount != null && discount.getDiscountType().equals("FIXED")) ? "selected" : "" %>>FIXED</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">  
                                            <label class="form-label">Discount Amount</label>
                                            <input type="number" class="form-control col-3" name="discountAmount"   value="${requestScope.discount.getDiscountAmount()}" id="discountAmount" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Quantity </label>
                                            <input type="number"  value="${requestScope.discount.getQuantity()}" class="form-control col-3" name="quantity" step="1" min="1" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Discount Code</label>
                                            <c:choose>
                                                <c:when test="${empty requestScope.discount}">
                                                    <!-- Input field is editable when no discount is present -->
                                                    <input type="text" class="form-control col-4" id="code-input" name="code">
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- Input field is readonly when discount is present -->
                                                    <input type="text" value="${requestScope.discount.getDiscountCode()}" class="form-control col-4" id="code-input" name="code" readonly>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${empty requestScope.discount}">
                                                    <a class="btn btn-primary" onclick="generateCode()">Create Code</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- Do nothing or display alternative content -->
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        
                                        <input type="hidden" name="currentName" value="${discount.name}">
                                        <input type="hidden" name="action" value="${empty discount ? 'add' : 'update'}">        
                                        <button type="submit" id="updateBtn" class="btn btn-primary" style="margin-top: 30px">${empty discount ? 'Add Discount' : 'Update Changes'}</button> 
                                    </div>
                                </form>    
                                    <div class="bg-secondary  rounded p-4 right-side">
                                        <div >
                                            <!-- New Form Start -->
                                            <c:if test="${not empty discount}">
                                                <form action="discountCondition" method="POST" id="conditionForm">
                                                    <div class="col-md-6">
                                                        <label class="form-label">Select Condition</label>
                                                        <select id="conditionType" class="form-control col-6" name="conditionType" onchange="showAdditionalInput()">
                                                            <option value="SPENDING" ${conditionType eq 'SPENDING' ? 'selected' : ''}>Chi tiêu trong tháng vừa rồi</option>
                                                            <option value="LOYAL_CUSTOMER" ${conditionType eq 'LOYAL_CUSTOMER' ? 'selected' : ''}>Khách hàng lâu năm</option>
                                                            <option value="NEW_CUSTOMER" ${conditionType eq 'NEW_CUSTOMER' ? 'selected' : ''}>Khách hàng mới</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-6" id="additionalInput">
                                                        <label class="form-label">Minimum Spending</label>
                                                        <input type="number" class="form-control col-3" name="minSpending" id="minSpending" step="0.01" min="0" value="${minSpending}">
                                                    </div>
                                                    <div class="col-md-6" id="numberOfCustomerInput" style="display: none;">
                                                        <label class="form-label">Number of Customer</label>
                                                        <input type="number" class="form-control col-3" name="numberOfCustomer" id="numberOfCustomer" step="1" min="1" value="${numberOfCustomer}">
                                                    </div>
                                                    <input type="hidden" name="discountName" value="${discount.name}">
                                                    <button type="submit" class="btn btn-primary" style="margin-top: 5px">Apply Condition</button>
                                                </form>
                                            </c:if>
                                            <!-- New Form End -->
                                        </div>
                                        <div style="margin-top: 30px">
                                            <c:if test="${not empty eligibleCustomers}">
                                                 <form action="sendDiscountEmail" method="get" id="customerForm">
                                                    <table 
                                                        id="categoryTable"
                                                        class="table text-start align-middle table-bordered table-hover mb-0" 
                                                        style="width: 100%" >
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Username</th>
                                                                <th>Email</th>
                                                                <th>Phone</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="customer" items="${eligibleCustomers}">
                                                                <tr>
                                                                    <td>${customer.customerID}</td>
                                                                    <td>${customer.userName}</td>
                                                                    <td>${customer.email}</td>
                                                                    <td>${customer.phone}</td>
                                                                    <td><input type="checkbox" name="selectedEmails" value="${customer.email}"></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                     <input type="hidden" name="conditionType" value="${conditionType}">
                                                     <input type="hidden" name="discountCode" value="${requestScope.discount.getDiscountCode()}">
                                                     <input type="hidden" name="discountName" value="${discount.name}">
                                                    <button type="submit" class="btn btn-primary" style="margin-top: 5px">Send Email</button>
                                                 </form>    
                                            </c:if>
                                        </div>
                                    </div>
                                    <div style="margin-top: 15px;color: red" id="error-messages">
                                        <c:if test="${not empty errorMessage}">
                                            <p>${errorMessage}</p>
                                        </c:if>
                                    </div>
                                
                            </div> 

                        </div>
                    </div>

                </div>
                <!-- Content End -->


                <!-- Back to Top -->
                <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
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

        <script>
            function generateCode() {
                var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                var codeLength = 10;
                var generatedCode = '';

                for (var i = 0; i < codeLength; i++) {
                    var randomIndex = Math.floor(Math.random() * characters.length);
                    generatedCode += characters.charAt(randomIndex);
                }

                document.getElementById('code-input').value = generatedCode;
            }

            function validateForm() {
                // Lấy giá trị từ các ô input
                var discountName = document.getElementsByName("name")[0].value;
                var startDate = document.getElementsByName("start")[0].value;
                var endDate = document.getElementsByName("end")[0].value;
                var discount = document.getElementsByName("discountAmount")[0].value;
                var quantity = document.getElementsByName("quantity")[0].value;
                var code = document.getElementsByName("code")[0].value;
                var discountType = document.getElementsByName("discountType")[0].value;
                var errorDiv = document.getElementById("error-messages");
                errorDiv.innerHTML = ""; 

                if (discountName === "") {
                    displayError("Discount Name is required");
                    return false; 
                }

                if (startDate === "") {
                    displayError("Start Date is required");
                    return false; 
                } else {
                    var currentDate = new Date().toISOString().split("T")[0];
                    if (startDate < currentDate) {
                        displayError("Start Date must be a future date");
                        return false; 
                    }
                }

                if (endDate === "") {
                    displayError("End Date is required");
                    return false; 
                } else {
                    if (endDate < startDate) {
                        displayError("End Date must be after the Start Date");
                        return false; 
                    }
                }

                if (discount === "") {
                    displayError("Discount Amount is required");
                    return false; 
                } else if (discountType === "PERCENT" && (discount <= 0 || discount > 100)) {
                    displayError("Percentage Discount must be between 1 and 100");
                    return false; 
                } else if (discountType === "FIXED" && discount <= 0) {
                    displayError("Fixed Discount must be a positive number");
                    return false; 
                }

                if (quantity === "") {
                    displayError("Quantity is required");
                    return false; 
                } else if (quantity <= 0) {
                    displayError("Quantity must be a positive number");
                    return false; 
                }

                if (code === "") {
                    displayError("Discount Code is required");
                    return false; 
                }

                return true;
            }

            function displayError(message) {
                var errorDiv = document.getElementById("error-messages");
                errorDiv.innerHTML = message;
            }

            function checkDiscountType() {
                var discountType = document.getElementById("discountType").value;
                var discountAmountInput = document.getElementById("discountAmount");

                if (discountType === "PERCENT") {
                    discountAmountInput.min = 1;
                    discountAmountInput.max = 100;
                } else {
                    discountAmountInput.removeAttribute("max");
                }
            }

            function showAdditionalInput() {
                var conditionType = document.getElementById("conditionType").value;
                var numberOfCustomerInput = document.getElementById("numberOfCustomerInput");
                var additionalInput = document.getElementById("additionalInput");

                if (conditionType === "SPENDING") {
                    additionalInput.style.display = "block";
                    numberOfCustomerInput.style.display = "none"; // Ẩn Number of Customer khi chọn SPENDING
                } else if (conditionType === "LOYAL_CUSTOMER") {
                    additionalInput.style.display = "none";
                    numberOfCustomerInput.style.display = "block"; // Hiển thị Number of Customer khi chọn LOYAL_CUSTOMER
                } else {
                    additionalInput.style.display = "none";
                    numberOfCustomerInput.style.display = "none"; // Ẩn khi chọn lựa chọn khác
                }
            }

            // Hiển thị thẻ input nếu thẻ select đang chọn "Chi tiêu trong tháng vừa rồi"
            window.onload = function() {
                showAdditionalInput();
            };
            
            function showSuccessMessage(message) {
                alert(message);
            }

            <% if (request.getAttribute("msg") != null) { %>
                showSuccessMessage("<%= request.getAttribute("msg") %>");
            <% } %>
        </script>

    </body>
</html>
