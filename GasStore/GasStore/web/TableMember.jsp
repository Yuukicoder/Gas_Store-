<%-- 
    Document   : TableMember
    Created on : 23 Jul 2024, 22:39:49
    Author     : Vu Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

            <%@include file="component/SideBarAdmin.jsp" %>

            <!-- Content Start -->
            <div class="content">
                <%@include file="component/navbarAdmin.jsp" %>
                <!-- Blank Start -->

                <div class="container-fluid pt-4 px-4">
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">
                            <div class="bg-secondary text-center rounded p-4">
                                <h3 style="color: #E57C23">${msg}</h3>

                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <form action="ManageProgramMember" method="post">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-dark border-0" placeholder="Search member" name="search" value="${search}">
                                            <input type="hidden" value="${tag}" name="pageIndex" id="pageIndex">
                                            <input type="hidden" value="${currentPageSize}" name="pageSize" id="pageSize">
                                            <div class="input-group-append">
                                                <span class="input-group-text bg-transparent text-primary" style="    border: none;
                                                      margin-top: 4px;">
                                                    <button type="submit" class="fa fa-search" style="text-decoration: none; border: none;background: white;"></button>
                                                </span>
                                            </div>
                                        </div>
                                    </form>
                                    <!---->
                                    <form action="ChangePointGainRate" method="get">       
                                        <button type="submit" class="btn btn-primary">Add Benefit</button>
                                    </form>
                                    <!---->
                                    <form action="ManageProgramMember" id="pageSizeSelector" method="POST">
                                        <select class="form-control" name="pageSize" id="pageSize" onchange="document.getElementById('pageSizeSelector').submit();">
                                            <option value="5" <%= "5".equals(request.getAttribute("currentPageSize")) ? "selected" : "" %>>5</option>
                                            <option value="10" <%= "10".equals(request.getAttribute("currentPageSize")) ? "selected" : "" %>>10</option>
                                            <option value="15" <%= "15".equals(request.getAttribute("currentPageSize")) ? "selected" : "" %>>15</option>
                                            <option value="20" <%= "20".equals(request.getAttribute("currentPageSize")) ? "selected" : "" %>>20</option>
                                            <option value="0" <%= "0".equals(request.getAttribute("currentPageSize")) ? "selected" : "" %>>All</option>
                                        </select>
                                        <input type="hidden" name="search" value="${search}">
                                    </form>
                                </div>
                                <div class="table-responsive">
                                    <table id="categoryTable" class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col">Username</th>
                                                <th scope="col">Fullname</th>
                                                <th scope="col">Phone</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Tier</th>
                                                <th scope="col">Total point</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="lc" items="${listMember}">
                                                <tr>
                                                    <td>${lc.getUserName()}</td>
                                                    <td>${lc.getFullName()}</td>
                                                    <td>${lc.getPhone()}</td>
                                                    <td>${lc.getEmail()}</td>
                                                    <td>${memberShipDAO.getMembershipTierByID(lc.getMemberShipTier()).getTierName()}</td>
                                                    <td style=" padding: 0.5rem 0.5rem;
                                                        text-align: center;
                                                        font-size: larger;
                                                        transition: 0.5s;
                                                        color: var(--color-dark);">
                                                        ${lc.getTotalPoint()}
                                                        <a class="bx bxs-pencil" href="javascript:void(0)" onclick="openEditPointsModal(${lc.getTotalPoint()}, ${lc.getCustomerID()})" style="  padding: 1rem 1rem; color:#176B87"></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>



                                    <nav style="float: right;margin-top: 25px; color: black" aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:if test="${tag > 1}">
                                                <li  class="page-item"><a style="color: black"  class="page-link" href="manageCate?indexPage=${tag-1}&search=${search}&pageSize=${currentPageSize}">Previous</a></li>
                                                </c:if>
                                                <c:forEach begin="1" end="${endPage}" var="i">
                                                <li style="color: black"  class="page-item ${tag == i ?"active":"" || page1 == i ?"active":""  } "><a style="color: black"  class="page-link" href="manageCate?indexPage=${i}&search=${search}&pageSize=${currentPageSize}">${i}</a></li>
                                                </c:forEach>
                                                <c:if test="${tag<endPage}">
                                                <li class="page-item"><a style="color: black"  class="page-link" href="manageCate?indexPage=${tag+1}&search=${search}&pageSize=${currentPageSize}">Next</a></li>
                                                </c:if>
                                        </ul>
                                    </nav>
                                </div>

                                <div id="pagination"></div>
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

                <!-- Modal -->
                <div class="modal fade" id="editPointsModal" tabindex="-1" aria-labelledby="editPointsModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content bg-secondary">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editPointsModalLabel">Edit Total Points</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="editPointsForm" action="UpdateMemberPoints" method="post">
                                    <div class="mb-3">
                                        <label for="memberPoints" class="form-label">Total Points</label>
                                        <input type="number" class="form-control" id="totalPoints" name="totalPoints" required>
                                    </div>
                                    <input type="hidden" id="memberId" name="memberId">
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" form="editPointsForm">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal -->
                <div class="modal fade" id="editPointGainRateModal" tabindex="-1" aria-labelledby="editPointGainRateModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content bg-secondary">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editPointGainRateModalLabel">Edit Total Points</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="editPointsForm" action="UpdateMemberPoints" method="post">
                                    <div class="mb-3">
                                        <label for="memberPoints" class="form-label">Money-to-point Rate</label>
                                        <input type="number" class="form-control" id="totalPoints" name="totalPoints" required>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" form="editPointsForm">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>


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
                                                            function showMess(id) {
                                                                var option = confirm('Are you sure to delete?');
                                                                if (option === true) {
                                                                    window.location.href = 'deleteCate?id=' + id;
                                                                    ;
                                                                } else {
                                                                    event.preventDefault();
                                                                }
                                                            }
            </script>
            <script>
                function openEditPointsModal(totalPoints, memberId) {
                    document.getElementById('totalPoints').value = totalPoints;
                    document.getElementById('memberId').value = memberId;
                    var editPointsModal = new bootstrap.Modal(document.getElementById('editPointsModal'));
                    editPointsModal.show();
                }
            </script>

            <style>
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
                    background-color: var(--light);
                    color: white;
                }
            </style>
    </body>

</html>
