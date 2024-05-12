

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <!------ Include the above in your HEAD tag ---------->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!-- Back to top button -->
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
        <link href="css/style1.css" rel="stylesheet"/>
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="Test/css/normalize.css">
        <link rel="stylesheet" type="text/css" href="Test/icomoon/icomoon.css">
        <link rel="stylesheet" type="text/css" href="Test/css/vendor.css">
        <link rel="stylesheet" type="text/css" href="Test/style.css">
        <title>Book Shop</title>

    </head>
    <body>
        <%@include file="common/navBarCommon.jsp" %>
        <div class="container">
            <div class="row justify-content-between align-items-center">
                <div class="col-auto">
                    <nav aria-label="breadcrumb">
                    </nav>
                </div>
                <div class="col-auto">
                    <form action="searchbyprice" method="post" class="form-inline">
                        <div class="form-group mr-2">
                            <label for="minPrice" class="mr-2">Min Price:</label>
                            <input type="number" class="form-control numInput" id="minPrice" name="minPrice"
                                   value="<%= request.getParameter(" minPrice") %>" min="1">
                        </div>
                        <div class="form-group mr-2">
                            <label for="maxPrice" class="mr-2">Max Price:</label>
                            <input type="number" class="form-control numInput" id="maxPrice" name="maxPrice"
                                   value="<%= request.getParameter(" maxPrice") %>" min="1">
                        </div>
                        <button type="submit" class="btn btn-primary" style="border-radius: 12px;padding: 10px 24px">Search</button>
                    </form>
                </div>
            </div>
        </div>

    </div> 
    <section id="featured-books" class="py-5 my-5">
        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <div class="section-header align-center">
                        <div class="title">
                            <span>Some quality items</span>
                        </div>
                        <h2 class="section-title">Featured Books</h2>
                    </div>

                    <div class="product-list" data-aos="fade-up">
                        <div class="row">
                            <c:forEach items="${listProducts}" var="P">
                                <div class="col-md-3 ">

                                    <div class="product-item">
                                        <a href="detail?productId=${P.id}"><div  class="product-style">
                                                <img src="${P.imageUrl}" alt="..." class="product-item">
                                                <a href="addtocart?productId=${P.id}"><button type="button" class="btn add-to-cart" ata-product-tile="add-to-cart">Add to
                                                        Cart</button></a>
                                            </div></a>
                                        <figcaption>
                                            <h3>${P.name}</h3>  
                                            <span>Armor Ramsey</span>
                                            <div class="item-price num">${P.price}</div>  Price 
                                        </figcaption>
                                    </div>

                                </div>
                            </c:forEach>
                        </div><!--ft-books-slider-->
                    </div><!--grid-->
                </div><!--inner-content-->
            </div>
        </div>
    </section>


    <c:choose>
        <c:when test="${listProducts==null || listProducts.size()==0}">
            Not founds
        </c:when>
        <c:otherwise>
            <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                <ul class="pagination">

                    <c:forEach begin="1" end="${totalPage}" var="i">
                        <li class="page-item ${i == page?"active":""}"><a class="page-link" href="home?page=${i}">${i}</a></li>
                        </c:forEach>

                </ul>
            </nav>
        </c:otherwise>
    </c:choose>
    <!--Back to top button-->
    <button type="button" class="btn btn-floating btn-lg" id="btn-back-to-top">
        <i class="fas fa-arrow-up"></i>
    </button>
    <%@include file="common/footerCommon.jsp" %>
    <script src="js/Checkbox.js"></script>
    <script src="js/scripts.js" type="javascript"></script>

    <script src="js/Money_charge.js" type="text/javascript"></script>
    <script src="Test/js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
    <script src="Test/js/plugins.js"></script>
    <script src="Test/js/script.js"></script>
</body>
</html>

