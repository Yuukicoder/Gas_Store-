<%-- 
    Document   : ProfileUser
    Created on : Jul 20, 2023, 11:01:38 AM
    Author     : 1234
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="component/topbar.jsp" %>
<%@include file="component/navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>GasStore</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="select.css">
        <link href="css/style.css" rel="stylesheet">
        <link href="img/favicon.ico" rel="icon">

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

        <style>
            .image-overlay {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                display: none;
                justify-content: center;
                align-items: center;
                color: white;
                font-size: 24px;
                cursor: pointer;
            }


            #profileImage:hover + #imageOverlay,
            #imageOverlay:hover {
                display: flex;
                background: rgba(0, 0, 0, 0.5);
                width: 180px;
                height: 180px;
                border-radius: 50%;
            }
            /* CSS để cấu trúc giao diện */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
            }

            .col-md-3, .col-md-4, .col-md-5 {
                flex-basis: 0;
                flex-grow: 1;
                max-width: 100%;
            }

            .border-right {
                border-right: 1px solid #ccc;
            }

            .d-flex {
                display: flex;
            }

            .align-items-center {
                align-items: center;
            }

            .text-center {
                text-align: center;
            }

            .py-5 {
                padding-top: 3rem;
                padding-bottom: 3rem;
            }

            .mt-5 {
                margin-top: 3rem;
            }

            /* CSS để tạo cửa sổ */
            .overlay {
                display: flex;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;

            }
            body.modal-open {
                overflow: hidden;
            }


            /* CSS để tạo màn hình che phủ */



        </style>
    </head>

    <body>
         <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        Change Email
                    </div>
                    <div class="card-body">
                        <%-- Display error message if exists --%>
                        <% String error = (String)request.getAttribute("error"); %>
                        <% if (error != null && !error.isEmpty()) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= error %>
                            </div>
                        <% } %>

                        <form action="Email" method="post">
                            <div class="mb-3">
                                <label for="currentEmail" class="form-label">Current Email</label>
                                <input type="email" class="form-control" id="currentEmail" name="currentEmail" required>
                            </div>
                            <div class="mb-3">
                                <label for="newEmail" class="form-label">New Email</label>
                                <input type="email" class="form-control" id="newEmail" name="newEmail" required>
                            </div>
                            <div class="mb-3">
                                <label for="confirmEmail" class="form-label">Confirm New Email</label>
                                <input type="email" class="form-control" id="confirmEmail" name="confirmEmail" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Update Email</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
         <%@include file="component/footer.jsp" %>
    </body>
</html>
