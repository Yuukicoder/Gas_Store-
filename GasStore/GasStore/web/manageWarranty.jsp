<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Warranty Table</title>
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
                                        <h5 ><a href="manageWarranty?Service=addWarranty">Add More Warranty</a></h5>
                                    </div>
                                    <form action="manageWarranty" method="GET">
                                        <input name="Service" value="search" hidden /></br>
                                        <input name="serialNumber" value="${serialNumber}" />
                                        <button type="submit">Search</button>
                                    </form>
                                </div>
                                <div class="table-responsive">
                                    <table id="categoryTable"
                                           class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col">WarrantyId</th>
                                                <th scope="col">SerialId</th>
                                                <th scope="col">Create date</th>
                                                <th scope="col">SerialCode</th>
                                                <th scope="col">Reciver date</th>
                                                <th scope="col">Expect date</th>
                                                <th scope="col">Done date</th>
                                                <th scope="col">Process By</th>
                                                <th scope="col">Notes</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                             <c:forEach var="war" items="${list}">
                                                <tr>
                                                    <td>
                                                        ${war.getWarrantyID()}
                                                    </td>
                                                    <td>
                                                        ${war.getSerialID()}
                                                    </td>
                                                    <td>
                                                        ${war.getCreateDate()}
                                                    </td>
                                                    <td>
                                                        ${war.getSerialNumbers()}
                                                    </td>
                                                    <td>
                                                        ${war.getReciverDate()}
                                                    </td>
                                                    <td>
                                                       ${war.getExpectedDate()}
                                                    </td>
                                                    <td>
                                                       ${war.getDoneDate()}
                                                    </td>
                                                    <td>
                                                        ${war.getProcess_By()}
                                                    </td>
                                                    <td>
                                                        ${war.getNotes()}
                                                    </td>
                                                     <td>
                                                        <c:if test="${war.getStatus() == 'accepted'}">
                                                            <a  style="color: green; text-decoration: none" href="manageWarranty?Service=updateStatus&warrantyId=${war.getWarrantyID()}&status=done">Confim Done</a>
                                                        </c:if>
                                                        <c:if test="${war.getStatus() == 'wait' || war.getStatus() == 'Wait' }">

                                                        <select onchange="changeStatus([this, ${war.getWarrantyID()}])">
                                                            <option value="wait" ${war.getStatus() == 'wait' ? 'selected' : ''}>Wait</option>
                                                            <option value="unaccept" ${war.getStatus() == 'unaccept' ? 'selected' : ''}>Unaccept</option>
                                                        </select>

                                                        </c:if>
                                                            <c:if test="${war.getStatus() == 'done'}">
                                                                <span style="color: green;">Done</span>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <c:if test="${war.getStatus() == 'wait' || war.getStatus() == 'Wait' }">
                                                             <a href="manageWarranty?Service=accept&warId=${war.getWarrantyID()}" style="text-decoration: none; color: red;">Tiếp nhận</a>
                                                        </c:if>
                                                        <c:if test="${war.getStatus() == 'done' || war.getStatus() == 'accepted' }">
                                                             <a href="manageWarranty?Service=viewDetail&warId=${war.getWarrantyID()}" style="text-decoration: none; color: red;">Xem chi tiết</a>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <c:if test="${mess != null}">
                                        <p>${mess}</p>
                                    </c:if>
                                    <c:if test="${mess == null}">
                                        <c:if test="${empty list}">
                                         <p>This product has no warranty</p>
                                        </c:if>
                                    </c:if>
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
            const changeStatus = (param) => {
               let url = 'manageWarranty?Service=updateStatus&warrantyId='+param[1]+"&status="+param[0].value
               window.location = url
           }
        </script>
    </body>

</html>
