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

            <%@include file="component/SideBarAdmin.jsp" %>

            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file="component/navbarAdmin.jsp" %>
                <!-- Navbar End -->


                <!-- Form Start -->
                <div class="container pt-4 px-4">
                    <div>Revenue</div>
                    <br>
                    <div class="row g-4">
                        <div>
                            <form id="rangeOptions" method="GET" action="Chart">
                                <input id="rangeWeek" type="radio" name="range" value="1W" checked onclick="this.form.submit()"/>
                                <label for="rangeWeek">This Week</label>

                                <input id="rangeMonth" type="radio" name="range" value="1M" onclick="this.form.submit()"/>
                                <label for="rangeMonth">This Month</label>

                                <input id="rangeYear" type="radio" name="range" value="1Y" onclick="this.form.submit()"/>
                                <label for="rangeYear">This Year</label>
                            </form>
                            <br>
                            <canvas id="revenueChart"></canvas>
                            <br>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                        <h6>Total Revenue: ${TotalRevenue}</h3>
                    </div>    

                    <br>
                    <br>
                    <br>     

                    <div>Top 10 Best Sale</div>
                    <br>
                    <div class="row g-4">
                        <div>
                            <canvas id="bestSellersChart"></canvas>
                        </div>
                    </div>
                    <br>
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
        <!--        <script src="admin/lib/chart/chart.min.js"></script>-->
        <script src="path/to/chartjs/dist/chart.umd.js"></script>
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
                                        //chart type
                                        type: 'line',
                                        data: {
                                            labels: [${revenueDateSet}], // date
                                            datasets: [{
                                                    label: 'Revenue(VND)',
                                                    data: [${revenueSumSet}], // revenue
                                                    borderColor: 'rgb(75, 192, 192)',
                                                }]
                                        },
                                        options: {
                                            plugins: {
                                                legend: {
                                                    display: false // This will hide the legend
                                                }
                                            }
                                        }
                                    });

                                    const bestSellersChart = document.getElementById('bestSellersChart');
                                    new Chart(bestSellersChart, {
                                        type: 'bar',
                                        data: {
                                            labels: [${bestSellersNameSet}], // period / day / month here
                                            datasets: [{
                                                    label: 'Quantity',
                                                    data: [${bestSellersQuantitySet}], // sorted data here
                                                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                                    borderColor: 'rgb(54, 162, 235)',
                                                    borderWidth: 2,
                                                    maxBarThickness: 80
                                                }]
                                        },
                                        options: {
                                            plugins: {
                                                legend: {
                                                    display: false // This will hide the legend
                                                }
                                            }
                                        }
                                    });
        </script>
    </body>

</html>