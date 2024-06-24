<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : topbar
    Created on : May 26, 2023, 9:04:01 AM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown"></button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <button class="dropdown-item" type="button"><a href="">My Purchase</a></button>
                                    <button class="dropdown-item" type="button"><a href="">Profile</a></button>
                                    <button class="dropdown-item" type="button"><a href="logout">Logout</a></button>
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
            
<!--            logo trang chu-->
            <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
                <div class="col-lg-4">
                    <a href="home" class="text-decoration-none">
                        <a href="index.jsp"><img src="img/Gas_Store.png" alt="logo" width="100px"></a>
                    </a>
                </div>
                
<!--                Thanh search-->
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
<!--                <div class="col-lg-4 col-6 text-right">
                    <p class="m-0" style="color: black">Hotline</p>
                    <h5 class="m-0">+84 377 043 903</h5>
                </div>-->
            </div>
        </div>
    </body>
</html>
