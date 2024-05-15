<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@page import="DAO.*" %>
<%@page import="DTO.*" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">

        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

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

        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">

                            <div class="bg-secondary text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">FeedBack Reply</h6>
                                    <select id="filterStatus" onchange="handleOptionChange(this);">
                                        <option value="0" name = "0">All</option>
                                        <option value="1" name="1">Confirmed</option>
                                        <option value="2" name="2">Unconfirmed</option>
                                    </select>
                                </div>



                                <div class="table-responsive">
                                    <table id="categoryTable" class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">
                                                <th>ID</th>
                                                <th scope="col">Gmail</th>
                                                <th scope="col">Product Name</th>
                                                <th scope="col">Text</th>
                                                <th scope="col">Date</th>
                                                <th scope="col">Reply</th>
                                                <th>Check</th>
                                                <th>Detail</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="c" items="${requestScope.feedback}">
                                                <c:set var="productid" value="${c.productID}"/>
                                                <tr>
                                                    <td>${c.feedBackID}</td>
                                                    <td>${c.accountDTO.email}</td>
                                                    <td>${c.productDTO.name}</td>
                                                    <td style="max-width: 30ch; overflow-wrap: break-word;">${c.context}</td>
                                                    <td>${c.date}</td>
                                                    <td>
                                                        <button class="btn btn-link btn-detail" onclick="showFeedbackForm(this)" data-feedback-id="${c.feedBackID}">
                                                            <i class="fas fa-reply"></i>
                                                        </button>
                                                    </td>
                                                    <c:if test="${c.status == true}">
                                                        <td><i style="font-size: 35px;" class='bx bx-checkbox-checked'></i></td>
                                                        </c:if>
                                                        <c:if test="${c.status == false}">
                                                        <td><i style="font-size: 35px;" class='bx bx-checkbox'></i></td>
                                                        </c:if>
                                                    <!-- ... -->
                                                    <td>
                                                        <a href="http://localhost:9999/swp391-laptopshop/detailProduct?id=${productid}" target="_blank">
                                                            <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                                        </a>
                                                    </td>
                                                    <!-- ... -->

                                                </tr>
                                            </c:forEach>



                                        </tbody>
                                    </table>

                                    <div class="feedback-overlay" id="feedbackOverlay"></div>
                                    <c:set var="feedbackID" scope="request" />

                                    <!--// lay gia tri trang mac dinh -->
                                    <c:set value="${tag}" var="page"/>
                                    <form method="post" action="tableFeedback"  onsubmit="return validateFeedbackInput();">
                                        <div class="feedback-form" id="feedbackForm">
                                            <div class="feedback-content">

                                                <input hidden id="page" name="page" value="${page}" />

                                                <input hidden id="feedbackIDSet" name="feedbackID" value="${feedbackID}" />
                                                <input hidden id="feedbackIDSet" name="acountID" value="${account.getAccountID()}" />
                                                <input hidden name="date" value="<%
                                                 Date dNow = new Date();
                                                 SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
                                                 String formattedDate = ft.format(dNow);
                                                 out.println(formattedDate);
                                                       %>"/>
                                                <h1 style="color: black" ></h1>
                                                <textarea id="feedbackInput" name="text" placeholder="Enter reply feedback"></textarea>
                                                <p id="characterMessage" style="color: red; width: 360px"></p>
                                                <button type="submit">Send</button>
                                                <button type="button" onclick="closeFeedbackForm()">Close</button>
                                            </div>
                                        </div>
                                    </form>


                                </div>

                                <div id="pagination"></div>

                                <nav style="float: right;margin-top: 25px; color: black" aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <c:if test="${tag > 1}">
                                            <li  class="page-item"><a style="color: black"  class="page-link" href="tableFeedback?index=${tag-1}&statusFilter12=${statusFilter12}">Previous</a></li>

                                        </c:if>

                                        <c:forEach begin="1" end="${endP}" var="i">


                                            <li style="color: black"  class="page-item ${tag == i ?"active":"" || page1 == i ?"active":""  } "><a style="color: black"  class="page-link" href="tableFeedback?index=${i}&statusFilter12=${statusFilter12}">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${tag<endP}">
                                            <li class="page-item"><a style="color: black"  class="page-link" href="tableFeedback?index=${tag+1}&statusFilter12=${statusFilter12}">Next</a></li>

                                        </c:if>
                                    </ul>
                                </nav>
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
                                    &copy; <a href="#">LAPTOP SHOP</a>, All Right Reserved. 
                                </div>
                                <div class="col-12 col-sm-6 text-center text-sm-end">
                                    <!--/*** This template is free as long as you keep the footer author?s credit link/attribution link/backlink. If you'd like to use the template without the footer author?s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                                    Designed By <a href="https://gitlab.com/asusrogg14/swp391-laptopshop">SWP391 - GROUP 4</a>
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
            <style>
                .d-flex {
                    display: flex;
                }

                .align-items-center {
                    align-items: center;
                }

                .justify-content-end {
                    justify-content: flex-end;
                }

                .mb-4 {
                    margin-bottom: 1rem;
                }

                .col-md-3 {
                    width: auto;
                    margin-left: 1rem;


                }
            </style>
            <style>

                #filterStatus {
                    width: 200px;
                    padding: 8px;
                    border: 1px solid #ccc;
                    border-radius: 5px;
                    font-size: 16px;
                    appearance: none;
                    -webkit-appearance: none;
                    -moz-appearance: none;
                    background: url("dropdown_arrow.png") no-repeat right center;
                }


                #filterStatus option[value="0"] {
                    font-style: italic;
                    color: #888;
                }


                #filterStatus option:not([value="0"]) {
                    color: #333;
                    background-color: #f0f0f0;
                }


                #filterStatus option:hover:not([value="0"]) {
                    background-color: #ccc;
                }

            </style>
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
                                                    function showFeedbackForm(button) {
                                                        var feedbackOverlay = document.getElementById("feedbackOverlay");
                                                        var feedbackForm = document.getElementById("feedbackForm");
                                                        var feedbackID = button.getAttribute("data-feedback-id"); // L?y giá tr? c?a data-feedback-id t? button
                                                        // ??t giá tr? feedbackID vào set
                                                        var setElement = document.getElementById("feedbackIDSet");
                                                        setElement.setAttribute("value", feedbackID);

                                                        feedbackOverlay.style.display = "block";
                                                        feedbackForm.style.display = "block";
                                                    }

                                                    function closeFeedbackForm() {
                                                        var feedbackOverlay = document.getElementById("feedbackOverlay");
                                                        var feedbackForm = document.getElementById("feedbackForm");
                                                        feedbackOverlay.style.display = "none";
                                                        feedbackForm.style.display = "none";


                                                    }

                                                    function handleOptionChange(selectElement) {
                                                        var selectedOption = selectElement.value;
                                                        var name = selectElement.options[selectElement.selectedIndex].getAttribute('name');
                                                        if (selectedOption == 0) {
                                                            // Ch? chuy?n h??ng n?u ?ã ch?n m?t tùy ch?n khác tùy ch?n "All"
                                                            window.location.href = "tableFeedback?statusFilter12=" + name;
                                                        } else if (selectedOption == 1) {
                                                            // Ch? chuy?n h??ng n?u ?ã ch?n m?t tùy ch?n khác tùy ch?n "All"
                                                            window.location.href = "tableFeedback?statusFilter12=" + name;
                                                        }
                                                        if (selectedOption == 2) {
                                                            // Ch? chuy?n h??ng n?u ?ã ch?n m?t tùy ch?n khác tùy ch?n "All"
                                                            window.location.href = "tableFeedback?statusFilter12=" + name;
                                                        }

                                                    }

                                                    document.getElementById("filterStatus").addEventListener("change", function () {
                                                        handleOptionChange(this);
                                                    });

                                                    document.addEventListener("DOMContentLoaded", function () {
                                                        var statusFilter12Value = "${statusFilter12}"; // Giá tr? statusFilter12 t? bi?u? th?c hi?n GET
                                                        var filterStatus = document.getElementById("filterStatus");

                                                        // Thi?t l?p tùy ch?n ???c ch?n d?a trên giá tr? statusFilter12
                                                        if (statusFilter12Value === "0") {
                                                            filterStatus.value = "0";
                                                        } else if (statusFilter12Value === "1") {
                                                            filterStatus.value = "1";
                                                        } else {
                                                            filterStatus.value = "2"; // N?u không có giá tr? ho?c giá tr? không h?p l?
                                                        }
                                                    });
            </script>

            <script>
                function validateFeedbackInput() {
                    var feedbackInput = document.getElementById("feedbackInput").value;

                    // Ki?m tra xem textarea có b? r?ng không
                    if (feedbackInput.trim() === "") {
                        document.getElementById("characterMessage").textContent = "Please enter review text!";
                        return false;
                    }

                    // N?u tr??ng textarea không r?ng, cho phép submit form
                    return true;
                }
            </script>




            <style>
                .feedback-overlay {
                    display: none;
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: rgba(0, 0, 0, 0.6);
                    z-index: 9999;
                }

                .feedback-form {
                    display: none;
                    position: fixed;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    background: #fff;
                    padding: 20px;
                    z-index: 10000;
                    max-width: 400px;
                    border-radius: 8px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                }

                .feedback-content {
                    text-align: center;
                }

                .feedback-content h1 {
                    margin-bottom: 20px;
                    font-size: 24px;
                    color: #333;
                }

                .feedback-content textarea {
                    width: 100%;
                    height: 150px;
                    margin-bottom: 20px;
                    padding: 10px;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    resize: vertical;
                    word-break: break-all;
                }

                .feedback-content button {
                    display: inline-block;
                    padding: 8px 16px;
                    margin-right: 10px;
                    background-color: #007bff;
                    color: #fff;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                    transition: background-color 0.3s ease;
                }

                .feedback-content button:hover {
                    background-color: #0056b3;
                }

                .btn-link {
                    color: blue;
                    cursor: pointer;
                }

                .btn-link:hover {
                    text-decoration: underline;
                }
            </style>



    </body>

</html>