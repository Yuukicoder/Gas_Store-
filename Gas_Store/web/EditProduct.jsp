
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Crud</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">

            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="edit" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${product.id}" name="id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${product.name}" name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input value="${product.imageUrl}" name="image" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="${product.price}" name="price" type="text"  pattern="^\d+\.*\d*$" title="Please Enter Positive Value!" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input name="quantityP" type="number" class="form-control" pattern="^\d+$" title="Please Enter Integer Value!" 
                                           required min="${product.quantityP}" value="${product.quantityP}">
                                </div>

                                <div class="form-group">
                                    <label>Title</label>
                                    <textarea name="title" class="form-control" required>${product.tiltle}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required>${product.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listCategories}" var="o">
                                            <option ${(product.categoryId == o.cid)?"selected":""} value="${o.cid}">${o.cname}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <script>
            // Function to restrict input to numbers and ensure it doesn't go below current quantity
            function validateQuantityInput(input) {
                var currentQuantity = parseInt(${product.quantityP});
                if (parseInt(input.value) < currentQuantity) {
                    input.value = currentQuantity;
                }
            }

            // Attach the validation function to the input field's oninput event
            document.getElementById('quantityInput').addEventListener('input', function () {
                validateQuantityInput(this);
            });
        </script>


        <script>
            $(document).ready(function () {
                // Bắt sự kiện khi nút "X" được nhấn
                $(".close").click(function () {
                    // Thực hiện chuyển hướng đến trang JSP mong muốn
                    window.location.href = "manager";
                });
            });
        </script>

    </body>
</html>

