<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Admin </title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <script src="ckeditor/ckeditor.js"></script>

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
        <style>
            .left-side {
                float: left;
                width: 50%;
            }

            .right-side {
                float: right;
                width: 50%;
            }
        </style>

    <div class="left-side">
        <!-- Các phần tử trong left-side -->
    </div>

    <div class="right-side">
        <!-- Các phần tử trong right-side -->
    </div>

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
            <%@include file="component/navbarAdmin.jsp" %>
            <!-- Blank Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="">
                            <div class="bg-secondary rounded h-100 p-4">
                                <h3 class="mb-4">Product Detail</h3>
                                <form action="productAdd" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
                                    <div class="left-side">
                                        <div class="col-md-6">
                                            <label class="form-label">Product Name</label>
                                            <input type="text" value="" class="form-control col-4" name="name" id="name" >
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Product Code</label>
                                            <input type="text" value="" class="form-control col-4" name="code" id="code">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Product Keywords</label>
                                            <input type="text" value="" class="form-control col-4" name="keyword" id="keyword" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Product Image</label>
                                            <input type="file" value="" class="form-control" name="ipr" data-index="0" id="ipr" >
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Category </label>
                                            <select name="category" id="cars" class="form-control col-4">
                                                <c:forEach items="${requestScope.cdtos}" var="c">
                                                    <option value="${c.getCategoryID()}">${c.getName()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Supplier </label>
                                            <select name="supplier" id="supplier" class="form-control col-4">
                                                <c:forEach items="${requestScope.listSupplier}" var="c">
                                                    <option value="${c.getSupplierID()}">${c.getCompanyName()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Quantity available </label>
                                            <input type="text" value="" class="form-control col-3" name="stock" id="stock" >
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">UnitPrice</label>
                                            <input type="text" value="" class="form-control col-3" name="price" id="price" >
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Unit On Orders</label>
                                            <input type="text" value="" class="form-control col-3" name="unitOnOrders" id="unitOnOrders" >
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Short description</label>
                                            <input type="text" value="" class="form-control col-3" name="shortDes" id="shortDes" >
                                        </div>
                                        <button type="submit" value=""  class="btn btn-primary" style="margin-top: 30px">Add Product</button> 
                                    </div>   
                                    <div class="right-side">
                                        <label class="form-label">Description</label>
                                        <textarea id="description" name="descrip" rows="4" cols="50" class="form-control col-3"> </textarea>
                                        <script>
                                            CKEDITOR.replace('descrip');
                                        </script>
                                        <div id="inputContainer">
                                        </div>
                                        <button type="button" class="btn btn-primary"  style="margin-top: 30px" onclick="addImageInput()">More Image</button>
                                    </div>
                                </form>
                            </div>
                        </div> 
                    </div>
                </div>

            </div>
            <!-- Content End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>
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
                                            function addImageInput() {

                                                var container = document.getElementById("inputContainer");

                                                var newInputGroup = document.createElement("div");
                                                newInputGroup.className = "input-group";
                                                newInputGroup.style = "width: 64%; margin-top: 0.5rem ";

                                                var newInput = document.createElement("input");
                                                newInput.type = "file";
                                                newInput.className = "form-control";
                                                newInput.name = "ides[]";
                                                newInput.style = "width: 50%; ";

                                                var deleteButton = document.createElement("button");
                                                deleteButton.type = "button";
                                                deleteButton.className = "btn btn-danger";
                                                deleteButton.textContent = "Delete";
                                                deleteButton.onclick = function () {
                                                    removeImageInput(this);
                                                };

                                                newInputGroup.appendChild(newInput);
                                                newInputGroup.appendChild(deleteButton);

                                                container.appendChild(newInputGroup);
                                            }

                                            function removeImageInput(button) {
                                                var inputGroup = button.parentNode;
                                                var container = inputGroup.parentNode;
                                                container.removeChild(inputGroup);
                                            }
    </script>

    <script>

        function validateForm() {
            var productName = document.getElementById("name").value;
            var imageProduct = document.getElementById("ipr").value;
            var quantityAvailable = document.getElementById("stock").value;
            var unitPrice_raw = document.getElementById("price").value;
            var unitPrice = parseFloat(document.getElementById("price").value);
            var description = document.getElementById("description").value;
            var descriptionWithoutSpaces = description.replace(/\s/g, "");
            var moreImage = document.getElementsByName("ides[]");
           
            var specialCharRegex = /[!@#$%^&*(),.?":{}|<>]/;

            if (productName === "" || imageProduct === "" || quantityAvailable === "" || unitPrice === "" || description === "") {
                alert("Please enter all required information!");
                return false;
            }
            for (var i = 0; i < moreImage.length; i++) {
                if (moreImage[i].value === "") {
                    alert("Please select at least one additional image!");
                    return false;
                }
            }


            var quantityRegex = /^[1-9]\d*$/;
            if (!quantityRegex.test(quantityAvailable)) {
                alert("Quantity should be a positive integer!");
                return false;
            }
            
            var positiveFloatRegex = /^([1-9]\d*([.]\d+)?|0\.\d*[1-9]\d*)$/;

            if (!positiveFloatRegex.test(unitPrice_raw)) {
                alert("Price should be a positive integer!");
                return false;
            }
       
            
            if (unitPrice <= 0 || isNaN(unitPrice)) {
                alert("Unit Price must be a  number greater than 0!");
                return false;
            }
            if (parseInt(quantityAvailable) > Number.MAX_SAFE_INTEGER) {
                alert("Quantity is too large for an integer!");
                return false;
            }
            const maxFloatValue = 99999999.99;

            if (parseFloat(unitPrice) > maxFloatValue) {
                alert("Unit Price is too large for a float!");
                return false;
            }

            if (descriptionWithoutSpaces.length <= 6) {
                alert("Description must be longer than 6 characters!");
                return false;
            }
            return true;
        }
    </script>
 
 

    <style>

    </style>
</body>

</html>