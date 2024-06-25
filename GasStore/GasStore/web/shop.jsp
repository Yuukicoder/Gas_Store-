<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>LaptopShop</title>
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

        <form action="filterProduct" method="GET">
            <div class="container-fluid">
                <div class="row px-xl-5">
                    <div class="col-12">
                        <nav class="breadcrumb bg-light mb-30">
                            <a class="breadcrumb-item text-dark" href="home">Home</a>
                            <a class="breadcrumb-item text-dark" href="shop">Shop</a>
                            <span class="breadcrumb-item active">Shop List</span>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="row px-xl-5">
                    <div class="col-lg-3 col-md-4">
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter</span></h5>
                        <div class="bg-light p-4 mb-30">
                            <form>
                                <div class="form-group col">
                                    <select class="form-control" id="supplierSelect" name="supplier">
                                        <option value="">Select Supplier</option>
                                        <c:forEach var="entry" items="${suppliers}">
                                            <option value="${entry.key}"
                                                    <c:if test="${entry.key == param.supplier}">
                                                        selected
                                                    </c:if>
                                                    >${entry.value}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group col">
                                    <select class="form-control" id="priceRangeSelect" name="priceRange">
                                        <option value="">Select Price Range</option>
                                        <option value="200000" <% if("200000".equals(request.getParameter("priceRange"))) out.print("selected"); %>>0 - 200$</option>
                                        <option value="300000" <% if("300000".equals(request.getParameter("priceRange"))) out.print("selected"); %>>200 - 300$</option>
                                        <option value="400000" <% if("400000".equals(request.getParameter("priceRange"))) out.print("selected"); %>>300 - 400$</option>
                                        <option value="500000" <% if("500000".equals(request.getParameter("priceRange"))) out.print("selected"); %>>>500$</option>
                                    </select>
                                </div>

                                <div class="form-group col">
                                    <select class="form-control" id="sortOrderSelect" name="sortOrder">
                                        <option value="">Select Price Sorting</option>
                                        <option value="Descending" <% if("Descending".equals(request.getParameter("sortOrder"))) out.print("selected"); %>>Descending</option>
                                        <option value="Ascending" <% if("Ascending".equals(request.getParameter("sortOrder"))) out.print("selected"); %>>Ascending</option>
                                    </select>
                                </div>

                                <!--  Filter theo ID - Vu anh  -->
                                <input type="hidden" name="cateid" id="cateid" value="${cateid}">
                                
                                <div class="form-group col">
                                    <input type="submit" id="submit-btn" value="Filter" class="btn btn-warning btn-rounded">
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="col-lg-9 col-md-8">
                        <div class="row pb-3">
                            <div class="col-12 pb-1">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <div>
                                        <button class="btn btn-sm btn-light"><i class="fa fa-th-large"></i></button>
                                        <button class="btn btn-sm btn-light ml-2"><i class="fa fa-bars"></i></button>
                                    </div>
                                </div>
                            </div>
                            <section id="list-product">
                                <div class="product">
                                    <c:forEach var="p" items="${requestScope.product}">
                                        <div class="card-product">
                                            <div class="product-img">
                                                <img src="${p.getImage()}" alt="Your Image">
                                                <div class="overlay-product">
                                                    <a href="productDetail?id=${p.getProductID()}"><i class="bx bx-search"></i></a>
                                                </div>
                                            </div>
                                            <div class="product-detail">
                                                <div class="intro">
                                                    <div class="intro-name"><a href="productDetail?id=${p.getProductID()}">${p.getName()}</a></div>
                                                </div>
                                                <div class="component-product">
                                                    <p><i class='bx bxs-hdd'></i> Short Description ${p.getShortDescription()}</p>
                                                    <p><i class='bx bxs-hdd'></i> Supplier ${suppliers[p.getSupplierID()]}</p>
                                                    <p><i class='bx bx-chip'></i> Available ${p.getStockQuantity()}</p>
                                                    <p><i class='bx bx-chip'></i> Sold ${p.getUnitOnOrders()}</p>
                                                </div>
                                                <div class="button-product">
                                                    <div class="price"> $ ${p.getUnitPrice()}</div>
                                                    <a class="cart btnn" href="productDetail?id=${p.getProductID()}">Buy Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </section>
                            <div class="col-12">
                                <nav>
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item <c:if test="${requestScope.currentPage == 1}">disabled</c:if>"><a class="page-link" href="shop?page=${requestScope.currentPage - 1}">Previous</a></li>
                                            <c:forEach var="i" begin="1" end="${requestScope.maxPage}">
                                            <li class="page-item <c:if test="${i == requestScope.currentPage}">active</c:if>"><a class="page-link" href="shop?page=${i}">${i}</a></li>
                                            </c:forEach>
                                        <li class="page-item <c:if test="${requestScope.currentPage == requestScope.maxPage}">disabled</c:if>"><a class="page-link" href="shop?page=${requestScope.currentPage + 1}">Next</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        <%@include file="component/footer.jsp" %>
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="assest/lib/easing/easing.min.js"></script>
        <script src="assest/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="assest/mail/jqBootstrapValidation.min.js"></script>
        <script src="assest/mail/contact.js"></script>
        <script src="assest/js/main.js"></script>
        <script>
            var submitButton = document.getElementById('submit-btn');
            var checkboxes = document.querySelectorAll('.custom-control-input');
            checkboxes.forEach(function (checkbox) {
                checkbox.addEventListener('click', function () {
                    submitButton.click();
                });
            });
        </script>
    </body>

</html>
