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

        <!--    <div class="left-side">
                 Các phần tử trong left-side 
            </div>
        
            <div class="right-side">
                 Các phần tử trong right-side 
            </div>-->

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
                                    <button onclick="toggleScreen1()" class="btn btn-primary">Product Detail</button>
                                    <button onclick="toggleScreen2()" class="btn btn-primary">Product Image</button>
                                    <hr>

                                    <form action="productUpdate?pid=${pdto.getProductID()}" method="post"  enctype="multipart/form-data" onsubmit="return validateForm2()">
                                        <div class="row">
                                            <div class=""  id="detailProduct">
                                                <div class="left-side">
                                                    <div class="col-md-6">
                                                        <label class="form-label">Product Name</label>
                                                        <input type="text" value="${pdto.getName()}" class="form-control col-4" name="name" id="name" required>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Product Code</label>
                                                        <input type="text" value="${pdto.getCode()}" class="form-control col-4" name="code" id="code" required>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Product Keywords</label>
                                                        <input type="text" value="${pdto.getKeywords()}" class="form-control col-4" name="keyword" id="keyword" required>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label class="form-label">Product Image</label>
                                                        <input type="file" value="" class="form-control" name="ipro" data-index="0" id="ipro" >
                                                        <img style="width: 20rem" src="${pdto.getImage()}" alt="alt"/>

                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Category</label>
                                                        <select name="category" id="category" class="form-control col-4">
                                                            <c:forEach items="${requestScope.categoryDTOs}" var="c">
                                                                <option value="${c.getCategoryID()}" ${c.getCategoryID() == categoryID ? 'selected' : ''}>
                                                                    ${c.getName()}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                                                                            </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Supplier </label>
                                                        <select name="supplier" id="supplier" class="form-control col-4">
                                                            <c:forEach items="${requestScope.supplierDTOs}" var="c">
                                                                <option value="${c.getSupplierID()}" ${c.getSupplierID() == supplierID ? 'selected' : ''}>
                                                                    ${c.getCompanyName()}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Quantity available </label>
                                                        <input type="text" value="${pdto.getStockQuantity()}" class="form-control col-3" name="stock" id="stock" >
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">UnitPrice</label>
                                                        <input type="text" value="${pdto.getUnitPrice()}" class="form-control col-3" name="price" id="price" >
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Unit On Orders</label>
                                                        <input type="text" value="${pdto.getUnitOnOrders()}" class="form-control col-3" name="unitOnOrders" id="unitOnOrders" >
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Short description</label>
                                                        <input type="text" value="${pdto.getShortDescription()}" class="form-control col-3" name="shortDes" id="shortDes" >
                                                    </div>


                                                    <div class="col-md-6" style="display: flex;
                                                         flex-direction: column;
                                                         margin-bottom: 20px;">
                                                    </div>
                                                </div>



                                                    
                                                <div class="right-side">

                                                    <label class="form-label">Description</label>
                                                    <textarea id="w3review" name="descrip" rows="4" cols="50" class="form-control col-3">${pdto.getDescription()} </textarea>
                                                    <script>
                                                        CKEDITOR.replace('descrip', {
                                                            extraPlugins: 'image' // Bật tính năng dán ảnh
                                                        });
                                                    </script>
                                                    <button type="submit"   class="btn btn-primary" style="margin-top: 30px" value="product" name="update">Update Changes</button> 
                                                </div>
                                            </div>

                                            <div class="" id="imgProduct">
                                                <div class="left-side"> <p>Image Description</p>
                                                    <h3>
                                                        <c:forEach items="${requestScope.pimgs}" var="c" varStatus="loop">
                                                            
                                                            <input type="checkbox" name="deleteImg" value="${c.getImgID()}">
                                                            <img style="width: 12rem; margin: 0.2rem" src="${c.getPath()}" alt="alt"/>
                                                            <input type="hidden"name="imgID-${loop.index}" value="${c.getImgID()}">
                                                        </c:forEach>
                                                    </h3>
                                                    <button type="submit"   class="btn btn-primary" style="margin-top: 30px" value="delete" name="update" >Delete Image</button> </div>
                                                <div class="right-side"> 
                                                    <div id="inputContainer">
                                                    </div>
                                                    <button type="button" class="btn btn-primary" style="margin-top: 30px" onclick="addImageInput()">More Image</button>
                                                    <button type="submit"   class="btn btn-primary" style="margin-top: 30px" value="imageAdd" name="update">Add  Image</button>                                           
                                                </div>
                                            </div>
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
            var screenElement1 = document.getElementById("detailProduct");
            var screenElement2 = document.getElementById("imgProduct");

            function toggleScreen1() {
                screenElement1.style.display = "block";
                screenElement2.style.display = "none";
            }

            function toggleScreen2() {
                screenElement1.style.display = "none";
                screenElement2.style.display = "block";
            }
        </script>

        <script>
            function addImageInput() {

                var container = document.getElementById("inputContainer");

                var newInputGroup = document.createElement("div");
                newInputGroup.className = "input-group";
                newInputGroup.style = "width: 100%; margin-top: 0.5rem ";

                var newInput = document.createElement("input");
                newInput.type = "file";
                newInput.className = "form-control";
                newInput.name = "ides[]";

                var deleteButton = document.createElement("button");
                deleteButton.type = "button";
                deleteButton.className = "btn btn-danger";
                deleteButton.textContent = "Delete";
                newInput.style = "width: 25%; ";
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


            function validateForm2() {
                var productName = document.getElementById("name").value;
                var imageProduct = document.getElementById("ipro").value;
                var quantityAvailable = document.getElementById("stock").value;
                var unitPrice_raw = document.getElementById("price").value;
                var unitPrice = parseFloat(unitPrice_raw);
                var description = document.getElementById("w3review").value;
                var checkbox = document.getElementsByName("deleteImg");

                if (productName.trim() === "") {
                    alert("Please enter a product name!");
                    return false;
                }

                if (quantityAvailable === "" || unitPrice_raw === "" || description === "") {
                    alert("Please enter all required information!");
                    return false;
                }

                let checkedCount = 0;
                for (let i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {
                        checkedCount++;
                    }
                }
                if (checkedCount === checkbox.length && checkbox.length !== 0) {
                    alert("You cannot delete all images!");
                    return false;
                }

                // Kiểm tra Product Name không chứa ký tự đặc biệt
                var specialCharRegex = /[!@#$%^&*(),.?":{}|<>]/;
                if (specialCharRegex.test(productName)) {
                    alert("Product Name should not contain special characters!");
                    return false;
                }

                // Kiểm tra Quantity là một số nguyên dương
                var quantityRegex = /^[1-9]\d*$/;
                if (!quantityRegex.test(quantityAvailable)) {
                    alert("Quantity should be a positive integer!");
                    return false;
                }

                // Kiểm tra Unit Price là số dương
                var positiveFloatRegex = /^([1-9]\d*([.]\d+)?|0\.\d*[1-9]\d*)$/;
                if (!positiveFloatRegex.test(unitPrice_raw)) {
                    alert("Price should be a positive float!");
                    return false;
                }

                // Kiểm tra Quantity không quá lớn
                if (parseInt(quantityAvailable) > Number.MAX_SAFE_INTEGER) {
                    alert("Quantity is too large for an integer!");
                    return false;
                }

                // Kiểm tra Unit Price không quá lớn
                const maxFloatValue = 99999999.99;
                if (unitPrice > maxFloatValue) {
                    alert("Unit Price is too large!");
                    return false;
                }

                // Kiểm tra Description
                if (description.trim().length <= 6 || description.trim().length === 0) {
                    alert("Description must not be empty and longer than 6 characters!");
                    return false;
                }

                return true;
            }
            

        </script>
        <style>
            .select-contain {
                display: inline-flex;
            }

            .select-input {
                margin-right: 5px;
            }
            #imgProduct{
                display: none
            }

        </style>



    </body>

</html> 