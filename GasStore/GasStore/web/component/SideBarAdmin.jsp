
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
                <a href="admin" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>ADMIN SITE</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="images/User/${sessionScope.account.getImg()}" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">         
                        <span>${sessionScope.account.getAdminName()}</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="adminHome" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Manager</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="ManageUser" class="dropdown-item">Manage User</a>
                            <a href="ManageStaff" class="dropdown-item">Staff Account</a>
                            <a href="ManageSupplier" class="dropdown-item">Supplier Account</a>
                            <a href="manageCate" class="dropdown-item">Category</a>
                            <a href="productManage" class="dropdown-item">Product</a>
                            <a href="orderTable" class="dropdown-item">Order</a>
                            <a href="discountTable" class="dropdown-item">Discount</a>
                            <a href="tableFeedback" class="dropdown-item">Feedback</a>
                            <a href="postDashboard" class="dropdown-item">Post</a>
                        </div>
                    </div>
<!--                    <a href="widget.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a>
                    <a href="form.html" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a>
                    <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>-->
                    <a href="Chart" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>
<!--                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="signin.html" class="dropdown-item">Sign In</a>
                            <a href="signup.html" class="dropdown-item">Sign Up</a>
                            <a href="404.html" class="dropdown-item">404 Error</a>
                            <a href="blank.html" class="dropdown-item">Blank Page</a>
                        </div>
                    </div>-->
                </div>
            </nav>
        </div>
    </body>
</html>
