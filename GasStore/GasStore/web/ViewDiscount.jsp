<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Tech Blog - Stylish Magazine Blog Template</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="css/css_post/css/bootstrap.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/postList.css">
</head>
<body>
    <div class="container-fluid">
        <div class="row bg-secondary py-1 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block"></div>
            <div class="col-lg-6 text-center text-lg-right">
                <c:if test="${empty acc}">
                    <div class="d-inline-flex align-items-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Account</button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <button class="dropdown-item" type="button"><a href="login">Login</a></button>
                                <button class="dropdown-item" type="button"><a href="signup">Sign in</a></button>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty acc}">
                    <div class="d-inline-flex align-items-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">${acc.getUserName()}</button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <button class="dropdown-item" type="button"><a href="mypurchase">My Purchase</a></button>
                                <button class="dropdown-item" type="button"><a href="UserProfile?aid=${acc.getCustomerID()}">Profile</a></button>
                                <button class="dropdown-item" type="button"><a href="logout">Logout</a></button>
                            </div>
                        </div>
                    </div>
                </c:if>
                <div class="d-inline-flex align-items-center d-block d-lg-none">
                    <a href="" class="btn px-0 ml-2">
                        <i class="fas fa-heart text-dark"></i>
                        <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                    </a>
                    <a href="" class="btn px-0 ml-2">
                        <i class="fas fa-shopping-cart text-dark"></i>
                        <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
            <div class="col-lg-4">
                <a href="home" class="text-decoration-none">
                    <span class="h1 text-uppercase text-primary bg-dark px-2">GasStore</span>
                    <!--<span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>-->
                </a>
            </div>
            <div class="col-lg-4 col-6 text-left">
                <form action="ViewDiscount" method="post">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="What are you searching for?" name="search">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <button type="submit" class="fa fa-search" style="text-decoration: none; border: none"></button>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            
        </div>
    </div>
    <%@include file="component/navbar.jsp" %>
    <div id="wrapper">
        <form action="ViewDiscount">
              <div class="container-fluid">
                <div class="row px-xl-5">
                    <div class="col-12">
                        <nav class="breadcrumb bg-light mb-30">
                            <a class="breadcrumb-item text-dark" href="home">Home</a>
                            <a class="breadcrumb-item text-dark" href="shop">Discount</a>
                            <span class="breadcrumb-item active">Discount All</span>
                        </nav>
                    </div>
                </div>
            </div>
        </form>
        <section id="blog">
            <c:if test="${size < 1}">
                <div class="blog-heading">
                    <span>What's thing we have today?</span>
                    <h3>Oops! No information</h3>
                </div>
            </c:if>
            <c:if test="${size   > 0}">
                <div class="blog-heading">
                    <span>What's thing we have today?</span>
                    <h3>Discount</h3>
                </div>
                <div class="blog-container">
                    <c:forEach items="${requestScope.paginatedPosts}" var="c">
                        <div class="blog-box">
                            <div class="blog-img">
                                <!--<img src="images/Post/$ {c.getPostbanner()}" alt="">-->
<!--                                <p>$    {c.discountCode}</p>-->
<p style="text-align: center">${c.name}</p>
                            </div>
                            <div class="blog-text">
                                <p>Discount: ${c.discountCode}</p>
                                <p>DiscountAmount: ${c.discountAmount}%</p>
                                
<!--                                <a href="postDetail?postID=$ {c.getPostID()}" class="blog-title">$  {c.getTitle()}</a>-->
                               
                                <!--<a href="postDetail?postID=$    {c.getPostID()}">Read More</a>-->
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="col-12">
                    <nav>
                        <ul class="pagination justify-content-center">
                            <li class="page-item <c:if test="${requestScope.currentPage == 1}">disabled</c:if>">
                                <a class="page-link" href="ViewDiscount?page=${requestScope.currentPage - 1}">Previous</a>
                            </li>
                            <c:forEach var="i" begin="1" end="${requestScope.maxPage}">
                                <li class="page-item <c:if test="${i == requestScope.currentPage}">active</c:if>">
                                    <a class="page-link" href="ViewDiscount?page=${i}">${i}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item <c:if test="${requestScope.currentPage == requestScope.maxPage}">disabled</c:if>">
                                <a class="page-link" href="ViewDiscount?page=${requestScope.currentPage + 1}">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </c:if>
        </section>
        <%@include file="component/footer.jsp" %>
    </div>
    <script src="css/css_post/js/jquery.min.js"></script>
    <script src="css/css_post/js/tether.min.js"></script>
    <script src="css/css_post/js/bootstrap.min.js"></script>
    <script src="css/css_post/js/custom.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
