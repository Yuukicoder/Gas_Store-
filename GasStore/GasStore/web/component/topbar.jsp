<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : topbar
    Created on : May 26, 2023, 9:04:01 AM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.text.ParseException" %>
<%@ page import="DTO.NotificationDTO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }
            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .dropdown-content a:hover {
                background-color: #f1f1f1;
            }
            .show {
                display: block;
            }
            .notification {
                position: relative;
                display: inline-block;
            }
            .notification .dot {
                position: absolute;
                top: 2px;
                left: 8px;
                height: 6px;
                width: 6px;
                background-color: red;
                border-radius: 50%;
            }
            .top-bar {
                background-color: #f8f9fa; /* Light gray background for the top bar */
                padding: 10px; /* Add some padding */
                display: flex;
                justify-content: flex-end; /* Align items to the right */
            }
            .profile-btn {
                display: flex;
                align-items: center;
                border: none;
                background: none;
                color: #343a40; /* Dark text color */
                font-size: 16px; /* Font size */
                text-decoration: none;
            }
            .profile-btn img {
                border-radius: 50%;
                margin-right: 10px;
            }
            .profile-btn:hover {
                text-decoration: none;
                color: #007bff; /* Bootstrap primary color */
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row bg-secondary py-1 px-xl-5">
                <div class="col-lg-6 d-none d-lg-block">
                    <div class="d-inline-flex align-items-center h-100">
                        <!-- Optional left side content -->
                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <c:if test="${account == null}">
                        <div class="d-inline-flex align-items-center">
                            <a href="login" class="btn btn-sm btn-light">Login</a>
                        </div>
                    </c:if>
                    <c:if test="${account != null}">
                        <div class="d-inline-flex align-items-center">
                            <div class="btn-group dropdown">
                                <button type="button" class="btn btn-sm btn-light dropdown-toggle dropbtn" onclick="toggleNotificationDropdown()">
                                    <c:if test="${sessionScope.notiList.size() > 0}">
                                        <div class="notification">
                                            <i class="fa fa-bell"></i><div class="dot"></div>
                                        </div>
                                    </c:if>
                                    <c:if test="${sessionScope.notiList.size() == 0}">
                                        <i class="fa fa-bell"></i>
                                    </c:if>
                                    Notification
                                </button>
                                <div class="dropdown-menu dropdown-menu-right dropdown-content" id="notificationDropdown">
                                    <c:if test="${sessionScope.notiList.size() == 0}">
                                        <a href="#" class="dropdown-item">
                                            <h6 class="fw-normal mb-0">There is no</h6>
                                            <h6 class="fw-normal mb-0">new notification</h6>
                                            <small></small>
                                        </a>
                                    </c:if>
                                    <c:if test="${sessionScope.notiList.size() > 0}">
                                        <c:forEach var="noti" items="${sessionScope.notiList}">
                                            <a href="customerDetailNoti?id=${noti.getNotiID()}" class="dropdown-item">
                                                <h6 class="fw-normal mb-0">${noti.getTitle()}</h6>
                                                <%
                                                    NotificationDTO notiDTO = (NotificationDTO) pageContext.getAttribute("noti"); 
                                                    String dateSended = (String) notiDTO.getDateSend();
                                                    boolean isValidDate = false;

                                                    if (dateSended != null) {
                                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                        sdf.setLenient(false);

                                                        try {
                                                            sdf.parse(dateSended);
                                                            isValidDate = true;
                                                        } catch (ParseException e) {
                                                            // Date parsing failed
                                                        }
                                                    }
                                                %> 
                                                <c:if test="<%= isValidDate %>">
                                                    <small>${noti.getDateSend()}</small>
                                                </c:if>
                                                <c:if test="<%= !isValidDate %>">
                                                    <small>${noti.getDateSend()} ago</small>
                                                </c:if>
                                            </a>
                                            <hr class="dropdown-divider">
                                        </c:forEach>   
                                    </c:if>
                                    <a href="customerAllNoti" class="dropdown-item text-center">See all notifications</a>
                                </div>
                            </div>
                        </div>

                        <div class="d-inline-flex align-items-center">
                            <div class="btn-group dropdown top-bar">

                                <button type="button" class="btn btn-sm btn-light dropdown-toggle dropbtn" onclick="toggleDropdown()">
                                    <img src="${sessionScope.account.getImage()}" width="25px" height="25px" alt="avatar"/>

                                    ${sessionScope.account.getFullName()}
                                </button>

                                <div class="dropdown-menu dropdown-menu-right dropdown-content" id="myDropdown">
                                    <a class="dropdown-item" href="mypurchase">My Purchase</a>
                                    <a class="dropdown-item" href="myWarranty">My Warranty</a>
                                    <a class="dropdown-item" href="UserProfile">Profile</a>
                                    <a class="dropdown-item" href="logout">Logout</a>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <div class="d-inline-flex align-items-center d-block d-lg-none">
                        <a href="" class="btn px-0 ml-2">
                            <i class="fas fa-heart text-dark"></i>
                            <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                        </a>
                        <a href="" class="btn px-0 ml-2">
                            <i class="fas fa-shopping-cart text-dark"></i>
                            <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                        </a>
                    </div>
                </div>
            </div>

            <!-- logo trang chu -->
            <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
                <div class="col-lg-4">
                    <!--                    <a href="home" class="text-decoration-none">
                                            <a href="home"><img src="img/Gas_Store.png" alt="logo" width="100px"></a>
                                        </a>-->
                    <a href="home" class="text-decoration-none">
                        <span class="h1 text-uppercase text-primary bg-dark px-2">Gas</span>
                        <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Store</span>
                    </a>
                </div>

                <!-- Thanh search -->
                <div class="col-lg-4 col-6 text-left">
                    <form action="search">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for products" name="key">
                            <div class="input-group-append">
                                <span class="input-group-text bg-transparent text-primary">
                                    <i class="fa fa-search"></i>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            function toggleDropdown() {
                document.getElementById("myDropdown").classList.toggle("show");
            }
            function toggleNotificationDropdown() {
                document.getElementById("notificationDropdown").classList.toggle("show");
            }
            window.onclick = function (event) {
                if (!event.target.matches('.dropbtn')) {
                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    for (var i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.classList.contains('show')) {
                            openDropdown.classList.remove('show');
                        }
                    }
                }
            }
        </script>
    </body>
</html>