<%@ page import="java.text.SimpleDateFormat, java.text.ParseException" %>
<%@ page import="DTO.NotificationDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
            <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
            </a>
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <form class="d-none d-md-flex ms-4">
                <input class="form-control bg-dark border-0" type="search" placeholder="Search">
            </form>
            <div class="navbar-nav align-items-center ms-auto">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <i class="fa fa-envelope me-lg-2"></i>
                        <span class="d-none d-lg-inline-flex">Message</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                        <a href="#" class="dropdown-item">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <div class="ms-2">
                                    <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                    <small>15 minutes ago</small>
                                </div>
                            </div>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <div class="ms-2">
                                    <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                    <small>15 minutes ago</small>
                                </div>
                            </div>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <div class="ms-2">
                                    <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                    <small>15 minutes ago</small>
                                </div>
                            </div>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item text-center">See all message</a>
                    </div>
                </div>
                <div class="nav-item dropdown ">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <c:if test="${sessionScope.notiList.size() > 0}">
                            <div class="notification">
                                <i class="fa fa-bell me-lg-2"></i><div class="dot"></div>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.notiList.size() == 0}">
                            <i class="fa fa-bell me-lg-2"></i>
                        </c:if>
                        <span class="d-none d-lg-inline-flex">Notification</span>

                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                        <c:if test="${sessionScope.notiList.size() == 0}">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">There is no</h6>
                                <h6 class="fw-normal mb-0">new notification</h6>
                                <small></small>
                            </a>
                        </c:if>

                        <c:if test="${sessionScope.notiList.size() > 0}">
                            <c:forEach var="noti" items="${sessionScope.notiList}">
                                <a href="AdminNotificationDetailServlet?id=${noti.getNotiID()}" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">${noti.getTitle()}</h6>
                                    <%
                                        NotificationDTO notiDTO = (NotificationDTO) pageContext.getAttribute("noti"); // Assuming getDateSended() returns a String
                                        String dateSended = (String) notiDTO.getDateSend();
                                        boolean isValidDate = false;
            
                                        if (dateSended != null) {
                                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                            sdf.setLenient(false); // Ensure strict parsing
                
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
                        <a href="AdminAllNotification" class="dropdown-item text-center">See all notifications</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="images/User/${sessionScope.account.getImg()}" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex">${sessionScope.account.getAdminName()}</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                        <a href="AdminProfile" class="dropdown-item">My Profile</a>
                        <a href="#" class="dropdown-item">Settings</a>
                        <a href="logout" class="dropdown-item">Log Out</a>
                    </div>
                </div>
            </div>
        </nav>
        <style>
            .notification {
                position: relative;
                display: inline-block;
            }

            .notification .dot {
                position: absolute;
                top: 6px;
                right: 6px;
                height: 10px;
                width: 10px;
                background-color: red;
                border-radius: 50%;
            }
        </style>
    </body>
</html>
