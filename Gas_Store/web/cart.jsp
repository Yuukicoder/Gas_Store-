

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Cart</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />

        <script>
            function updateQuantity(input) {
                var quantity = parseInt(input.value);
                if (quantity < 0) {
                    input.value = 0;
                }
                // so khong duoc am
                if (quantity >= 0 && quantity !== parseInt(input.getAttribute('data-original-value'))) {
                    input.setAttribute('data-original-value', quantity);
                    input.form.submit(); // Gửi yêu cầu form submit
                }
            }
        </script>


    </head>
    <body>
        <%@include file="common/navBarCommon.jsp" %>

        <!-- Product section-->
        <section class="py-5">
            <div class="container" style="min-height: 1000px">
                <c:choose>
                    <c:when test="${sessionScope.carts==null||sessionScope.carts.size()==0}">
                        <h1>List Cart is Empty</h1>
                    </c:when>
                    <c:otherwise>
                        <h3>List Products</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${carts}" var="C">
                                <form action="updatequantity">
                                    <tr>
                                    <input type="hidden" name="productId" value="${C.value.product.id}"/>
                                    <th scope="row">${C.value.product.id}</th>
                                    <td>${C.value.product.name}</td>
                                    <td><img src="${C.value.product.imageUrl}" width="100"/></td>
                                    <td class="num" >${C.value.product.price}</td>
                                    <td>
                                        <%-- kiem tra so luong co du khong va gioi han so luong nhap --%>
                                        <c:set var="quantity" value="${C.value.quantity}"/>
                                        <%-- kiem tra so luong co du khong va gioi han so luong nhap --%>
                                        <c:choose>
                                            <%-- neu so luong san pham trong kho nho hon so luong nhap --%>
                                            <c:when test="${C.value.product.quantityP < C.value.quantity}">
                                                <%-- reset ve 0 --%>
                                                <input type="number" name="quantity" value="0" data-original-value="0" min="0" max="${C.value.product.quantityP}" onchange="updateQuantity(this)"/>
                                            </c:when>
                                            <%-- neu so luong trong kho du --%>
                                            <c:otherwise>
                                                <%-- hien thi o nhap voi gioi han so luong la so luong trong kho --%>
                                                <input type="number" name="quantity" value="${quantity}" data-original-value="${quantity}" min="0" max="${C.value.product.quantityP}" onchange="updateQuantity(this)"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td class="num" id="totalPrice${C.value.product.id}">${C.value.product.price * quantity}</td>
                                    <td><a href="deletecart?productId=${C.value.product.id}" class="btn btn-outline-danger"><i class="bi bi-trash"></i>Delete</a></td>
                                    </tr>
                                </form>
                            </c:forEach>



                            </tbody>
                        </table>
                        <h3>Total Amount:VND ${totalMoney}</h3>

                        <a href="checkout" class="btn btn-success w-25">Check out</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
        <script src="js/Money_charge.js" type="text/javascript"></script>
        <%@include file="common/footerCommon.jsp" %>
    </body>
</html>
