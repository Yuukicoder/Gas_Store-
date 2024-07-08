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
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

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
            .cancel-link {
                display: inline-block;
                padding: 6px 12px;
                color: #BDCDD6;
                text-decoration: none;
                background-color: transparent;
                border: 1px solid #BDCDD6;
                border-radius: 4px;
                transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
            }

            .cancel-link:hover {
                background-color: #BDCDD6;
                color: white;
                border-color: #BDCDD6;
            }

            .cancel-link:focus {
                outline: none;
            }

            .cancel-link:active {
                background-color: #9FB3C8;
                border-color: #9FB3C8;
                color: white;
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
                        <a class="breadcrumb-item text-dark" href="mypurchase">My purchase</a>
                        <span class="breadcrumb-item active">Order Tracking</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <div class="container-fluid navigation">
            <div class="row shop-tracking-status">
                <div class="col-md-12">
                    <div class="well">
                        <h4 style="font-size: 25px;">Order Tracking</h4>

                        <div style="display: inline-block; vertical-align: top; width: 20%; margin: 20px;">
                            <ul class="list-group">
                                <h5 style="font-size: 25px;"> Address</h5>
                                <h6 class="mt-1 mb-2" style="color: grey; font-size: 25px;"><i class='bx bx-user'></i> ${sessionScope.account.getUserName()}</h6>
                                <p class="mb-1 mt-1" style="color: grey; font-size: 25px;"><i class='bx bx-phone'></i> ${sessionScope.account.getPhone()}</p>
                                <p class="mt-1" style="color: grey; font-size: 25px;"><i class='bx bx-user'></i> ${sessionScope.account.getAddress()}</p>
                            </ul>
                        </div>
                        <c:if test="${ordao.status != 4}">
                            <div class="order-status">
                                <div class="order-status-timeline">
                                    <!--class names: c0 c1 c2 c3 and c4--> 


                                    <c:if test="${ordao.status == 0}">
                                        <div class="order-status-timeline-completion c0"></div>   
                                    </c:if>
                                    <c:if test="${ordao.status == 1}">
                                        <div class="order-status-timeline-completion c1"></div>   
                                    </c:if>
                                    <c:if test="${ordao.status == 2}">
                                        <div class="order-status-timeline-completion c2"></div>   
                                    </c:if>
                                    <c:if test="${ordao.status == 3}">
                                        <div class="order-status-timeline-completion c4"></div>   
                                    </c:if>

                                </div>

                                <div class="image-order-status image-order-status-new active img-circle">
                                    <span class="status">Accepted</span>
                                    <div class="icon"></div>
                                </div>
                                <div class="image-order-status image-order-status-active active img-circle">
                                    <span class="status">Packed</span>
                                    <div class="icon"></div>
                                </div>
                                <div class="image-order-status image-order-status-intransit active img-circle">
                                    <span class="status">Shipped</span>
                                    <div class="icon"></div>
                                </div>
                                <div class="image-order-status image-order-status-delivered active img-circle">
                                    <span class="status">Delivered</span>
                                    <div class="icon"></div>
                                </div>
                                <div class="image-order-status image-order-status-completed active img-circle">
                                    <span class="status">Completed</span>
                                    <div class="icon"></div>
                                </div>

                            </div>
                            <span>
                                <a href="#" onclick="cancelOrder(${ordao.orderID})" class="cancel-link">Cancel</a>
                            </span>
                        </c:if>

                    </div>


                </div>
            </div>
        </div>

        <!-- Cart Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-12">
                    <h4 class="thead-dark">Your <c:if test="${ordao.status == 4}"> Previous </c:if>order</h4>
                        <table class="table table-light table-borderless table-hover text-center mb-0">
                            <tbody class="align-middle">
                            <c:set var="totalAmount" value="0.0" />
                            <c:forEach var="k" items="${odDAO}">
                                <tr>
                                    <td class="align-middle">
                                        <img style="width: 80px" class="img-fluid" src="${pDAO.getProductByID(k.productID).getImage()}" alt="Image"></td>

                                    <td class="align-middle">${pDAO.getProductByID(k.productID).name}</td>
                                    <td class="align-middle">x ${k.getQuantity()}</td>
                                    <td class="align-middle">${pDAO.getProductByID(k.productID).unitPrice}₫</td> 
                                </tr>
                                <c:set var="totalAmount" value="${totalAmount + (pDAO.getProductByID(k.productID).unitPrice * k.quantity)}" />
                            </c:forEach>
                        </tbody>
                    </table>
                    <div>
                        <table class="table table-bordered custom-table">
                            <tbody>
                                <tr>
                                    <td class="align-right" colspan="100"> Total Order Amount </td>
                                    <td class="small-text align-right" colspan="1">${totalAmount}₫</td>
                                </tr>
                                <tr>
                                    <td class="align-right" colspan="100">Shipping Fee</td>
                                    <td class="small-text align-right" colspan="1">100.000₫</td>
                                </tr>
                                <tr>
                                    <td class="align-right" colspan="100">Shopee Voucher Applied</td>
                                    <td class="small-text align-right" colspan="1">
                                        0 ₫

                                </tr>
                                <tr>
                                    <td class="align-right" colspan="100">Order Total</td>
                                    <td style="color: red; font-size: 25px" class="small-text align-right" colspan="1">${ordao.totalMoney} $</td>
                                </tr>
                            </tbody>
                        </table>
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
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>

        <style>
            .custom-table {
                background-color: white; /* Nền màu trắng */


            }
            table {
                width: 400px; /* Độ rộng của bảng */
                border-collapse: collapse; /* Loại bỏ khoảng cách giữa các ô */
                margin: 20px auto; /* Canh giữa bảng */
            }

            td, th {
                padding: 10px; /* Khoảng cách giữa nội dung và viền của ô */
                border: 1px solid #000; /* Độ dày và màu sắc viền của ô */
                font-size: 18px; /* Cỡ chữ trong ô */
                font-family: Arial, sans-serif; /* Phông chữ */
            }

            /* Canh nội dung của ô về bên phải */
            .align-right {
                text-align: right;
            }

            /* Đặt cỡ chữ nhỏ cho các ô có class "small-text" */
            .small-text {
                font-size: 14px;
            }


            .shop-tracking-status .form-horizontal{
                margin-bottom:50px
            }
            .shop-tracking-status .order-status{
                margin-top:150px;
                position:relative;
                margin-bottom:150px
            }
            .shop-tracking-status .order-status-timeline{
                height:12px;
                border:1px solid #aaa;
                border-radius:7px;
                background:#eee;
                box-shadow:0px 0px 5px 0px #C2C2C2 inset
            }
            .shop-tracking-status .order-status-timeline .order-status-timeline-completion{
                height:8px;
                margin:1px;
                border-radius:7px;
                background:#cf7400;
                width:0px
            }
            .shop-tracking-status .order-status-timeline .order-status-timeline-completion.c1{
                width:22%
            }
            .shop-tracking-status .order-status-timeline .order-status-timeline-completion.c2{
                width:46%
            }
            .shop-tracking-status .order-status-timeline .order-status-timeline-completion.c3{
                width:70%
            }
            .shop-tracking-status .order-status-timeline .order-status-timeline-completion.c4{
                width:100%
            }
            .shop-tracking-status .image-order-status{
                border:1px solid #ddd;
                padding:7px;
                box-shadow:0px 0px 10px 0px #999;
                background-color:#fdfdfd;
                position:absolute;
                margin-top:-35px
            }
            .shop-tracking-status .image-order-status.disabled{
                filter:url("data:image/svg+xml;utf8,<svg%20xmlns='http://www.w3.org/2000/svg'><filter%20id='grayscale'><feColorMatrix%20type='matrix'%20values='0.3333%200.3333%200.3333%200%200%200.3333%200.3333%200.3333%200%200%200.3333%200.3333%200.3333%200%200%200%200%200%201%200'/></filter></svg>#grayscale");
                filter:grayscale(100%);
                -webkit-filter:grayscale(100%);
                -moz-filter:grayscale(100%);
                -ms-filter:grayscale(100%);
                -o-filter:grayscale(100%);
                filter:gray;
            }
            .shop-tracking-status .image-order-status.active{
                box-shadow:0px 0px 10px 0px #cf7400
            }
            .shop-tracking-status .image-order-status.active .status{
                color:#cf7400;
                text-shadow:0px 0px 1px #777
            }
            .shop-tracking-status .image-order-status .icon{
                height:40px;
                width:40px;
                background-size:contain;
                background-position:no-repeat
            }
            .shop-tracking-status .image-order-status .status{
                position:absolute;
                text-shadow:1px 1px #eee;
                color:#333;
                width: 180px;
                top: -50px;
                left: -12px;
            }
            .shop-tracking-status .image-order-status .status:before{
                font-family:FontAwesome;
                content:"\f053";
                padding-right:5px
            }
            .shop-tracking-status .image-order-status-new{
                left:0
            }
            .shop-tracking-status .image-order-status-new .icon{
                background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABHNCSVQICAgIfAhkiAAAA+JJREFUWIXtll+I1FUUxz/n3vv7/WZmZ/+OphuWlliQZn8f2igxyCSIRMgeFNrUDVlUCIoeit4KeujN1CxZN5HAkiCo6CUq0NRU1KUgoqhlFcvd1f0z7Tgzv9+9PfyG2dl1Vpsa8KH9wuHec+/9nfu9557fORdmMYv/O+Rak70vpJcaP3gzDPNrnLg8DjvlS4cCgupGBS1yxFl56bn3xo7XRGDflqYlfpA6qJS+c/mja1LNbe1EUYggGD8A5aNMAtEBykyK6ATKC1A6ILTO/fB1j/Sf+ugvG3HRin2lc1f20HUJ7O9qvk0S/ollKzpb5y26Q40MnHVnD38mTgDncFEeowSjwdOC0YKnwUzrJ5ItZB57w104vteFg6fVz+dGc0XLto3vjvdU7qcrlQNdyQUkk8fvXd3dtviB1Xr8Qh+nv/lYCoUr2CjE2ggloERQCrQSlBK0AjWtLy5P4fJPclPHi5L/4xStidAbHsuvevpBM/DpyWLfVR54v6thXjKVPLls5ab29iUd2o39ihc0UIwmnWSdBWtBGUR7sahYKLWiDYguG042z6eQG6evdy2iNL9dGJtw1m7q3JM9WCbQszE9N2hMHWtbsHShOHJDA33pR555jea5t5IbOTd5X6JANIiKBQ1K4g1FynMSBygAQUOGyMGXO9bjbCGXDPxENpcPcazv3JM9JHs3N7UZY4cB/CB1Pizmv7v9vifX3bN6G9HIL+AszllwLrbqXKyX+v9kzM/cRXbkIl998PJFXHgmsvYJALFsVcZEbwOgZM2VYn5F0Jh5avmqrUSjv2OLE9hiDhdeKYsNp+nF3HXH8n+epXHOIu5euaFFtB62Si8WOOoUO6f8BQe2zzn8+ObdD6czC6+ZH/4Lvt2/PTd0/seNnbsqYgBgX3fTQ2LtUaV1UUR5ojTORjWYdjPOiMS2HC5voygAeH5PVqYQcCAfdje3ABRtdKlj7asMHOupbrFG3Hz/Or7/fAee0m0AnvjFZ3cNZgFMmSU4do9eBujdkiaRSpNMpetCIEg2ArChZL8S5qrVJSht8JMNdSGgjTfj3IwEtPHwE/XxgDZ+7QSM9ggS9fGA+fceuJEEPI+gTjFg/PIV+EDhWgQCoBXiimf8FLhackEViEKpctG9BRgDLgFRNQLNQMYpb3C4/8zczMKO0nBFknGVCceVdVd1TdwO9fdhxRsC5pf2jEokphDQJd374vTEW9idrwthS43nrQqHGfnkxMQ7QALwqHiHTM/5rUCm1AbEd1YPFAAFZIlPfh4oViMAkARaSpvPGKQ1IiS+j1FgHCYft9erevWqijNXqlncaPwNorOPpsGntkIAAAAASUVORK5CYII=);
            }
            .shop-tracking-status .image-order-status-active{
                left:22%
            }
            .shop-tracking-status .image-order-status-active .icon{
                background-image: url(data:image/png;base64,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);
            }
            .shop-tracking-status .image-order-status-intransit{
                left:45%
            }
            .shop-tracking-status .image-order-status-intransit .icon{
                background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA9dpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wUmlnaHRzPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvcmlnaHRzLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcFJpZ2h0czpNYXJrZWQ9IkZhbHNlIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDpjMmY4Njc2Mi02MmNkLTExZGYtOGJjNS1hMWFiNzQ2MTIxODIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODI0OTQ1MTJFRTdCMTFERkFGNjZCMDk0NkMyREY1QUQiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODI0OTQ1MTFFRTdCMTFERkFGNjZCMDk0NkMyREY1QUQiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBXaW5kb3dzIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RDAxODVEODIxQUJEREYx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);
            }
            .shop-tracking-status .image-order-status-delivered{
                left:70%
            }
            .shop-tracking-status .image-order-status-delivered .icon{
                background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDowMTgwMTE3NDA3MjA2ODExOEY2MkQyNTFFNDI0N0U3NSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo3QzFCN0QwOUE1QUIxMUUwQjY1QUI1MUU1QzI1OUYyNCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo3QzFCN0QwOEE1QUIxMUUwQjY1QUI1MUU1QzI1OUYyNCIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZCN0YxMTc0MDcyMDY4MTE4NzFDREEyRkNEOTI0OThCIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjAxODAxMTc0MDcyMDY4MTE4RjYyRDI1MUU0MjQ3RTc1Ii8+IDwvcmRmOkRlc2NyaXB0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);
            }
            .shop-tracking-status .image-order-status-delivered .status{
                left: -10px;
            }
            .shop-tracking-status .image-order-status-delivered .status:before{
                display:none
            }
            .shop-tracking-status .image-order-status-delivered .status:after{
                font-family:FontAwesome;
                content:"\f054";
                padding-left:5px;
                vertical-align:middle
            }
            .shop-tracking-status .image-order-status-completed{
                right:0px
            }
            .shop-tracking-status .image-order-status-completed .icon{
                background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAABulJREFUeNqcV1lsXNUZ/u4yi2ccjyfxEjuOx06sJG5CUiiygowxWFAViFHSUNKgqqAQUMsDlUjLIuAFQZ4ipL5UVQUPCKGmUaMmWDYgCBICnlDSkNhphMfLjJexPV5m7PFsd+v/n1mYcSZecq3/Xs+95/zf92/n/EfCOq/2l1DhqsFJyHjGkrA/916SCsTCNcnAh0vTeP/bv2JxPXqltb4/+Bp2KBW44LRjX8fPOtBc68P2qjpYZhqxdBSJVIQkimhyAWPhEGaiUYTmkjBN9CcjOPzVaQyTHutOCCgPv4u/ORx44Y+Pvoz2Pe1Y1MahIUKz0rAsE4ZpwDAMIgOktRTmFmcQmh1GcPYmgjMxTM4Bpo5/9L2KF0mfsRECtq7TCBzcfU/dW79+D0vwI24GMRG+hun5AcxFh5FMGsLtOS0Omw0e13ZUlO+EU63H0OQV3Bi/TnOAxThCfX+Bj0Zq6yFge+gdjD73yO/rD7cdw4J5FVML13H1x3NIaSZkOTNJKjHTyt5sqopaz0PkITuuDH+JydkUJmYx+ekraFpJYqUa28OnETzeeXTrY/c+jqQygv6R/2B0sh+KAshSaeBbiFgZMpWuFnhdv8D3/l4EOCRhTPW9gsZCEkpRzN/G3/c2Nz/wm/anYDkn8N/Bf2F85ibIIChyFnwdkquKhDYPkwK4s7aLwuBHLGGUN7Sj3v8VenMOyxGQ2k5id0UdPvjDr55HuVfHQOACxsP/y1u+kcsqKNGUFqV/UmjY3IZIfJAE91Q24uzEFczxGDnnes8OnP/l3Q+gfBMwvzSIwPT1DLi8PqtZaH0giwGdbno2DBLNjyT8UNQUdm3bi/oqoKoF5xkzT6DpflTZ7Wht3e5DWZmMH0bO3Rk4Iaao2Lr39qCj+Qy0AhIzsa/RWLUP1R4Jig2tzYSZI6A0d+LE7m3bRKynIzeQ1qnElDsAJ8sPtZ5Fo+cQ9m89hS1lPuERHqNZGpELobrCBy95eceDOIFMasFuc+HpzZvccDodmCICIok2EG9a9TKW7/kndm4+lv92dN9lQYwHsb6YNooqTyPcTvK/G08zNhNwyuQSj1uGy+lGNBEULltpobWG5d2tDP7bInKh2DeZsVl9SS0Eb/lWQYAxBTbdVB6sGwlRvylDKyIgksrKCP9vlQJny73F4EMLZ3Hx5hGRS7my1OhPVRwZv2dKRc1BIUEbi27oRbXOgJxIHY1n0L2rR7iZQYvAd5cG7/nxOOxqiUResRLLuXpNpJega3p+kIgt3ba4fNhfe0ok1qFdZ0FbADQSfnbvuj24I1tFa+WSnFuPU1pmZ1vpgaN7LucH7/QeI9CPENMhnreARwh8kMDZcuU2K2cpAsi6NJFaphjZiiaIRCq4Wry/w2v3WeK5EXAOm41060aKNqmfyIh0MJIYjCWB2eg4XGpdfj3nBLo4eEQoX+0S4H4Ct61iOYlTqcNCbArLhMWYjM0E9Ng0euL0ciY6hnK1Kb+W8x5gJ4WsfChamgS/F+C53XIVom7SHY4EBQHGZGwmkLzxCT5eWALCSwE4UCdcZWW9wBaxW0uRyIOrq1vOuji0rHuWMBiLMRmbCaQXApjWEhgORywE5vpRY+/M13sRieHjGImeF+D85N9rgecIVJHOIOlmDMZiTMZWs73a8sAn+JPtGHrKXQOoqWhCpdqCiOHPLWIZEvSjd/RJUR38XoCv4XYe61FaYKYd8E8MiD6RsRiTsXP9gLk4gXjdz9Fs2bBHN4Joqe6CIS0hZUXzxjAY17YqZXaRtcA5lzYpjfDKbbjs78PIlIG5CVy8dg4f0qeFIgL8I/AdrjZ04ClJNlzxdAAtW7oIJYUE5m89A6zhcnZRBVkuwId6qWVPYGYec5fexrO8TXD8V7ZkHArTfwmfVh/EYQtp1yI1Ets8bfDYfTR6DKZk5jvJUnWe23hU2mlq1C4oWi2B9wnwsWnMfv46umnEGMli1ugiAuyxNC//Q5fwWc1BHFlOGWVRaqMcchka3J0oU7aI448pxSk8Zn6XFIuMZINLboBXOQAv2qgdH6bG5juMhAy2fJ7AnyDdoyTsTn3VtpyEuxVf55/xJvWJj9cTbnWlhKpNPupoKKbldVRW9qLjjmGkaZEJIRwNilLjbOeEWwyh9+szeIeGBEhm12rLC0l4SbbWH8C+u57Eu3YXmriT4b2cRZGLJ/DyygsMC9d5Oo7R6//GG5M/oJ8+T2WTTtvQ0YzERUL2o9pdjdq9h9FduR2PqC4033LaI016HCORMXwxcAE9y2FR53QuEt1vfKNHs8LvtiwRN0kFlzVJWUFHXVjyCZJoNsmWs8DanR5OS3nEzm1UtouSSpS9ni2v9O0sXnn9X4ABAFUK+nNCM645AAAAAElFTkSuQmCC);
            }
            .shop-tracking-status .image-order-status-completed .status{
                left: -25px;
            }
            .shop-tracking-status .image-order-status-completed .status:before{
                display:none
            }
            .shop-tracking-status .image-order-status-completed .status:after{
                font-family:FontAwesome;
                content:"\f054";
                padding-left:5px;
                vertical-align:middle
            }

        </style>
        <script>
                                function cancelOrder(orderId) {
                                    var option = confirm('Are you sure to cancel this order?');
                                    if (option === true) {
                                        window.location.href = 'changestatus1?pid=' + orderId + '&sstatus=4';
                                    }
                                }
        </script>
    </body>

</html>