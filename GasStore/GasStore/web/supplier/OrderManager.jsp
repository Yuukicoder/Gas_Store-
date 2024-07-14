<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<style>
    .active {
        background-color: yellow;
        color: #ffffff;
    }

    .icon-button {
        background: none;
        border: none;
        padding: 0;
        cursor: pointer;
    }

    .filter-container {
        display: flex;
        flex-wrap: wrap;
        gap: 1rem;
        background-color: #f8f9fa;
        padding: 1rem;
        border-radius: 0.5rem;
        margin-bottom: 1rem;
    }

    .filter-container div {
        flex: 1;
        min-width: 150px;
    }

    .filter-container label {
        display: block;
        font-weight: bold;
        margin-bottom: 0.5rem;
    }

    .filter-container input,
    .filter-container select {
        width: 100%;
        padding: 0.5rem;
        border: 1px solid #ced4da;
        border-radius: 0.25rem;
        background-color: #ffffff;
    }

    .filter-container button {
        background-color: #007bff;
        color: #ffffff;
        padding: 0.5rem 1rem;
        border: none;
        border-radius: 0.25rem;
        cursor: pointer;
    }

    .filter-container button:hover {
        background-color: #0056b3;
    }

    .dropdown-container {
        display: flex;
        justify-content: flex-end;
        margin-bottom: 1rem;
    }

    .dropdown-container select {
        padding: 0.5rem;
        border: 1px solid #ced4da;
        border-radius: 0.25rem;
        background-color: #ffffff;
        margin-left: 0.5rem;
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
                            <div class="table-responsive">
                                <form method="get" action="${pageContext.request.contextPath}/supplier/order-manager" class="filter-container">
                                    <div>
                                        <label for="startDate">Start Date:</label>
                                        <input type="date" id="startDate" name="startDate" value="${param.startDate}">
                                    </div>
                                    <div>
                                        <label for="endDate">End Date:</label>
                                        <input type="date" id="endDate" name="endDate" value="${param.endDate}">
                                    </div>
                                    <div>
                                        <label for="minAmount">Min Amount:</label>
                                        <input type="number" id="minAmount" name="minAmount" step="0.01" value="${param.minAmount}">
                                    </div>
                                    <div>
                                        <label for="maxAmount">Max Amount:</label>
                                        <input type="number" id="maxAmount" name="maxAmount" step="0.01" value="${param.maxAmount}">
                                    </div>
                                    <div>
                                        <label for="status">Status:</label>
                                        <select id="status" name="status">
                                            <option value="">All</option>
                                            <option value="1" ${param.status == '1' ? 'selected' : ''}>Đang chuẩn bị hàng</option>
                                            <option value="2" ${param.status == '2' ? 'selected' : ''}>Đang giao hàng</option>
                                            <option value="3" ${param.status == '3' ? 'selected' : ''}>Giao hàng thành công</option>
                                        </select>
                                    </div>
                                    <div>
                                        <button type="submit">Filter</button>
                                    </div>
                                </form>
                                <div class="dropdown-container">
                                    <form method="get" action="${pageContext.request.contextPath}/supplier/order-manager">
                                        <select name="limit" onchange="this.form.submit()">
                                            <option value="5" ${param.limit == '5' ? 'selected' : ''}>5</option>
                                            <option value="10" ${param.limit == '10' ? 'selected' : ''}>10</option>
                                            <option value="20" ${param.limit == '20' ? 'selected' : ''}>20</option>
                                            <option value="50" ${param.limit == '50' ? 'selected' : ''}>50</option>
                                            <option value="" ${param.limit == null || param.limit == '' ? 'selected' : ''}>All</option>
                                        </select>
                                        <input type="hidden" name="startDate" value="${param.startDate}">
                                        <input type="hidden" name="endDate" value="${param.endDate}">
                                        <input type="hidden" name="minAmount" value="${param.minAmount}">
                                        <input type="hidden" name="maxAmount" value="${param.maxAmount}">
                                        <input type="hidden" name="status" value="${param.status}">
                                        <input type="hidden" name="search" value="${param.search}">
                                        <input type="hidden" name="page" value="${param.page}">
                                    </form>
                                </div>
                                <table id="productTable" class="table text-start align-middle table-bordered table-hover mb-0">
                                    <thead>
                                        <tr class="text-white">
                                            <th scope="col"></th>
                                            <th scope="col">Product</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Customer</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="totalAmount" value="0" />
                                        <c:forEach items="${requestScope.orders}" var="c" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>
                                                    <c:forEach items="${c.orderDetails}" var="od">
                                                        ${od.product.name}
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <c:forEach items="${c.orderDetails}" var="od">
                                                        <img src="${pageContext.request.contextPath}/${od.product.image}" width="50" alt="alt"/> <br>
                                                    </c:forEach>
                                                </td>
                                                <td>${c.customer.userName}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${c.status == 1}">
                                                            <span style="color: #E57C23;">Đang chuẩn bị hàng</span>
                                                        </c:when>
                                                        <c:when test="${c.status == 2}">
                                                            Đang giao hàng
                                                        </c:when>
                                                        <c:when test="${c.status == 3}">
                                                            <span style="color: #009981;">Giao hàng thành công</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            Unknown Status
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${c.orderDate}</td>
                                                <td>${c.totalMoney}</td>
                                                <c:set var="totalAmount" value="${totalAmount + c.totalMoney}" />
                                                <fmt:formatNumber value="${totalAmount}" type="number" maxFractionDigits="2" minFractionDigits="2" var="formattedTotalAmount" />
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="text-end mt-3">
                                    <h5 style="color: red">Total Amount: ${totalAmount}</h5>
                                </div>
                            </div>
                            <nav style="text-align: center; margin-top: 25px; color: black" aria-label="Page navigation example">
                                <ul class="pagination">
                                    <c:if test="${currentPage > 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="?limit=${param.limit}&page=${currentPage - 1}">Previous</a>
                                        </li>
                                    </c:if>
                                    <c:forEach begin="1" end="${totalPages}" var="i">
                                        <li class="page-item ${param.page == i ? 'active' : ''}">
                                            <a class="page-link" href="?limit=${param.limit}&page=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${currentPage < totalPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="?limit=${param.limit}&page=${currentPage + 1}">Next</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
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
                alert("Unit Price must be a number greater than 0!");
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
