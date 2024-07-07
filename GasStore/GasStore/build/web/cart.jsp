<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>LaptopShop</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
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
    </head>

    <body>
        <%@include file="component/topbar.jsp" %>
        <%@include file="component/navbar.jsp" %>


        <!-- Breadcrumb Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-12">
                    <nav class="breadcrumb bg-light mb-30">
                        <a class="breadcrumb-item text-dark" href="home">Home</a>
                        <a class="breadcrumb-item text-dark" href="#">Shop</a>
                        <span class="breadcrumb-item active">Shopping Cart</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->


        <!-- Cart Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-lg-8 table-responsive mb-5">
                    <table class="table table-light table-borderless table-hover text-center mb-0">
                        <thead class="thead-dark">
                            <tr>
                                <th>No</th>
                                <th>Name</th>
<!--                                <th>Image</th>-->
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody class="align-middle">
                            <c:set var="o" value="${requestScope.cart}"/>
                            <c:set var="tt" value="0"/>
                            <c:forEach items="${o.items}" var="i">
                                <c:set var="tt" value="${tt+1}"/>
                                <tr>
                                    <td class="align-middle">${tt}</td>
                                    <td class="align-middle">${i.product.name}</td>
                                    <!--<td class="align-middle"><img class="img-fluid" src="images/Product/${i.product.image}" alt="Image"></td>--> 
                                    <td class="align-middle">
    <fmt:formatNumber value="${i.product.unitPrice}" type="currency" currencySymbol="VND" />
</td>


                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <div class="input-group-btn">
                                                <a href="process?num=-1&id=${i.product.productID}"><i class="fa fa-minus"></i></a>
                                            </div>

                                            <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" value="${i.quantity}">
                                            <div class="input-group-btn">
                                                <a href="process?num=1&id=${i.product.productID}"><i class="fa fa-plus"></i></a>
                                            </div>

                                        </div>
                                    </td>

                                    <td class="align-middle">
    <fmt:formatNumber value="${i.product.unitPrice * i.quantity}" type="currency" currencySymbol="VND" />
</td>


                                    <td class="align-middle">
                                        <form action="process" method="post">
                                            <input type="hidden" name="id" value="${i.product.productID}"/>
                                            <!--<input type="submit" value="Return item"/>-->   
                                            <button class="btn btn-sm btn-danger"><i class="fa fa-times"></i></button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>


                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4">
                    <form class="mb-30" action="listVoucherCart" method="get">

                        <div class="input-group">
                            <input hidden name="date" value="<%
                                           Date dNow = new Date();
                                           SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
                                           String formattedDate = ft.format(dNow);
                                           out.println(formattedDate);
                                   %>"/>
                            <input type="text" name="vouchercode" class="form-control border-0 p-4" placeholder="Coupon Code">
                            <div class="input-group-append">
                                <button class="btn btn-primary">Apply Coupon</button>
                            </div>

                        </div>
                        <h6 style="margin-top: 10px ;color: red" >${requestScope.used}</h6>
                    </form>
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Cart Summary</span></h5>
                    <div class="bg-light p-30 mb-5">
                        <div class="border-bottom pb-2">
                            <div class="d-flex justify-content-between mb-3">
                                <h6>Subtotal</h6>
                                <h6><fmt:formatNumber value="${o.totalMoney}" type="currency" currencySymbol="VND" /></h6>

                            </div>
                            <div class="d-flex justify-content-between mb-3">
                                <h6>Voucher</h6>

                                <c:forEach var="c" items="${requestScope.used1}">
                                    <c:set var="discountValue" value="${c.discount}" />
                                    <c:set var="nameValue" value="${c.voucherCode}" />
                                    <c:set var="vourcherIDValue" value="${c.vourcherID}" />
                                    <c:set var="vourcherQuantity" value="${c.quantity}" />

                                </c:forEach>
                                <h6>${discountValue != null ? discountValue : 0}%</h6>

                            </div>
                           <div class="d-flex justify-content-between mb-3">
                                <h6>Ship</h6>
                                <h6><fmt:formatNumber value="10000" type="currency" currencySymbol="VND" /></h6>

                            </div>
                        </div>
                        <div class="pt-2">

                            <div class="d-flex justify-content-between mt-2">
                                <h5>Total</h5>
                               <c:if test="${discountValue != null}">
                                    <h5><fmt:formatNumber value="${(o.totalMoney - ((o.totalMoney * discountValue) / 100) + 10)}" type="currency" currencySymbol="VND" /></h5>
                                </c:if>
                                <c:if test="${discountValue == null}">
                                    <h5><fmt:formatNumber value="${(o.totalMoney + 10000)}" type="currency" currencySymbol="VND" /></h5>
                                </c:if>

                            </div>

                            <form action="lastcheck">
                                <input name="vocherid" type="hidden" value="${discountValue != null ? discountValue : 0}" />                                
                                <input name="vochername" type="hidden" value="${nameValue != null ? nameValue : 0}" />                                
                                <input name="vourcherID" type="hidden" value="${vourcherIDValue != null ? vourcherIDValue : 0}" />                                
                                <input name="vourcherQuantity" type="hidden" value="${vourcherQuantity - 1 }" />                                


                                <button class="btn btn-block btn-primary font-weight-bold my-3 py-3">Proceed To Checkout</button>
                            </form>


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart End -->
        <%@include file="component/footer.jsp" %>
        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
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