<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <!-- Libraries Stylesheet -->
        <link href="admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="admin/css/style.css" rel="stylesheet">
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
            <%@ page pageEncoding="UTF-8" %>

            <%@include file="component/SideBarAdmin.jsp" %>

            <!-- Content Start -->
            <div class="content">
                <%@include file="component/navbarAdmin.jsp" %>
                <!-- Blank Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">
                            <div class="col-sm-12 col-xl-6 ">


                            </div> 
                            <div class="bg-secondary text-center rounded p-4">
                                <h3 style="color: #E57C23">${msg}</h3>

                                <div class="d-flex align-items-center justify-content-between mb-4">

                                    <div class="bg-secondary rounded h-100 p-4">

                                        <h5 ><a href="productManage?action=${action}">All Product </a></h5>

                                    </div>
                                    <form action="productManage?action=show" method="post">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-dark border-0" placeholder="Search name product" name="search">
                                            <div class="input-group-append">
                                                <span class="input-group-text bg-transparent text-primary" style="    border: none;
                                                      margin-top: 4px;">
                                                    <button type="submit" class="fa fa-search" style="text-decoration: none; border: none;background: white;"></button>
                                                </span>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                                <c:if test="${size < 1}">
                                    <div class="blog-heading">
                                        <span>What's thing we have today?</span>
                                        <h3>Oops! No information</h3>
                                    </div>
                                </c:if>
                                <c:if test="${size > 0}">
                                    <div class="table-responsive">
                                        <table id="productTable" class="table text-start align-middle table-bordered table-hover mb-0">
                                            <thead>
                                                <tr class="text-white">
                                                    <th scope="col"></th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Category</th>
                                                    <th scope="col">Quantity</th>
                                                    <th scope="col">Price</th>
                                                    
                                                    <th scope="col">
                                                        <form method="post" action="productManage">
                                                        <select name="numPage" onchange="this.form.submit()">
                                                            <option value="5" ${numPage == '5' ? 'selected' : ''}>5</option>
                                                            <option value="10" ${numPage == '10' ? 'selected' : ''}>10</option>
                                                            <option value="20" ${numPage == '20' ? 'selected' : ''}>20</option>
                                                            <option value="50" ${numPage == '50' ? 'selected' : ''}>50</option>
                                                            <option value="all" ${numPage == 'all' ? 'selected' : ''}>All</option>
                                                        </select>
                                                        <input type="hidden" name="indexPage" value="${tag}" />
                                                        <input type="hidden" name="action" value="${action}" />
                                                        <input type="hidden" name="search" value="${search}" />
                                                    </form>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.productCmap}" var="c">
                                                    <tr>
                                                        <td><img style="width: 80px" src="${c.getKey().getImage()}" alt="alt"/></td>
                                                        <td >
                                                            <a class="name"  href="productUpdate?pid=${c.getKey().getProductID()}">${c.getKey().getName()}</a>
                                                        </td>  
                                                        <td>${c.getValue()}</td>
                                                        <td>
                                                            <c:if test="${c.getKey().getStockQuantity() != 0}">
                                                                <span class="status-green"></span>
                                                                ${c.getKey().getStockQuantity()}
                                                            </c:if>
                                                            <c:if test="${c.getKey().getStockQuantity() == 0}">
                                                                <span class="status-red"></span>
                                                                ${c.getKey().getStockQuantity()}
                                                            </c:if>                                         
                                                        </td>
                                                        <td>${c.getKey().getUnitPrice()}</td>
                                                        
                                                        <td style=" padding: 0.5rem 0.5rem;
                                                            text-align: center;
                                                            font-size: larger;
                                                            transition: 0.5s;
                                                            color: var(--color-dark);">
                                                            <a href="#" class="bx bxs-hide" 
                                                               style="  padding: 1rem 1rem; color:#176B87
                                                               " onclick="showMess(${c.getKey().getProductID()})"
                                                               ></a>
                                                            <a class="bx bxs-pencil" href="productUpdate?pid=${c.getKey().getProductID()}" style="  padding: 1rem 1rem; color:#176B87"></a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <a href="productAdd" class="btn btn-primary">Add new product</a>
                                        <button style="    background: #22A699;
                                                text-decoration: none;
                                                border: none;
                                                height: 2.3rem;
                                                border-radius: 5px; margin-top: 25px"><a href="productManage?action=hide" style="color: white"> Hide Product</a>
                                        </button>

                                        <nav style="float: right;margin-top: 25px; color: black" aria-label="Page navigation example">
                                            <form id="paginationForm" action="productManage" method="post">
                                                <input type="hidden" name="action" value="${action}">
                                                <input type="hidden" name="indexPage" id="indexPage">
                                                <input type="hidden" name="search" value="${search}">
                                                <input type="hidden" name="numPage" value="${numPage != null ? numPage : '5'}">
                                            </form>

                                            <ul class="pagination">
                                                <c:if test="${tag > 1}">
                                                    <li class="page-item">
                                                        <a style="color: black" class="page-link" href="#" onclick="submitForm(${tag - 1})">Previous</a>
                                                    </li>
                                                </c:if>
                                                <c:forEach begin="1" end="${endPage}" var="i">
                                                    <li style="color: black" class="page-item ${tag == i ? 'active' : ''}">
                                                        <a style="color: black" class="page-link" href="#" onclick="submitForm(${i})">${i}</a>
                                                    </li>
                                                </c:forEach>
                                                <c:if test="${tag < endPage}">
                                                    <li class="page-item">
                                                        <a style="color: black" class="page-link" href="#" onclick="submitForm(${tag + 1})">Next</a>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </nav>

                                    </div>
                                </c:if>

                                <div id="pagination"></div>
                            </div>
                        </div>
                    </div>
                    <!-- Blank End -->
                    <!--Modal-->
                    <!-- Footer Start -->

                    <!-- Footer End -->
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
                                                                   function changeColor(element) {
                                                                       var paginationLinks = document.querySelectorAll(".pagination a");
                                                                       for (var i = 0; i < paginationLinks.length; i++) {
                                                                           paginationLinks[i].classList.remove("active");
                                                                       }
                                                                       element.classList.add("active");
                                                                   }
            </script>
            <script>
                function showMess(id) {
                    var option = confirm('Are you sure to hide?');
                    if (option === true) {
                        window.location.href = 'productDeactive?action=hide&id=' + id;
                    }
                }
                
                function submitForm(indexPage) {
                    document.getElementById("indexPage").value = indexPage;
                    document.getElementById("paginationForm").submit();
                }
            </script>


            <style>
                #productTable {
                    border-collapse: collapse;
                    width: 100%;
                }

                #productTable td, #productTable th {
                    border: 1px solid #ddd;
                    padding: 8px;
                }

                #productTable tr:nth-child(even){
                    background-color: #f2f2f2;
                }

                #productTable tr:hover {
                    background-color: #ddd;
                }

                #productTable th {
                    padding-top: 12px;
                    padding-bottom: 12px;
                    text-align: left;
                    background-color: #22A699;
                    color: white;
                }
            </style>
    </body>

</html>