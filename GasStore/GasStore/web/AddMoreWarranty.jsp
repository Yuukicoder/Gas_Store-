<%-- 
    Document   : AddMoreWarranty
    Created on : 10 Jul, 2024, 5:42:46 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Warranty</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body class="p-5">
        <header></header>
        <div>
            <a href="manageWarranty" style="text-decoration: none; color: blue"> < Back to manage Warranty</a>
            <!-- 2 column grid layout with text inputs for the first and last names -->
            <form action="addWarranty" method="POST">
              <div class="col">
                <div data-mdb-input-init class="form-outline">
                    <label class="form-label mt-5" for="form3Example1">Serial number</label>
                    <input type="text" id="form3Example1" name="serialNumber" value="${serialNumber}" class="form-control" />
                    <input type="text" name="Service" value="serialInfo" hidden class="form-control" />
                    <button type="submit" class="mt-3">Get info</button>
                </div>
                <p class="text-danger">${mess}</p>
              </div>
            </form>
            <c:if test="${cus != null}">
            <c:set var="cus" value="${cus}"/>
            <c:set var="pro" value="${pro}"/>
            <form action="addWarranty" method="POST" enctype="multipart/form-data">
                <input name="serialId" value="${serialId}" hidden/>
                <input name="Service" value="add" hidden/>
                <div data-mdb-input-init class="form-outline mb-4 mt-4">
                    <label class="form-label" for="form3Example3">Product Name</label>
                    <input type="text" name="productName" value="${pro.getName()}" id="form3Example3" class="form-control" />
                </div>
                    <img src="images/Product_Images/${pro.getImage()}" style="with: 100px; height: 100px" alt="alt"/>
                <div class="col">
                    <div data-mdb-input-init class="form-outline mt-4">
                        <label class="form-label" for="form3Example2">Customer name</label>
                        <input type="text" name="customerid" value="${cus.getCustomerID()}" hidden id="form3Example2" class="form-control" />
                        <input type="text" name="CustomerName" value="${cus.getUserName()}" id="form3Example2" class="form-control" />
                    </div>
                </div>
                <c:set var="emp" value="${sessionScope.account}"/>
                <div class="col">
                    <div data-mdb-input-init class="form-outline">
                        <label class="form-label" for="form3Example2">Employee name</label>
                        <input type="text" name="employeeId" value="${emp.getAdminID()}" hidden id="form3Example2" class="form-control" />
                        <input type="text" name="employeeName" value="${emp.getUserName()}" id="form3Example2" class="form-control" />
                    </div>
                </div>
               <div data-mdb-input-init class="form-outline mb-4 mt-3">
                    <label class="form-label" for="form3Example4">Expect date</label>
                    <input type="Date" name="expectDate" value="${warr.getExpectedDate()}" required />
                </div>
                
                <input type="file" required accept="image/gif, image/jpeg, image/png"
                       name="proImage" 
                       onchange="previewImages(this)"
                       class="form-control"
                       style="z-index: 100;" placeholder="Enter photo" multiple>
                <div id="previewContainer" class="mt-5"></div>
                
                <div data-mdb-input-init class="form-outline mb-4 mt-3">
                    <label class="form-label" for="form3Example4">Note</label>
                    <textarea  value="" rows="4" name="note" required id="form3Example4" class="form-control" required></textarea>
                </div>
                <button data-mdb-ripple-init type="submit" class="btn btn-primary btn-block mb-4">Add</button>
            </form>
            </c:if>
        </div>
        <%@include file="component/footer.jsp" %>
       <script>
    function previewImages(input) {
        var previewContainer = document.getElementById('previewContainer');
        previewContainer.innerHTML = ""; // Clear previous images
        var files = input.files;

        if (files) {
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                var reader = new FileReader();
                reader.onload = (function (file) {
                    return function (e) {
                        var imgElement = document.createElement("img");
                        imgElement.style.width = "300px";
                        imgElement.src = e.target.result;
                        previewContainer.appendChild(imgElement);
                    };
                })(file);
                reader.readAsDataURL(file);
            }
        }
    }
</script>
    </body>
</html>
