<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Post Management</title>
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

            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-secondary navbar-dark">
                    <a href="admin" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>ADMIN SITE</h3>
                    </a>


                </nav>
            </div>
            <%@include file="component/SideBarAdmin.jsp" %>

            <!-- Content Start -->
            <div class="content">
                <%@include file="component/navbarAdmin.jsp" %>
                <!-- Blank Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">
                            <div class="col-sm-12 col-xl-6 ">
                                <div class="bg-secondary rounded h-100 p-4">
                                    <h6 >All Category Post</h6>

                                    <div class="table-responsive" style="max-height: 200px;
                                         overflow-y: auto;
                                         margin-left: 0.1rem;">
                                        <table id="categoryTable" class="table text-start align-middle table-bordered table-hover mb-0" >
                                            <thead>
                                                <tr class="text-white">
                                                    <th scope="col"></th>
                                                    <th scope="col"></th>                                              
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.postCategoryDTOs}" var="c">
                                                    <tr>
                                                        <td >
                                                            <a class="name"  href="postDashboard?postCategoryID=${c.getCategoryID()}">${c.getName()}</a>
                                                        </td>                                                                                                                                                   
                                                        <td >
                                                            <a href="#" class="bx bxs-trash" 
                                                               style="  padding: 1rem 1rem; color:#176B87
                                                               " onclick="showMessForCategory(${c.getCategoryID()})"
                                                               ></a><a class="bx bxs-pencil" href="EditPostCategory?pcid=${c.getCategoryID()}" style="  color:#176B87
                                                               "></a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                            </div> 
                            <div class="col-sm-12 col-xl-6 ">
                                <div class="bg-secondary rounded h-100 p-4">
                                    <h6 class="mb-4" ">Add Category Post</h6>
                                    <form action="AddPostCategory" method="POST" onsubmit="return validateForm();">
                                        <div class="mb-3">
                                            <label class="form-label">Category Name</label>
                                            <input type="text" class="form-control" name="categoryPost" id="categoryPost">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Add new category</button>
                                    </form>
                                   
                                </div>
                            </div>


                            <div class="bg-secondary text-center rounded p-4">
                                <h3 style="color: #E57C23">${msg}</h3>

                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <form action="tableCategory" method="POST">       
                                        <a href="postDashboard" class="btn btn-primary">All Post</a>
                                        <a href="AddPost" class="btn btn-primary">Add post</a>
                                    </form>
                                     <form action="postDashboard" method="post">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-dark border-0" placeholder="Search post" name="search">
                                            <div class="input-group-append">
                                                <span class="input-group-text bg-transparent text-primary" style="    border: none;
                                                      margin-top: 4px;">
                                                    <button type="submit" class="fa fa-search" style="text-decoration: none; border: none;background: white;"></button>
                                                </span>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="table-responsive">
                                    <table id="postTable" class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">

                                                <th scope="col">ID</th>
                                                <th scope="col">Title</th>
                                                <th scope="col">Category</th>                                              
                                                <th scope="col">Banner</th>                                              
                                                <th scope="col">Date </th>                                              
                                                <th scope="col">Action </th>                                              

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.postDTOs}" var="c">
                                                <tr>
                                                    <td>${c.getPostID()}</td>
                                                    <td  class="limited-text" style="max-width: 400px; word-wrap: break-word;">
                                                        <a class="name"  href="EditPost?pcid=${c.getPostID()}">${c.getTitle()}</a>
                                                    </td>  
                                                    <td>${c.getCategory()}</td>
                                                    <td><img style="width: 80px" src="images/Post/${c.getPostImg()}" alt="alt"/></td>
                                                    <td>${c.getDateCreated()}</td>                                                                                                      
                                                    <td style=" padding: 0.5rem 0.5rem;
                                                        text-align: center;
                                                        font-size: larger;
                                                        transition: 0.5s;
                                                        color: var(--color-dark);">
                                                        <a href="DeletePost?id=${c.getPostID()}" class="bx bxs-trash"  style="  padding: 1rem 1rem; color:#176B87   " onclick="showMess(${c.getPostID()})" ></a>
                                                        <a class="bx bxs-pencil" href="EditPost?pcid=${c.getPostID()}" style="  padding: 1rem 1rem; color:#176B87"></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>



                                    <nav style="float: right;margin-top: 25px; color: black" aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:if test="${tag > 1}">
                                                <li  class="page-item"><a style="color: black"  class="page-link" href="postDashboard?indexPage=${tag-1}">Previous</a></li>
                                                </c:if>
                                                <c:forEach begin="1" end="${endPage}" var="i">
                                                <li style="color: black"  class="page-item ${tag == i ?"active":"" || page1 == i ?"active":""  } "><a style="color: black"  class="page-link" href="postDashboard?indexPage=${i}">${i}</a></li>
                                                </c:forEach>
                                                <c:if test="${tag<endPage}">
                                                <li class="page-item"><a style="color: black"  class="page-link" href="postDashboard?indexPage=${tag+1}">Next</a></li>
                                                </c:if>
                                        </ul>
                                    </nav>
                                </div>

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
                                                            function showMess(id) {
                                                                var option = confirm('Are you sure to delete?');
                                                                if (option === true) {
                                                                    window.location.href = 'DeletePost?id=' + id;
                                                                    ;
                                                                }
                                                            }
                                                            function showMessForCategory(id) {
                                                                var option = confirm('Are you sure to delete?');
                                                                if (option === true) {
                                                                    window.location.href = 'DeleteCategory?id=' + id;
                                                                    ;
                                                                }
                                                            }
            </script>
            <style>
                #postTable {
                    border-collapse: collapse;
                    width: 100%;
                }

                #postTable td, #postTable th {
                    border: 1px solid #ddd;
                    padding: 8px;
                }

                #postTable tr:nth-child(even){
                    background-color: #f2f2f2;
                }

                #postTable tr:hover {
                    background-color: #ddd;
                }

                #postTable th {
                    padding-top: 12px;
                    padding-bottom: 12px;
                    text-align: left;
                    background-color: #22A699;
                    color: white;
                }
            </style>
            <script>

        function validateForm() {
            var categoryPost = document.getElementById("categoryPost").value;
            if (categoryPost === "") {
                alert("Category cannot null");
                return false;
            }
            return true;
        }
    </script>
    </body>

</html>