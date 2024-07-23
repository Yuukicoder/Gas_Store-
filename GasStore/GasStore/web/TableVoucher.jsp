<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Discount Table</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
              rel="stylesheet">

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
    </head>

    <body>
        <div class="container-fluid position-relative d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner"
                 class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
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
                    <div class="row g-4">
                        <div class="">
                            <div class="bg-secondary text-center rounded p-4">
                                 <h3 style="color: #E57C23">${msg}</h3>
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <div class="bg-secondary rounded h-100 p-4">
                                        <h5 ><a href="discountTable">All Discount</a></h5>
                                    </div>
                                    <form action="discountTable" method="post">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-dark border-0" placeholder="Search Code" name="search">
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
                                    <table id="categoryTable"
                                           class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col" >Discount name</th>
                                                <th scope="col" style="text-align: center">Discount Code</th>
                                                <th scope="col" style="text-align: center">Quantity Available</th>
                                                <th scope="col" style="text-align: center">Discount Type</th>
                                                <th scope="col" style="text-align: center">Discount Amount</th>
                                                <th scope="col" style="text-align: center">Start</th>
                                                <th scope="col" style="text-align: center">End</th>
                                                <th scope="col" style="text-align: center">
                                                    <form method="get" action="discountTable">
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
                                            <c:forEach var="d" items="${discount}">
                                                <tr>
                                                    <td class="discountName" >${d.getName()}</td>
                                                    <td style="text-align: center">${d.getDiscountCode()}</td>
                                                    <td style="text-align: center">${d.getQuantity()}</td>
                                                    <td style="text-align: center">${d.getDiscountType()}</td>
                                                    <c:if test="${d.getDiscountType() == 'PERCENT'}">
                                                        <td style="text-align: center">${d.getDiscountAmount()}</td>
                                                    </c:if>
                                                    <c:if test="${d.getDiscountType() == 'FIXED'}">
                                                        <td style="text-align: center"><fmt:formatNumber value="${d.getDiscountAmount()}" type="currency" currencySymbol="" maxFractionDigits="0"/> VND</td>  
                                                    </c:if>
                                                    <td style="text-align: center">${d.getStartDate()}</td>
                                                    <td style="text-align: center">${d.getEndDate()}</td>
                                                    <td style="text-align: center">
                                                        <a href="#" class="btn btn-danger btn-sm"
                                                            onclick="confirmDelete('${d.getDiscountID()}')"
                                                        >
                                                            Delete
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="pagination">
                                    <nav style="float: right;margin-top: 25px; color: black" aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:if test="${tag > 1}">
                                                <li  class="page-item"><a style="color: black"  class="page-link" href="discountTable?indexPage=${tag-1}&amp;numPage=${numPage != null ? numPage : '5'}"">Previous</a></li>
                                            </c:if>
                                            <c:forEach begin="1" end="${endPage}" var="i">
                                                <li style="color: black"  class="page-item ${tag == i ?"active":"" || page1 == i ?"active":""  } "><a style="color: black"  class="page-link" href="discountTable?indexPage=${i}&amp;numPage=${numPage != null ? numPage : '5'}">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${tag<endPage}">
                                                <li class="page-item"><a style="color: black"  class="page-link" href="discountTable?indexPage=${tag+1}&amp;numPage=${numPage != null ? numPage : '5'}">Next</a></li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>
                                <div class="text-center mt-4">
                                    <a href="VoucherDetail.jsp" class="btn btn-primary">Add Discount</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- Content End -->


                <!-- Back to Top -->
                <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
                        class="bi bi-arrow-up"></i></a>
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

        var discountNames = document.getElementsByClassName('discountName');
        Array.from(discountNames).forEach(function (element) {
            element.addEventListener('click', function () {
                var discountName = element.textContent;
                window.location.href = 'discountDetail?discountName=' + encodeURIComponent(discountName);
            });
        });

        function validateForm() {
            // Lấy giá trị từ các ô input
            var voucherName = document.getElementsByName("name")[0].value;
            var startDate = document.getElementsByName("start")[0].value;
            var endDate = document.getElementsByName("end")[0].value;
            var discount = document.getElementsByName("discountAmount")[0].value;
            var quantity = document.getElementsByName("quantity")[0].value;
            var Code = document.getElementsByName("code")[0].value;
            var discountType = document.getElementsByName("discountType")[0].value;
            var errorDiv = document.getElementById("error-messages");
            errorDiv.innerHTML = ""; 

            if (voucherName === "") {
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
                    displayError("End Date must be after Start Date");
                    return false; 
                }
            }

            if (discount === "") {
                displayError("Discount is required");
                return false; 
            } else if (isNaN(discount) || discount < 0) {
                displayError("Discount must be a non-negative number");
                return false;
            }
            if (discountType === "PERCENT") {
                if (discount === "" || isNaN(discount) || discount < 0 || discount > 100) {
                    displayError("Discount Amount must be between 0 and 100 for PERCENT type");
                    return false;
                }
            } else if (discountType === "FIXED") {
                if (discount === "" || isNaN(discount) || discount <= 0) {
                    displayError("Discount Amount must be greater than 0 for FIXED type");
                    return false;
                }
            } else {
                displayError("Please select Discount Type");
                return false;
            }
         
            if (quantity === "") {
                displayError("Quantity is required");
                return false; 
            } else if (isNaN(quantity) || quantity <= 0) {
                displayError("Quantity must be a positive number");
                return false; 
            }
            if (Code === "") {
                displayError("Code is required");
                return false;
            return true; 
        }
    }

        function displayError(errorMessage) {
            var errorDiv = document.getElementById("error-messages");
            var errorText = document.createElement("p");
            errorText.innerText = errorMessage;
            errorDiv.appendChild(errorText);
        }
        
        function checkDiscountType() {
            var discountType = document.getElementById("discountType").value;
            var discountAmountInput = document.getElementById("discountAmount");

            if (discountType === "") {
                discountAmountInput.value = "";
                discountAmountInput.disabled = true;
                alert("Please select Discount Type first.");
            } else {
                discountAmountInput.disabled = false;
            }
            
            if (discountType === "PERCENT") {
                discountAmountInput.placeholder = "Enter %";
            } else if (discountType === "FIXED") {
                discountAmountInput.placeholder = "Enter VNĐ";
            }
        }
        
        function confirmDelete(discountID) {
            if (confirm('Are you sure you want to delete this discount?')) {
                window.location.href = 'deleteDiscount?discountID=' + discountID;
            }
        }
        
        </script>
    </body>

</html>
