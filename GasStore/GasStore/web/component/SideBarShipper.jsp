
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <a href="ShipperOrderList" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>Shipper SITE</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="images/User/${sessionScope.account.getImage()}" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">               
                        <span>${sessionScope.account.getFullname()}</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="ShipperOrderList" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Home</a>
                </div>
            </nav>
        </div>
    </body>
</html>
