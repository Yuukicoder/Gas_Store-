<%-- 
    Document   : NotificationListCustomer
    Created on : 16 thg 7, 2024, 23:58:34
    Author     : dell456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Notification</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="assest/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/productCard.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <%@include file="component/topbar.jsp" %>
        <%@include file="component/navbar.jsp" %>
        <div class="container-fluid pt-4 px-4">
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="bg-secondary text-center rounded p-4">
                        <div class="table-responsive">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <a href="customerAllNoti">Notification List</a>                             
                            </div>
                            <div style="text-align: left; color: black">
                                ${noti.getContent()}                                  
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>
        <%@include file="component/footer.jsp" %>
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="assest/lib/easing/easing.min.js"></script>
        <script src="assest/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="assest/mail/jqBootstrapValidation.min.js"></script>
        <script src="assest/mail/contact.js"></script>
        <script src="assest/js/main.js"></script>

        <!-- Template Javascript -->



    </body>
</html>
