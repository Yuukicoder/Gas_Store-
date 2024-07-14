<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="UTF-8" %>

<body>
    <div class="container-fluid position-relative d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>

        <%@include file="SideBarSupplier.jsp" %>


        <div class="content">
            <%@include file="navbarSupplier.jsp" %>


            <!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
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
           
         



            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <%@include file="footer.jsp" %>