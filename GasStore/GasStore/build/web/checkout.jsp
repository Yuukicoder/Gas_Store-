<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <span class="breadcrumb-item active">Checkout</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

       <form action="lastcheck" method="POST" onsubmit="return validateForm()">   
            <!-- Checkout Start -->
            <div class="container-fluid">
                <div class="row px-xl-5">
                    <div class="col-lg-8">
                        <form action="lastcheck" method="POST" onsubmit="return validateForm()">
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Billing Address</span></h5>
                        <div class="bg-light p-30 mb-5">
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label>Name</label>
                                    <input class="form-control" id="name" type="text" placeholder="Enter your name..." name="nameacount">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>E-mail</label>
                                    <input class="form-control"id="email" type="text" placeholder="example@email.com">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Phone number</label>
                                    <input class="form-control"id="phoneNumber" type="number" placeholder="Enter your phone number.." name="phone">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Address</label>
                                    <input class="form-control" id="address" type="text" placeholder="Enter your address..." name="address">
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Order Total</span></h5>
                        <div class="bg-light p-30 mb-5">
                            <div class="border-bottom">
                                <h6 class="mb-3">Products</h6>
                                <c:set var="o" value="${requestScope.cart}"/>
                                <c:forEach items="${o.items}" var="i">
                                    <div class="d-flex justify-content-between">
                                        <p>${i.product.name}</p>
                                        <p>${i.quantity}</p>
                                        <p>${(i.product.price)*(i.quantity)}</p>
                                    </div>
                                </c:forEach>

                            </div>
                            <div class="border-bottom pt-3 pb-2">
                                <div class="d-flex justify-content-between mb-3">
                                    <h6>Subtotal</h6>
                                    <h6>$${o.totalMoney}</h6>
                                </div>
                                <div class="d-flex justify-content-between mb-3">
                                    <h6>Voucher</h6>               
                                    <h6>${requestScope.vocherid}%</h6>

                                </div>
                                <div class="d-flex justify-content-between mb-3">
                                    <h6>Ship</h6>
                                    <h6>10.0</h6>
                                </div>    


                            </div>
                            <div class="pt-2">
                                <div class="d-flex justify-content-between mt-2">
                                    <h5>Total</h5>
                                    <c:if test="${requestScope.vocherid != 0}" >
                                        <c:set value="${((o.totalMoney)*requestScope.vocherid)/100}" var="tongtienvoucher" />
                                        <h5>$${o.totalMoney-(((o.totalMoney)*requestScope.vocherid)/100)+10}</h5>
                                    </c:if>
                                    <c:if test="${requestScope.vocherid == 0}" >
                                        <h5>$${(o.totalMoney)+10}</h5>
                                        <c:set value="0" var="tongtienvoucher" />
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="mb-5">
                            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Payment</span></h5>
                            <div class="bg-light p-30">
                                <!--                            <div class="form-group">
                                                                <div class="custom-control custom-radio">
                                                                    <input type="radio" class="custom-control-input" name="payment" id="paypal">
                                                                    <label class="custom-control-label" for="paypal">Paypal</label>
                                                                </div>
                                                            </div>-->
                                <div class="form-group">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="payment" id="directcheck">
                                        <label class="custom-control-label" for="directcheck">Direct Check</label>
                                    </div>
                                </div>
                                <!--                            <div class="form-group mb-4">
                                                                <div class="custom-control custom-radio">
                                                                    <input type="radio" class="custom-control-input" name="payment" id="banktransfer">
                                                                    <label class="custom-control-label" for="banktransfer">Bank Transfer</label>
                                                                </div>
                                                            </div>-->

                                <input name="vocherid" type="hidden" value="${requestScope.vocherid != null ? requestScope.vocherid : 0}" />                                
                                <input name="vochername" type="hidden" value="${requestScope.vochername != null ? requestScope.vochername : 0}" />                                
                                <input name="vourcherID" type="hidden" value="${requestScope.vocheridname != null ? requestScope.vocheridname : 0}" />                                
                                <input name="vourcherQuantity" type="hidden" value="${requestScope.vourcherQuantity}" />                                
                                <input name="tongtienvoucher" type="hidden" value="${tongtienvoucher}" />                                

                                <c:if test="${requestScope.vocherid != 0}" >

                                    <input name="totalvoucher" type="hidden" value="${requestScope.vocherid / 100}" />                                

                                </c:if>
                                <c:if test="${requestScope.vocherid == 0}" >

                                    <input name="totalvoucher" type="hidden" value="0" />                                

                                </c:if>

                                <c:if test="${requestScope.vocherid != 0}" >

                                    <input name="totalvoucher" type="hidden" value="${requestScope.vocherid / 100}" />                                

                                </c:if>
                                <c:if test="${requestScope.vocherid == 0}" >

                                    <input name="totalvoucher" type="hidden" value="0" />                                

                                </c:if>

                              
                            <div style="margin-top: 15px;color: red" id="error-messages"></div>
                            <input type="submit" id="placeOrderButton" class="btn btn-block btn-primary font-weight-bold py-3" value="Place Order">
                         
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- Checkout End -->
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
                        function validateForm() {
                            var name = document.getElementById("name").value;
                            var email = document.getElementById("email").value;
                            var phoneNumber = document.getElementById("phoneNumber").value;
                            var address = document.getElementById("address").value;

                            var errorDiv = document.getElementById("error-messages");
                            errorDiv.innerHTML = ""; // Xóa các thông báo l?i tr??c ?ó (n?u có)

                            if (name.trim() === "") {
                                showError("Name is required");
                                return false;
                            }

                            if (email.trim() === "") {
                                showError("Email is required");
                                return false;
                            }

                            // Ki?m tra ??nh d?ng email h?p l?
                            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                            if (!email.match(emailRegex)) {
                                showError("Invalid email format: username@domain");
                                return false;
                            }

                            if (phoneNumber.trim() === "") {
                                showError("Phone number is required");
                                return false;
                            }

                            if (address.trim() === "") {
                                showError("Address is required");
                                return false;
                            }

                            // N?u không có l?i, có th? ti?p t?c x? lý form và g?i yêu c?u POST
                            showSuccess("Order placed successfully!");
                            return true;
                        }
                        
                        function showError(errorMessage) {
                            window.alert("Error: " + errorMessage);
                        }
                        
                        function showSuccess(successMessage) {
                            window.alert(successMessage);
                        }
        </script>
    </body>

</html>