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

        <script>
            window.onload = function () {
                var errorMessage = '<c:out value="${error}" />';
                if (errorMessage) {
                    alert(errorMessage);
                }
            }
        </script>
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

                <!-- Blank Start -->
                <div class="container-fluid pt-4 px-4 col-lg-12">
                    <div class="bg-secondary text-center rounded p-4">
                        <div class=" pt-4 insert-div col-lg-12">
                            <div class="bg-secondary text-center rounded p-4">
                                <c:if test="${empty detailaccount.customerID}">
                                    <h2 class="font-weight-bold mb-4">Insert New Account</h2>
                                </c:if>
                                <c:if test="${not empty detailaccount.customerID}">
                                    <h2 class="font-weight-bold mb-4">View Account</h2>
                                </c:if>

                                <form action="insert-account" method="post">
                                    <input type="hidden" value="${detailaccount.customerID}" name="account_id">
                                    <div class="row">
                                        <div class="col-lg-6 col-12 col-md-6 col-sm-12">


                                            <!--<div class="d-flex flex-column align-items-center text-center p-3 py-5 position-relative">-->
                                            <img id="profileImage"  width="50%;" src="${detailaccount.image}">
                                            <!--</div>-->

                                        </div>
                                        <div class="col-lg-6 col-12 col-md-6 col-sm-12">
                                            <div class="row g-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control" id="username" name="username" value="${detailaccount.userName}" placeholder="Username" <c:if test="${not empty detailaccount.userName}">readonly</c:if>>
                                                            <label for="username">Username</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-floating">
                                                            <input type="password" class="form-control" id="password" name="password" value="${detailaccount.password}" placeholder="Password" <c:if test="${not empty detailaccount.password}">readonly</c:if>>
                                                            <label for="password">Password</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-floating">
                                                            <input type="text" class="form-control" id="first_name" name="first_name" value="${detailaccount.firstName}" placeholder="First Name" <c:if test="${not empty detailaccount.firstName}">readonly</c:if>>
                                                            <label for="first_name">First Name</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-floating">
                                                            <input type="text" class="form-control" id="last_name" name="last_name" value="${detailaccount.lastName}" placeholder="Last Name" <c:if test="${not empty detailaccount.lastName}">readonly</c:if>>
                                                            <label for="last_name">Last Name</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-floating">
                                                            <input type="text" class="form-control" id="email" name="email" value="${detailaccount.email}" placeholder="Email" <c:if test="${not empty detailaccount.email}">readonly</c:if>>
                                                            <label for="email">Email</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-floating">
                                                            <input type="text" class="form-control" id="phone_number" name="phone_number" value="${detailaccount.phone}" placeholder="Phone Number" <c:if test="${not empty detailaccount.phone}">readonly</c:if>>
                                                            <label for="phone_number">Phone Number</label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--                                                <div class="col-12">
                                                                                                    <button type="submit" class="btn btn-primary w-100" name="btnInUp">Insert/Update</button>
                                                                                                </div>-->
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Tabbed Section Start -->

                    </div>
                    <div class="row px-xl-5 mt-3">
                        <div class="col">
                            <div class="p-30" style="background-color: white;">
                                <div class="nav nav-tabs mb-4">
                                    <a class="nav-item nav-link text-dark active" data-bs-toggle="tab" href="#tab-pane-1">User's Orders</a>
                                    <a class="nav-item nav-link text-dark" data-bs-toggle="tab" href="#tab-pane-2">Customer Feedback</a>
                                </div>

                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="tab-pane-1">
                                        <h4 class="m-3">User's Orders</h4>
                                        <div class="container-fluid col-12 col-sm-12 col-lg-12 col-md-12">
                                        <c:set var="tt" value="0" />
                                        <c:forEach items="${purchase}" var="p">
                                            <c:set var="tt" value="${tt+1}" />

                                            <hr><!-- comment -->
                                            <div class="border border-grey rounded p-3 mb-3">
                                                <h5 class="mt-2">Order #${tt}</h5>
                                                <table class="table table-light1 table-borderless table-hover text-center mb-0">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Image</th>
                                                            <th>Product Name</th>
                                                            <th>Quantity</th>
                                                            <th>Unit Price</th>
                                                            <!--<th>Total Price</th>-->
                                                        </tr>
                                                    </thead>
                                                    <tbody class="align-middle">
                                                        <c:set var="index" value="0" />
                                                        <c:forEach var="o" items="${orderDetailsMap[p.orderID]}">
                                                            <c:set var="index" value="${index + 1}" />
                                                            <tr>
                                                                <td>${index}</td>
                                                                <td class="align-middle">
                                                                    <img style="width: 80px" class="img-fluid" src="${pDAO.getProductByID(o.getProductID()).getImage()}" alt="Image">
                                                                </td>
                                                                <td class="align-middle">${pDAO.getProductByID(o.getProductID()).getName()}</td>
                                                                <td class="align-middle">${o.getQuantity()}</td>
                                                                <td class="align-middle">${pDAO.getProductByID(o.getProductID()).getFormattedTotalMoney()}₫</td>
                                                                <!-- Add other columns as needed -->
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                                <div class="right-side m-2" style="margin-right: 5.5rem; margin-top: 1rem; text-align: right; margin-bottom: 10px;">
                                                    <span style="font-weight: bold; color: red;">Total: ${p.getFormattedTotalMoney()} VND</span>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <!-- Tab-pane-1 end -->

                                <div class="tab-pane fade" id="tab-pane-2">
                                    <h4 class="m-3">Customer Feedback</h4>

                                    <c:forEach var="feedback" items="${requestScope.productFeedback}">
                                        <div class="card mb-3">
                                            <div class="d-flex align-items-center card-body">
                                                <img class="img-fluid mr-3" src="${feedback.getProductDTO().getImage()}" style="width: 50px; height: 50px; max-width: 70%;" alt="">
                                                <div>
                                                    <p>${feedback.getProductDTO().name}</p>
                                                    <h6>username: ${feedback.getAccountDTO().getFirstName()}</h6>
                                                    <div class="d-flex my-3 align-items-center">
                                                        <p class="mb-0 mr-2">Rating * :</p>
                                                        <div class="text-primary">
                                                            <!-- Assuming you have a rating value -->
                                                            <c:forEach begin="1" end="${feedback.start}">
                                                                <i class="fas fa-star"></i>
                                                            </c:forEach>
                                                            <c:forEach begin="${feedback.start + 1}" end="5">
                                                                <i class="far fa-star"></i>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <h6 class="card-text">Feedback: ${feedback.context}</h6>
                                                    <!--<p class="card-text"><small class="text-muted">$feedback.date}</small></p>-->
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <!-- Tab-pane-2 end -->
                            </div>
                            <!-- Tab-content end -->
                        </div>
                    </div>
                </div>

                <!-- Tabbed Section End -->
                <div class="m-3 mt-3 col-lg-3">
                    <a href="ManageUser" class="btn btn-primary">Back</a>
                </div>
            </div>
            <!-- Blank End -->
            <!-- Content End -->
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
        <script src="admin/js/main.js"></script>
        <script>
            const toggleInsertAnchor = document.getElementById('toggleInsert');
            const insertDiv = document.querySelector('.insert-div');

            toggleInsertAnchor.addEventListener('click', function (event) {
                event.preventDefault();
                if (insertDiv.style.display === 'none') {
                    insertDiv.style.display = 'block';
                } else {
                    insertDiv.style.display = 'none';
                }
            });

            const updateButtons = document.querySelectorAll('.update-button');

            updateButtons.forEach(button => {
                button.addEventListener('click', function () {
                    if (insertDiv.style.display === 'none') {
                        insertDiv.style.display = 'block';
                    }
                });
            });
        </script>
        <style>
            #productTable {
                border-collapse: collapse;
                width: 100%;
                color: #333;
            }

            #productTable td, #productTable th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #productTable tr:nth-child(even) {
                background-color: #f2f2f2;
                color: #000;
            }

            #productTable tr:hover {
                background-color: #ddd;
                color: red;
            }

            #productTable th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #22A699;
                color: white;
            }

            #productTable td {
                color: #111;
            }

            #productTable tr:nth-child(even) td {
                color: #000;
            }

            #productTable tr:hover td {
                color: #000;
            }
        </style>

    </body>

</html>
