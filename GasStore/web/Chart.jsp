<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>ADMIN SITE LAPTOPSHOP</title>
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
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
               
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


            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <a href="admin" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>ADMIN SITE</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">${account.getFullname()}</h6>
                        <span>Admin</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="admin" class="nav-item nav-link "><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Manager</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="tableAccount" class="dropdown-item">Account</a>
                            <a href="tableCategory" class="dropdown-item">Category</a>
                            <a href="ProductDashboard" class="dropdown-item">Product</a>
                            <a href="tableOrder" class="dropdown-item">Order</a>
                            <a href="tableVoucher" class="dropdown-item">Voucher</a>
                            <a href="tableFeedback" class="dropdown-item">Feedback</a>
                            <a href="postDashboard" class="dropdown-item">Post</a>
                        </div>
                    </div>
<!--                    <a href="widget.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a>
                    <a href="form.html" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a>
                    <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>-->
                    <a href="Charts" class="nav-item nav-link active"><i class="fa fa-chart-bar me-2"></i>Charts</a>
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
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file="component/navbarAdmin.jsp" %>
                <!-- Navbar End -->

                 
                <!-- Form Start -->
                <div class="container pt-4 px-4">
                    <!--chart doanh thu-->
                    <div>Revenue</div><br>
                    <div class="row g-4">
                        <div>
                            <form id="rangeOptions" method="GET" action="">
                                <input id="rangeWeek" type="radio" name="range" value="1W" checked onclick="this.form.submit()"/>
                                <label for="rangeWeek">1W</label>
                                
                                <input id="rangeMonth" type="radio" name="range" value="1M" onclick="this.form.submit()"/>
                                <label for="rangeMonth">1M</label>
                                
                                <input id="rangeYear" type="radio" name="range" value="1Y" onclick="this.form.submit()"/>
                                <label for="rangeYear">1Y</label>
                            </form>
                            <canvas id="revenueChart"></canvas>
                        </div>
                    </div>
                    <!--chart top bán ch?y-->
                    <br>
                    <br><!-- <br> -->
                    <br><!-- comment -->
                    <div>Top 10 Best Sale</div>
                    <div class="row g-4">
                        <div>
                            <canvas id="bestSellersChart"></canvas>
                        </div>
                    </div>
                    <br><!-- comment -->
                    <br><!-- comment -->
                    <br><!-- comment -->
                    <div>Top 10 Favorites</div>
                    <!--chart top rating (thang)-->
                    <div class="row g-4">
                        <div>
                            <canvas id="topRatingChart"></canvas>
                        </div>
                    </div>
                </div>
                <!-- Form End -->

               
            </div>
            <!-- Content End -->


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
            
            const rangeOptions = document.getElementById("rangeOptions").getElementsByTagName("input");
            const urlParams = new URLSearchParams(window.location.search);
            let matched = false;

            const selectedRangeValue = urlParams.get('range');
            for (const option of rangeOptions) {
                if (option.value === selectedRangeValue && !matched) {
                    option.checked = true;
                    matched = true;
                    break;
                }
            }

            if (!matched) {
                rangeOptions[0].checked = true;
            }
            
            const revenueChart = document.getElementById('revenueChart');

            new Chart(revenueChart, {
                type: 'line',
                data: {
                    labels: [${revenueDateSet}].reverse(), // period / day / month here
                    datasets: [{
                            label: 'Revenue',
                            data: [${revenueSumSet}].reverse(), // data here
                            borderColor: 'rgb(75, 192, 192)',
                    }]
                }
            });
            
            const bestSellersChart = document.getElementById('bestSellersChart');
            
            new Chart(bestSellersChart, {
                type: 'bar',
                data: {
                    labels: [${bestSellersNameSet}].reverse(), // period / day / month here
                    datasets: [{
                            label: 'Quantity',
                            data: [${bestSellersQuantitySet}].reverse(), // sorted data here
                            backgroundColor: 'rgb(75, 192, 192)',
                        }]
                }
            });
            
            const topRatingChart = document.getElementById('topRatingChart');
            
            new Chart(topRatingChart, {
                type: 'bar',
                data: {
                    labels: [${bestRatingNameSet}].reverse(), // product name here
                    datasets: [{
                            label: 'Average Star Rating',
                            data: [${bestRatingAvgSet}].reverse(), // sorted data here
                            backgroundColor: 'rgb(75, 192, 192)',
                        }]
                }
            });
        </script>
    </body>

</html>