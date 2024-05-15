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
        <!-- Breadcrumb Start -->
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
            <!-- Breadcrumb End -->


            <!-- Shop Start -->
            <div class="container-fluid">
                <div class="row px-xl-5">
                    <!-- Shop Sidebar Start -->
                    <div class="col-lg-3 col-md-4">
                        <!-- Price Start -->
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter Laptop</span></h5>
                        <div class="bg-light p-4 mb-30">
                            <form>

                                <div class="form-group col">
                                    <select class="form-control" id="brandSelect" name="brand">
                                        <option value="">Select Brand</option>

                                        <c:forEach var="c" items="${cate}">
                                            <option value="${c.getName()}"
                                                    <c:if test = "${c.name == param.brand}">
                                                        selected
                                                    </c:if>
                                            >${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group col">
                                <select class="form-control" id="ramSelect" name="ram">
                                    <option value="">Select RAM</option>
                                    <c:forEach var="option" items="${requestScope.options_ram}">
                                        <option value="${option}"
                                            <c:if test="${option == param.ram}">
                                                selected
                                            </c:if>    
                                        >${option}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group col">
                                <select class="form-control" id="cpuSelect" name="cpu">
                                    <option value="">Select CPU</option>
                                    <c:forEach var="option" items="${options_cpu}">
                                        <option value="${option}"
                                            <c:if test="${option == param.cpu}">
                                                selected
                                            </c:if>    
                                        >${option}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group col">
                                <select class="form-control" id="storageSelect" name="storage">
                                    <option value="">Select Storage</option>
                                    <c:forEach var="option" items="${options_disk}">
                                        <option value="${option}"
                                            <c:if test="${option == param.storage}">
                                                selected
                                            </c:if>    
                                        >${option}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group col">
                                <select class="form-control" id="storageSelect" name="vga">
                                    <option value="">Select VGA</option>
                                    <c:forEach var="option" items="${options_vga}">
                                        <option value="${option}"
                                            <c:if test="${option == param.vga}">
                                                selected
                                            </c:if>    
                                        >${option}</option>
                                    </c:forEach>
                                </select>
                            </div>
                                        
                                <div class="form-group col">
                                    <select class="form-control" id="storageSelect" name="priceRange">
                                        <option value="">Select Price Range</option>
                                        <option value="200" <% if("200".equals(request.getParameter("priceRange"))) out.print("selected"); %>>0 - 200$</option>
                                        <option value="300" <% if("300".equals(request.getParameter("priceRange"))) out.print("selected"); %>>200 - 300$</option>
                                        <option value="400" <% if("400".equals(request.getParameter("priceRange"))) out.print("selected"); %>>300 - 400$</option>
                                        <option value="500" <% if("500".equals(request.getParameter("priceRange"))) out.print("selected"); %>>>500$</option>
                                    </select>
                                </div>

                                <div class="form-group col">
                                    <select class="form-control" id="storageSelect" name="sortOrder">
                                        <option value="">Select Price</option>
                                        <option value="Descending" <% if("Descending".equals(request.getParameter("sortOrder"))) out.print("selected"); %>>Descending</option>
                                        <option value="Ascending" <% if("Ascending".equals(request.getParameter("sortOrder"))) out.print("selected"); %>>Ascending</option>


                                    </select>
                                </div>
                                <div class="form-group col">
                                    <input type="submit" id="submit-btn" value="Filter" class="btn btn-warning btn-rounded">
                                </div>
                            </form>
                        </div>
                        <!-- Price End -->
                    </div>
                    <!-- Shop Sidebar End -->


                    <!-- Shop Product Start -->
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
                            <!-- List Product -->


                            <section id="list-product">
                                <div class="product">  
                                    <c:if test="${requestScope.productsWithCategory == null || requestScope.productsWithCategory.size() == 0}">
                                        <div class="alert alert-warning" role="alert">
                                            NOT FOUND!
                                          </div>
                                    </c:if>
                                    <c:if test="${requestScope.productsWithCategory.size() > 0}">
                                        <c:forEach var="p" items="${requestScope.productsWithCategory}">
                                        <div class="card-product">           
                                            <div class="product-img">
                                                <img src="images/Product/${p.getImage()}" alt="Your Image">
                                                <div class="overlay-product">
                                                    <a href="detailProduct?id=${p.getProductID()}"><i class="bx bx-search"></i></a>
                                                </div>
                                            </div>
                                            <div class="product-detail">        
                                                <div class="intro">
                                                    <div class="intro-name"><a href="detailProduct?id=${p.getProductID()}">${p.getName()}</a></div>                    
                                                </div>
                                                <div class="component-product">
                                                    <p><i class='bx bxs-hdd'></i>  SSD ${p.getStorage()} </p>
                                                    <p><i class='bx bxs-microchip'></i>  Ram ${p.getRam()} </p>
                                                    <p><i class='bx bx-chip' ></i>  CPU ${p.getCpu()}</p>
                                                    <p><i class='bx bx-desktop'></i>  VGA ${p.getVga()}</p>
                                                </div>             
                                                <div class="button-product">
                                                    <div class="price"> $ ${p.getPrice()}</div> 
                                                        <a class="cart btnn" href = "detailProduct?id=${p.getProductID()}">Buy Now</a>

                                                </div>
                                            </div>
                                        </div>
                                        </c:forEach>
                                    </c:if>
                                        
                                    
                                </div>
                            </section>



                            <div class="col-12">
        <nav>
            <ul class="pagination justify-content-center">
                <li class="page-item
                    <c:if test="${requestScope.currentPageLS == 1}">disabled</c:if>
                ">
                    <a class="page-link" href="filterProduct?${requestScope.paginationQueryParams}&pageLS=${requestScope.currentPageLS - 1}">Previous</a>
                </li>
                <c:forEach var="i" begin="1" end="${requestScope.maxPageLS}">
                    <li class="page-item 
                        <c:if test="${i == requestScope.currentPageLS}">active</c:if>
                    ">
                        <a class="page-link" href="filterProduct?${requestScope.paginationQueryParams}&pageLS=${i}">
                            ${i}
                        </a>
                    </li>
                </c:forEach>
                <li class="page-item
                    <c:if test="${requestScope.currentPageLS == requestScope.maxPageLS}">disabled</c:if>
                ">
                    <a class="page-link" href="filterProduct?${requestScope.paginationQueryParams}&pageLS=${requestScope.currentPageLS + 1}">Next</a>
                </li>
            </ul>
        </nav>
    </div>
                        </div>
                    </div>
                    <!-- Shop Product End -->
                </div>
            </div>
            <!-- Shop End -->

        </form>
        <%@include file="component/footer.jsp" %>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="assest/lib/easing/easing.min.js"></script>
        <script src="assest/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="assest/mail/jqBootstrapValidation.min.js"></script>
        <script src="assest/mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="assest/js/main.js"></script>

        <script>
                                                        // Get the submit button and checkboxes
                                                        var submitButton = document.getElementById('submit-btn');
                                                        var checkboxes = document.querySelectorAll('.custom-control-input');

                                                        // Add event listener to each checkbox
                                                        checkboxes.forEach(function (checkbox) {
                                                            checkbox.addEventListener('click', function () {
                                                                // Trigger a click event on the submit button
                                                                submitButton.click();
                                                            });
                                                        });
        </script>
    </body>

</html>
