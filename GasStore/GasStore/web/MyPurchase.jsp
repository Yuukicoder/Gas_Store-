<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="DAO.*" %>
<%@page import="DTO.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>My purchase</title>
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
        <style>
            #special-link {
                border-bottom: 2px solid red;
            }

            .navigation {
                background-color: #FFFFFF;
                border-bottom: 1px solid #e0e0e0;
                padding: 20px;
                width: 92%;
                margin-bottom: 20px
            }

            .navigation .row .col-2.text-center {
                padding: 0 15px;
            }

            .navigation .row .col-2.text-center a.nav-link {
                color: #333;
                text-decoration: none;
                font-weight: 500;
                display: block;
                transition: color 0.3s ease;
            }

            .navigation .row .col-2.text-center.active a.nav-link {
                color: #ff4500;
            }

            .navigation .row .col-2.text-center a.nav-link:hover {
                color: #ff4500;
            }

        </style>

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
                        <a class="breadcrumb-item text-dark" href="shop">Shop</a>
                        <span class="breadcrumb-item active">My purchase</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->


        <div class="container-fluid navigation">
            <div class="row">
                <div class="col-12">
                    <div class="row">
                        <div class="col-2 text-center">
                            <a  id="special-link"  class="text-dark nav-link" href="mypurchase">All</a>
                        </div>
                        <div class="col-2 text-center active">
                            <a class="text-dark nav-link" href="topay">To Pay</a>
                        </div>
                        <div class="col-2 text-center">
                            <a class="text-dark nav-link" href="toship">To Ship</a>
                        </div>
                        <div class="col-2 text-center">
                            <a class="text-dark nav-link" href="toreceive">To Receive</a>
                        </div>
                        <div class="col-2 text-center">
                            <a class="text-dark nav-link" href="completed">Completed</a>
                        </div>
                        <div class="col-2 text-center">
                            <a class="text-dark nav-link" href="cancelled">Cancelled</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>




        <!-- Cart Start -->
        <div class="container-fluid">
            <c:set var="tt" value="0"/>
            <%--<c:forEach items="$purchase}" var="p">--%>
            <c:set var="tt" value="${tt+1}"/>
            <div class="row px-xl-5 ">
                <div class="col-12">
                    <div class="thead-dark">
                        <span>${p.orderDate}</span>
                        <c:if test="${p.status == 0}">
                            <span>|</span>
                            <span style="font-weight: bold;color: #7A9D54">Waiting for progressing</span>
                            <span>|</span>
                            <span><a href="ordertracking?orderid=${p.orderID}&acountid=${account.getCustomerID()}" style="color: #BF9742">Order tracking</a></span>
                            <span>|</span>
                            <span><a href="#" onclick="showMess(${p.orderID})" style="color: #BDCDD6">Cancel</a></span>
                        </c:if>
                        <c:if test="${p.status == 1}">
                            <span>|</span>
                            <span style="font-weight: bold;color: #7A9D54">Confirmed and packed</span>
                            <span>|</span>
                            <span><a href="ordertracking?orderid=${p.orderID}&acountid=${account.getCustomerID()}" style="color: #BF9742">Order tracking</a></span>                       
                        </c:if>
                        <c:if test="${p.status == 2}">
                            <span>|</span>
                            <span style="font-weight: bold;color: #7A9D54">Being transported</span>
                            <span>|</span>
                            <span><a href="ordertracking?orderid=${p.orderID}&acountid=${account.getCustomerID()}" style="color: #BF9742">Order tracking</a></span>

                        </c:if>
                        <c:if test="${p.status == 3}">
                            <span>|</span>
                            <span style="font-weight: bold;color: #4FC0D0">Delivered</span>
                            <span>|</span>
                            <span><a href="ordertracking?orderid=${p.orderID}&acountid=${account.getCustomerID()}" style="color: #BF9742">Order tracking</a></span>

                        </c:if>
                        <c:if test="${p.status == 4}">
                            <span>|</span>
                            <span style="font-weight: bold;color: red">Canceled</span>
                            <span>|</span>
                            <span><a href="ordertracking?orderid=${p.orderID}&acountid=${account.getCustomerID()}" style="color: #BF9742">Order tracking</a></span>                      
                        </c:if>

                    </div>
                    <hr><!-- comment -->
                    <table class="table table-light table-borderless table-hover text-center mb-0">
                        <tbody class="align-middle">
                            <c:forEach var="k" items="${odDAO}">
                                <tr>
                                    <td class="align-middle">${k.getOrderDate()} ------------------------------------------------------------------------------------------</td>

                                    <c:forEach var="oi" items="${odDetails}">
                                        <c:if test="${k.getOrderID() == oi.getOrderID()}">
                                        <tr>
                                            <td>
                                                <img src="${oi.getProduct().getImage()}" alt="alt" style="width: 20%;"/>
                                            </td>
                                            <td>
                                                ${oi.getProduct().getName()}
                                            </td>
                                            <td>
                                                ${serialDAO.getSerialById(oi.getSerialID()).getSerialNumber()}
                                            </td>
                                            <td>
                                                ${oi.getUnitPrice()}
                                            </td>
                                            <td>
                                                ${oi.getQuantity()}
                                            </td>
                                            <td>
                                                ${oi.getQuantity() * oi.getUnitPrice()}
                                            </td>
                                            <td>
                                                <a href="warrantyServlet?serialId=${oi.getSerialID()}&pid=${oi.getProduct().getProductID()}&oi=${oi.getOrderID()}">Bảo hành</a>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            <td class="align-middle">Total: ${k.getTotalPrice()}</td>
                            </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                    <!--                        <div class="right-side" style="margin-right: 5.5rem;
                                                 margin-top: 1rem; text-align: right;">
                                                <span style="margin-right: 1rem">
                                                    <button class="btn btn-link btn-detail" data-toggle="modal" data-target="#orderModal${tt}" style="background: black;
                                                            border-radius: 10px;"> Feedback</button>
                                                </span>
                                                    <span style="font-weight: bold">Total: $p.totalPrice</span>
                                            </div>-->
                </div>

            </div>
            <%--</c:forEach>--%>
        </div>



        <c:set var="i" value="0"/>
        <c:forEach items="${purchase}" var="p">
            <c:set var="i" value="${i+1}"/>
            <div class="modal fade" id="orderModal${i}" tabindex="-1" role="dialog" aria-labelledby="orderModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="orderModalLabel">Order Detail</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <table class="table table-light table-borderless table-hover text-center mb-0">
                                <tr>
                                    <th>Product Name</th>
                                    <th>Quantity</th>
                                    <th >Price</th>
                                    <th >Action</th>
                                </tr>
                                <c:forEach var="k" items="${odDAO.getOrderDetailByID(p.getOrderID())}">
                                    <tr>

                                        <td>${pDAO.getProductByID(k.getProduct_id()).getName()}</td>
                                        <td>${k.getQuantity()}</td>
                                        <td>${(pDAO.getProductByID(k.getProduct_id()).getPrice()*k.getQuantity())}$</td>
                                        <c:if test="${p.status == 3 && fdao.checkfeedback(p.getOrderID(),k.getProduct_id()).isEmpty()}">
                                            <td><a href="feedback?productid=${k.getProduct_id()}&orderid=${p.getOrderID()}"> Feedback</a></td>
                                        </c:if>

                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach> 
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
        <script>
                                    // Xử lý sự kiện khi nhấp vào nút "Detail"
                                    var btnDetails = document.getElementsByClassName("btn-detail");
                                    var modalBody = document.querySelector("#orderModal .modal-body");

                                    for (var i = 0; i < btnDetails.length; i++) {
                                        btnDetails[i].addEventListener("click", function () {
                                            // Lấy thông tin chi tiết đơn hàng
                                            var orderDetail = /* Lấy thông tin chi tiết đơn hàng tương ứng với nút nhấp */;
                                                    // Hiển thị thông tin chi tiết đơn hàng trong modal
                                                    modalBody.innerHTML = orderDetail;
                                        });
                                    }
        </script>
        <script>
            function showMess(id) {
                var option = confirm('Are you sure to cancel order?');
                if (option === true) {
                    window.location.href = 'cancelO?oid=' + id;
                }
            }
        </script>
    </body>

</html>