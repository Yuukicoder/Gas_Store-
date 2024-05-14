
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gas Store</title>
        <link href="./css/styleAdmin.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" type="image/x-icon" href="https://th.bing.com/th/id/R.e15d750fe41eb99350f0c56e6b66b653?rik=QJI66s2o67Q7jw&pid=ImgRaw&r=0">
    </head>
    <body>
        <div class="page">
            <div class="sidebar">
                <h2>Menu</h2>
                <ul>
                    <li><a href="AdminController">Tài khoản</a></li>
                    <li><a href="AdminEditFilm">Quản lí phim</a></li>
                    <li><a href="AdminEditRoom">Quản lí phòng chiếu</a></li>
                    <li><a href="">Quản lí thời gian chiếu</a></li>
                    <li><a href="">Quản lí ghế ngồi</a></li>
                    <li><a href="">Quản lí tin tức </a></li>
                    <li><a href="AdminEditTicket">Quản lí suất chiếu</a></li>
                </ul>
            </div>
            <div class="content">
                <h1>Tài Khoản</h1>

                <div class="form-container">
                    <div class="left-column">
                        <table class="account" >
                            <thead>
                            <th></th>
                            <th>Username</th>
                            <!--<th>Password</th>-->
                            <th>First_name</th>
                            <th>Last_name</th>
                            <th>Email</th>
                            <th>Phone_number</th>
                            <th>Role_id</th>
                            <th>Action</th>
                            <th></th>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.ldata}" var="o">
                                    <tr>                                    
                                        <td></td>
                                        <td>${o.userName}</td>
<!--                                        <td>${o.password}</td>-->
                                        <td>${o.firstName}</td>
                                        <td>${o.lastName}</td>
                                        <td>${o.email}</td>
                                        <td>${o.phone}</td>
                                        <td>${o.roleID}</td>
                                        <c:if test="${o.roleID!=0}" >
                                            <td><a style="text-decoration: none" href="admin?type=0&id=${o.customerID}" >Update</a></td>
                                            <td><a style="text-decoration: none" href="admin?type=1&id=${o.customerID}" >Remove</a></td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="right-column">
                        <form action="admin" method="post">
                            <input type="hidden" value="${detailaccount.customerID}" name="account_id">
                            <!--                            <div class="row">  
                                                            <div class="label">Id: </div>
                                                            <div class="input"><input type="text" name="account_id" value="${detailaccount.customerID}"></div>
                                                        </div>-->
                            <div class="row">  
                                <div class="label">Username:</div>
                                <div class="input"><input type="text" name="username" value="${detailaccount.userName}"></div>
                            </div>
                            <div class="row">
                                <div class="label">Password:</div>
                                <div class="input"><input type="text" name="password" value="${detailaccount.password}"></div>
                            </div>

                            <div class="row">
                                <div class="label">First Name:</div>
                                <div class="input"><input type="text" name="first_name"value="${detailaccount.firstName}"></div>
                            </div>
                            <div class="row">
                                <div class="label">Last Name:</div>
                                <div class="input"><input type="text" name="last_name"value="${detailaccount.lastName}"></div>
                            </div>
                            <div class="row">
                                <div class="label">Email:</div>
                                <div class="input"><input type="text" name="email" value="${detailaccount.email}"></div>
                            </div>
                            <div class="row">
                                <div class="label">Phone_number:</div>
                                <div class="input"><input type="text" name="phone_number" value="${detailaccount.phone}"></div>
                            </div>
                            <div class="row">
                                <div class="label">Role ID:</div>
                                <div class="input"><input type="text" name="role_id" value="${detailaccount.roleID}"></div>
                            </div>

                            <input type="submit" value="Insert_Update" name="btnInUp">
                        </form>
                    </div>
                </div>

            </div>
        </div>


    </body>
</html>
