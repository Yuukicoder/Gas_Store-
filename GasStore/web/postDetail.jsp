<!DOCTYPE html>
<html lang="en">

    <!-- Basic -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Site Metas -->
    <title>Tech Blog - Stylish Magazine Blog Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Design fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet"> 

    <!-- Bootstrap core CSS -->
    <link href="css/css_post/css/bootstrap.css" rel="stylesheet">

    <!-- FontAwesome Icons core CSS -->
    <!--    <link href="css/css_post/css/font-awesome.min.css" rel="stylesheet">-->

    <!-- Custom styles for this template -->
    <!--    <link href="css/css_post/style.css" rel="stylesheet">-->

    <!-- Responsive styles for this template -->
    <!--    <link href="css/css_post/css/responsive.css" rel="stylesheet">-->

    <!-- Colors for this template -->


    <!-- Version Tech CSS for this template -->
    <!--    <link href="css/css_post/css/version/tech.css" rel="stylesheet">-->
    <link href="img/favicon.ico" rel="icon">

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
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

    <%@include file="component/topbar.jsp" %>
    <%@include file="component/navbar.jsp" %>
    <%@ page pageEncoding="UTF-8" %>

    <div id="wrapper">
        <section class="section single-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                            <div class="blog-title-area text-center">
                                <h3 class="limited-text" style="max-width: 800px; word-wrap: break-word;" >${pdto.getTitle()}</h3>
                            </div><!-- end title -->

                            <div class="single-post-media" >
                                <img src="upload/tech_menu_08.jpg" alt="" class="img-fluid">
                            </div><!-- end media -->

                            <div class="blog-content" style="max-width: 800px; word-wrap: break-word;">                                 
                                ${pdto.getContext()}
                            </div><!-- end content -->
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                    <!-- new post -->
                    <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                        <div class="sidebar">
                            <div class="widget">
                                <h2 class="widget-title">New Post</h2>
                                <div class="trend-videos">
                                    <c:forEach items="${requestScope.pdtos}" var="c">
                                        <div class="blog-box">
                                            <div class="post-media">
                                                <a href="tech-single.html" title="">
                                                    <img src="images/Post/${c.getPostImg()}" alt="" class="img-fluid">
                                                    <div class="hovereffect">
                                                        <span class="videohover"></span>
                                                    </div><!-- end hover -->
                                                </a>
                                            </div><!-- end media -->
                                            <div class="blog-meta">
                                                <h4  class="limited-text" style="max-width: 400px; word-wrap: break-word;">
                                                    <a style="    color: #17a2b8;
                                                       font-size: 1rem;
                                                       margin-top: 1rem;" href="postDetail?postID=${c.getPostID()}" title="">${c.getTitle()}</a>
                                                </h4>
                                            </div><!-- end meta -->
                                        </div><!-- end blog-box -->
                                        <hr class="invis">
                                    </c:forEach>
                                </div><!-- end videos -->
                            </div><!-- end widget -->
                        </div><!-- end sidebar -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
        <%@include file="component/footer.jsp" %>
    </div><!-- end wrapper -->

    <!-- Core JavaScript
    ================================================== -->
    <script src="css/css_post/js/jquery.min.js"></script>
    <script src="css/css_post/js/tether.min.js"></script>
    <script src="css/css_post/js/bootstrap.min.js"></script>
    <script src="css/css_post/js/custom.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>