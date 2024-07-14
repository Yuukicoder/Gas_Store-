<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<style>
    .active{
        background-color: yellow;
        color:#ffffff
    }
    .icon-button {
        background: none;
        border: none;
        padding: 0;
        cursor: pointer;
    }
</style>
<body>
    <div class="container-fluid position-relative d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <%@ include file="SideBarSupplier.jsp" %>
        <div class="content">
            <%@ include file="navbarSupplier.jsp" %>
            <div class="container-fluid pt-4 px-4">
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-xl-6"></div>
                        <div class="bg-secondary text-center rounded p-4">
                            <c:if test="${not empty sessionScope.msg}">
                                <h3 style="color: #E57C23">${sessionScope.msg}</h3>
                                <c:remove var="msg" scope="session"/>
                            </c:if>

                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <form action="${pageContext.request.contextPath}/supplier/product-manager" method="GET">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-dark border-0" placeholder="Search name product" name="search" value="${param.search}">
                                        <div class="input-group-append">
                                            <span class="input-group-text bg-transparent text-primary" style="border: none; margin-top: 4px;">
                                                <button type="submit" class="fa fa-search" style="text-decoration: none; border: none;background: white;"></button>
                                            </span>
                                        </div>
                                    </div>
                                    <input type="hidden" name="limit" value="${param.limit}">
                                    <input type="hidden" name="page" value="${param.page}">
                                </form>
                            </div>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">
                                Add New Product
                            </button>

                            <c:if test="${param.status == 1 || param.status == null || param.status ==''}">
                                <button style="background: #22A699; text-decoration: none; border: none; height: 2.3rem; border-radius: 5px; margin-top: 25px">
                                    <a href="${pageContext.request.contextPath}/supplier/product-manager?status=0&search=${param.search}&limit=${param.limit}" style="color: white"> Hided Product</a>
                                </button>
                            </c:if>

                            <c:if test="${param.status == 0}">
                                <button style="background: #22A699; text-decoration: none; border: none; height: 2.3rem; border-radius: 5px; margin-top: 25px">
                                    <a href="${pageContext.request.contextPath}/supplier/product-manager?status=1&search=${param.search}&limit=${param.limit}" style="color: white"> Showed Product</a>
                                </button>
                            </c:if>
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
                                                <form method="get" action="${pageContext.request.contextPath}/supplier/product-manager">
                                                    <select name="limit" onchange="this.form.submit()">
                                                        <option value="5" ${param.limit == '5' ? 'selected' : ''}>5</option>
                                                        <option value="10" ${param.limit == '10' ? 'selected' : ''}>10</option>
                                                        <option value="20" ${param.limit == '20' ? 'selected' : ''}>20</option>
                                                        <option value="50" ${param.limit == '50' ? 'selected' : ''}>50</option>
                                                        <option value="" ${param.limit == null || param.limit =='' ? 'selected' : ''}>All</option>
                                                    </select>
                                                    <input type="hidden" name="search" value="${param.search}">
                                                    <input type="hidden" name="page" value="${param.page}">
                                                </form>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.products}" var="c">
                                            <tr>
                                                <td><img style="width: 80px" src="${pageContext.request.contextPath}/${c.getImage()}" alt="alt"/></td>
                                                <td><a class="name" href="productUpdate?pid=${c.getProductID()}">${c.getName()}</a></td>
                                                <td>
                                                    <c:if test="${c.getStockQuantity() != 0}">
                                                        <span class="status-green"></span>
                                                        ${c.getStockQuantity()}
                                                    </c:if>
                                                    <c:if test="${c.getStockQuantity() == 0}">
                                                        <span class="status-red"></span>
                                                        ${c.getStockQuantity()}
                                                    </c:if>
                                                </td>
                                                <td>${c.getUnitPrice()}</td>
                                                <c:if test="${c.isActive }">
                                                    <td style=" display: flex ; padding: 0.5rem 0.5rem; text-align: center; font-size: larger; transition: 0.5s; color: var(--color-dark);">
                                                        <form action="${pageContext.request.contextPath}/supplier/product-manager" method="POST">
                                                            <input type="hidden" name="id" value="${c.getProductID()}"><!-- comment -->
                                                            <input type="hidden" name="action" value="change-status"><!-- comment -->
                                                            <input type="hidden" name="status" value="show"><!-- comment -->
                                                            <button class="icon-button">
                                                                <span class="bx bxs-hide" style="padding: 1rem; color:#176B87;"></span>
                                                            </button>
                                                        </form>

                                                        <a class="bx bxs-pencil" href="productUpdate?pid=${c.getProductID()}" style="padding: 1rem 1rem; color:#176B87"></a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${!c.isActive }">
                                                    <td style=" display: flex ; padding: 0.5rem 0.5rem; text-align: center; font-size: larger; transition: 0.5s; color: var(--color-dark);">
                                                        <form action="${pageContext.request.contextPath}/supplier/product-manager" method="POST">
                                                            <input type="hidden" name="id" value="${c.getProductID()}"><!-- comment -->
                                                            <input type="hidden" name="action" value="change-status">
                                                            <input type="hidden" name="status" value="hide"><!-- comment -->
                                                            <button class="icon-button">
                                                                <span class="bx bxs-show" style="padding: 1rem; color:#176B87;"></span>
                                                            </button>
                                                        </form>

                                                        <a class="bx bxs-pencil" href="productUpdate?pid=${c.getProductID()}" style="padding: 1rem 1rem; color:#176B87"></a>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                            <nav style="text-align:  center;margin-top: 25px; color: black" aria-label="Page navigation example">
                                <ul class="pagination">
                                    <c:if test="${currentPage > 1}">
                                        <li class="page-item">
                                            <a  class="page-link" href="?search=${param.search}&limit=${param.limit}&page=${currentPage - 1}">Previous</a>
                                        </li>
                                    </c:if>
                                    <c:forEach begin="1" end="${totalPages}" var="i">
                                        <li class="page-item ${param.page == i ? 'active' : ''}">
                                            <a  class="page-link" href="?search=${param.search}&limit=${param.limit}&page=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${currentPage < totalPages}">
                                        <li class="page-item">
                                            <a  class="page-link" href="?search=${param.search}&limit=${param.limit}&page=${currentPage + 1}">Next</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <a href="#"  class="btn btn-lg btn-primary btn-lg-square back-to-top "><i class="bi bi-arrow-up"></i></a>
        </div>
        <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/supplier/product-manager" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="form-label">Product Name</label>
                                    <input type="text" value="" class="form-control" name="name" id="name">
                                    <input type="hidden" value="add" class="form-control" name="action" id="action">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Product Code</label>
                                    <input type="text" value="" class="form-control" name="code" id="code">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Product Keywords</label>
                                    <input type="text" value="" class="form-control" name="keyword" id="keyword" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Product Image</label>
                                    <input type="file" value="" class="form-control" name="ipr" data-index="0" id="ipr">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Category</label>
                                    <select name="category" id="cars" class="form-control">
                                        <c:forEach items="${requestScope.cdtos}" var="c">
                                            <option value="${c.getCategoryID()}">${c.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Supplier</label>
                                    <input class="form-control" type="hidden" name="supplier" id="supplier" readonly="" value="${supplier.supplierID}">
                                    <input class="form-control" type="text" readonly=""  value="${supplier.getCompanyName()}">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Quantity available</label>
                                    <input type="text" value="" class="form-control" name="stock" id="stock">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Unit Price</label>
                                    <input type="text" value="" class="form-control" name="price" id="price">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Unit On Orders</label>
                                    <input type="text" value="" class="form-control" name="unitOnOrders" id="unitOnOrders">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Short description</label>
                                    <input type="text" value="" class="form-control" name="shortDes" id="shortDes">
                                </div>
                                <div class="col-md-12">
                                    <label class="form-label">Description</label>
                                    <textarea id="description" name="descrip" rows="4" cols="50" class="form-control"></textarea>
                                    <script>
                                        CKEDITOR.replace('descrip');
                                    </script>
                                </div>
                                <div class="col-md-12">
                                    <div id="inputContainer"></div>
                                    <button type="button" class="btn btn-primary" style="margin-top: 30px" onclick="addImageInput()">More Image</button>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Add Product</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%@ include file="footer.jsp" %>
    </div>

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
</body>
