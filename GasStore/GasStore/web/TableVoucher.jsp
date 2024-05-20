<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <div class="bg-secondary rounded h-100 p-4">
                                <h6 class="mb-4">Add Voucher</h6>
                                <form action="tableVoucher" method="POST" onsubmit="return validateForm()">
                                    <div class="left-side">
                                        <div class="col-md-6">
                                            <label class="form-label">Voucher Name</label>
                                            <input type="text" class="form-control col-4" name="name">
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label">Start </label>
                                            <input type="date" class="form-control col-3" name="start">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">End </label>
                                            <input type="date" class="form-control col-3" name="end">
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label">Discount</label>
                                            <input type="number" class="form-control col-3" name="discount">
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label">Quantity </label>
                                            <input type="number" class="form-control col-3" name="quantity">
                                        </div>
                                        <div style="margin-top: 15px;color: red" id="error-messages"></div>

                                        <button type="submit" class="btn btn-primary">Add new voucher</button>

                                    </div>
                                    <div class="right-side">
                                        <div class="col-md-6">
                                            <label class="form-label">Voucher Code</label>
                                            <input type="text" class="form-control col-4" id="code-input" name="code">
                                        </div>
                                        <a class="btn btn-primary" onclick="generateCode()">Create Code</a>
                                    </div>

                                </form>
                            </div>
                            <div class="bg-secondary text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">All Product</h6>
                                </div>
                                <div class="table-responsive">
                                    <table id="categoryTable"
                                           class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col">Voucher name</th>
                                                <th scope="col">Voucher Code</th>
                                                <th scope="col">Quantity Available</th>
                                                <th scope="col">Discount</th>
                                                <th scope="col">Start</th>
                                                <th scope="col">End</th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="v" items="${voucher}">
                                                <tr>
                                                    <td class="voucherName">${v.getName()}</td>
                                                    <td>${v.getVoucherCode()}</td>
                                                    <td>${v.getQuantity()}</td>
                                                    <td>${v.getDiscount()}%</td>
                                                    <td>${v.getStart()}</td>
                                                    <td>${v.getEnd()}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="pagination"></div>
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

                            var voucherNames = document.getElementsByClassName('voucherName');
                            Array.from(voucherNames).forEach(function (element) {
                                element.addEventListener('click', function () {
                                    // Lấy giá trị voucher name được click
                                    var voucherName = element.textContent;

                                    // Điều hướng tới trang khác với tham số voucherName
                                    window.location.href = 'voucherdetail?voucherName=' + encodeURIComponent(voucherName);
                                });
                            });

                            function validateForm() {
                                // Lấy giá trị từ các ô input
                                var voucherName = document.getElementsByName("name")[0].value;
                                var startDate = document.getElementsByName("start")[0].value;
                                var endDate = document.getElementsByName("end")[0].value;
                                var discount = document.getElementsByName("discount")[0].value;
                                var quantity = document.getElementsByName("quantity")[0].value;
                                var Code = document.getElementsByName("code")[0].value;

                                // Kiểm tra và hiển thị lỗi (nếu có) dưới từng ô
                                var errorDiv = document.getElementById("error-messages");
                                errorDiv.innerHTML = ""; // Xóa các thông báo lỗi trước đó (nếu có)

                                if (voucherName === "") {
                                    displayError("Voucher Name is required");
                                    return false; // Ngăn chặn gửi form khi có lỗi
                                }

                                if (startDate === "") {
                                    displayError("Start Date is required");
                                    return false; // Ngăn chặn gửi form khi có lỗi
                                } else {
                                    var currentDate = new Date().toISOString().split("T")[0];
                                    if (startDate < currentDate) {
                                        displayError("Start Date must be a future date");
                                        return false; // Ngăn chặn gửi form khi có lỗi
                                    }
                                }

                                if (endDate === "") {
                                    displayError("End Date is required");
                                    return false; // Ngăn chặn gửi form khi có lỗi
                                } else {
                                    if (endDate < startDate) {
                                        displayError("End Date must be after Start Date");
                                        return false; // Ngăn chặn gửi form khi có lỗi
                                    }
                                }

                                if (discount === "") {
                                    displayError("Discount is required");
                                    return false; // Ngăn chặn gửi form khi có lỗi
                                } else if (isNaN(discount) || discount < 0) {
                                    displayError("Discount must be a non-negative number");
                                    return false; // Ngăn chặn gửi form khi có lỗi
                                }

                                if (quantity === "") {
                                    displayError("Quantity is required");
                                    return false; // Ngăn chặn gửi form khi có lỗi
                                } else if (isNaN(quantity) || quantity <= 0) {
                                    displayError("Quantity must be a positive number");
                                    return false; // Ngăn chặn gửi form khi có lỗi
                                }
                                if (Code === "") {
                                    displayError("Code is required");
                                    return false; // Ngăn chặn gửi form khi có lỗi
                                } 

                                // Nếu không có lỗi, có thể tiếp tục xử lý form và gửi yêu cầu POST
                                return true; // Cho phép gửi form đi
                            }

                            function displayError(errorMessage) {
                                var errorDiv = document.getElementById("error-messages");
                                var errorText = document.createElement("p");
                                errorText.innerText = errorMessage;
                                errorDiv.appendChild(errorText);
                            }
        </script>
    </body>

</html>
