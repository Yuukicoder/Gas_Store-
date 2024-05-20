<%-- 
    Document   : ProductDetails
    Created on : Jun 11, 2023, 4:41:34 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Admin </title>
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
        <link href="css/style1.css" rel="stylesheet">
        <link href="js/proDetails.js" rel="stylesheet">
    </head>

    <body>

        <!-- Spinner Start -->

        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <%@include file="component/SideBarAdmin.jsp" %>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <%@include file="component/navbarAdmin.jsp" %>
            <!-- Navbar End -->
            <div class="card-wrapper">
                <div class="card">
                    <!-- card left -->
                    <div class="product-imgs">
                        <div class="img-display">
                            <div class="img-showcase">
                                <img src="images/Product/asus-tuf-gaming-fx506lhb-i5-hn188w-(52).jpg" alt="laptop image">
                                <img src="images/Product/asus-rog-strix-gaming-g513ih-r7-4800h-8gb-512gb-4gb-600x600.jpg" alt="laptop image">
                                <img src="images/Product/asus-vivobook-15x-oled-a1503za-i5-l1290w-040722-050332-600x600.jpg" alt="laptop image">
                                <img src="images/Product/asus-vivobook-s-14-flip-tp3402va-i5-lz031w-thumb-1-600x600.jpg" alt="laptop image">
                            </div>
                        </div>
                        <div class="img-select">
                            <div class="img-item">
                                <a href="#" data-id="1">
                                    <img src="images/Product/asus-vivobook-s-14-flip-tp3402va-i5-lz031w-thumb-1-600x600.jpg" alt="laptop image">
                                </a>
                            </div>
                            <div class="img-item">
                                <a href="#" data-id="2">
                                    <img src="images/Product/asus-vivobook-s-14-flip-tp3402va-i5-lz031w-thumb-1-600x600.jpg" alt="laptop image">
                                </a>
                            </div>
                            <div class="img-item">
                                <a href="#" data-id="3">
                                    <img src="images/Product/asus-vivobook-s-14-flip-tp3402va-i5-lz031w-thumb-1-600x600.jpg" alt="laptop image">
                                </a>
                            </div>
                            <div class="img-item">
                                <a href="#" data-id="4">
                                    <img src="images/Product/asus-vivobook-s-14-flip-tp3402va-i5-lz031w-thumb-1-600x600.jpg" alt="laptop image">
                                </a>
                            </div>


                            <div class="">
                                <div class="">

                                    <i class="fas fa-cloud-upload-alt tm-upload-icon"
                                       onclick="document.getElementById('fileInput').click();"></i>
                                </div>
                                <div class="">
                                    <input id="fileInput" type="file" style="display:none;" />
                                    <input type="button" class="btn btn-primary btn-block mx-auto" value="CHANGE IMAGE NOW"
                                           onclick="document.getElementById('fileInput').click();" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- card right -->
                    <div class="product-content">
                        <h2 class="product-title">Product Detail</h2>
                        <a href="#" class="product-link"> Product</a>
                        <div class="col-12" >
                            <h2 class="tm-block-title d-inline-block">Edit Product</h2>
                        </div>




                        <form action="" method="post" class="tm-edit-product-form">
                            <div class="product-detail">
                                <div class="form-group mb-3">
                                    <label
                                        for="name"
                                        >Product Name
                                    </label>
                                    <input
                                        id="name"
                                        name="name"
                                        type="text"
                                        value="Lorem Ipsum Product"
                                        class="form-control validate"
                                        style="background-color: white"
                                        />
                                </div>
                                <div class="form-group mb-3">
                                    <label
                                        for="description"
                                        >Description</label
                                    >
                                    <textarea                    
                                        class="form-control validate tm-small"
                                        rows="5"
                                        required
                                        style="background-color: white"
                                        >Lorem ipsum dolor amet gentrify glossier locavore messenger bag chillwave hashtag irony migas wolf kale chips small batch kogi direct trade shaman.</textarea>
                                </div>
                                <div class="form-group mb-3">
                                    <label
                                        for="category"
                                        >VgaBrand</label
                                    >
                                    <select
                                        class="custom-select tm-select-accounts"
                                        id="category"
                                        >
                                        <option>Select category</option>
                                        <option value="1" selected>New Arrival</option>
                                        <option value="2">Most Popular</option>
                                        <option value="3">Trending</option>
                                    </select>
                                </div>
                                <div class="row">
                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                        <label
                                            for="expire_date"
                                            >Expire Date
                                        </label>
                                        <input
                                            id="expire_date"
                                            name="expire_date"
                                            type="text"
                                            value="22 Oct, 2020"
                                            class="form-control validate"
                                            data-large-mode="true"
                                            style="background-color: white"
                                            />
                                    </div>
                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                        <label
                                            for="stock"
                                            >Quantity
                                        </label>
                                        <input
                                            id="stock"
                                            name="stock"
                                            type="text"
                                            value="19,765"
                                            class="form-control validate"
                                            style="background-color: white"
                                            />
                                    </div>
                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                        <label
                                            for="stock"
                                            >UnitPrice
                                        </label>
                                        <input
                                            id="stock"
                                            name="stock"
                                            type="text"
                                            value="19,765"
                                            class="form-control validate"
                                            style="background-color: white"
                                            />
                                    </div>
                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                        <label
                                            for="stock"
                                            >RamCapacity
                                        </label>
                                        <input
                                            id="stock"
                                            name="stock"
                                            type="text"
                                            value="19,765"
                                            style="background-color: white"
                                            class="form-control validate"
                                            />
                                    </div>
                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                        <label
                                            for="stock"
                                            >StorageCapa
                                        </label>
                                        <input
                                            id="stock"
                                            name="stock"
                                            type="text"
                                            value="19,765"
                                            style="background-color: white"
                                            class="form-control validate"
                                            />
                                    </div>
                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                        <label
                                            for="stock"
                                            >CpuBrand
                                        </label>
                                        <input
                                            id="stock"
                                            name="stock"
                                            type="text"
                                            value="19,765"
                                            style="background-color: white"
                                            class="form-control validate"
                                            />
                                    </div>

                                </div>


                            </div>



                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Now</button>
                            </div>
                        </form>
                    </div>


                    <div class="social-links" >

                        <a href="#">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="#">
                            <i class="fab fa-whatsapp"></i>
                        </a>
                        <a href="#">
                            <i class="fab fa-pinterest"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </body>              
</html>
