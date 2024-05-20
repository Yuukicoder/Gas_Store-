<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid bg-dark mb-30">
            <div class="row px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                        <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Laptop Category</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>
                    <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                        <div class="navbar-nav w-100">
                            <!-- foreach -->
                            <c:forEach var="c" items="${category}">
                                <a href="category?id=${c.getCategoryID()}" class="nav-item nav-link">${c.getName()}</a>
                            </c:forEach>
                        </div>
                    </nav>
                </div>
                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <span class="h1 text-uppercase text-dark bg-light px-2">Laptop</span>
                            <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
                               
                            
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="home" class="nav-item nav-link active">Home</a>
                                <a href="shop" class="nav-item nav-link">Shop</a>
<!--                                <a href="contact.jsp" class="nav-item nav-link">Contact</a>-->
                                  <a href="PostListController" class="nav-item nav-link">News</a>
                            </div>
                            
                            <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                                <a href="cart" class="btn px-0 ml-3">
                                    <i class="fas fa-shopping-cart text-primary"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">
                                        <%
                                        Cookie[] arr = request.getCookies();
                                        int counter = 0;
                                        if (arr != null) {
                                            for (Cookie o : arr) {
                                                if (o.getName().equals("cart")) {
                                                    String[] splitedValue = o.getValue().split("/");
                                                    counter += splitedValue.length;
                                                    
                                                    for (String s : splitedValue) {
                                                        if (s.equals("")) {
                                                        counter -= 1;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        out.println(counter);
                                        %>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </body>
</html>
