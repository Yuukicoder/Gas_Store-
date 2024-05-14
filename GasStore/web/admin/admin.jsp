<<<<<<< HEAD
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
=======

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

>>>>>>> main
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gas Store</title>
<<<<<<< HEAD
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Back to top button -->
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
        <link href="css/style1.css" rel="stylesheet"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

        <link href="css/styleAdmin.css" rel="stylesheet" type="text/css"/>
=======
        <link href="./css/styleAdmin.css" rel="stylesheet" type="text/css"/>
>>>>>>> main
        <link rel="icon" type="image/x-icon" href="https://th.bing.com/th/id/R.e15d750fe41eb99350f0c56e6b66b653?rik=QJI66s2o67Q7jw&pid=ImgRaw&r=0">
        <style>
            .action-btn {
                display: inline-block;
                padding: 5px 10px;
                margin-right: 5px;
                background-color: #007bff; /* Blue color for button */
                color: #fff; /* White text color */
                text-decoration: none;
                border-radius: 5px; /* Rounded corners */
            }

            .action-btn:hover {
                background-color: #0056b3; /* Darker blue color on hover */
            }</style>
    </head>

    <body>
        <div class="page">
            <div class="sidebar">
                <h2>Menu</h2>
                <ul>
                    <li><a href="AdminController">Tài khoản</a></li>
                    <li><a href="AdminEditFilm"></a></li>
                    <li><a href="AdminEditRoom"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="AdminEditTicket"></a></li>
                </ul>
            </div>

            <div class="content">
                <h1><a href="admin" style="text-decoration: none; color: black;">Tài Khoản</a></h1>
                <div class="form-container">
                    <div class="left-column">
                        <table class="account">
                            <thead>
<<<<<<< HEAD
                                <tr>
                                    <th></th>
                                    <th>Username</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Email</th>
                                    <th>Phone Number</th>
                                    <th>Role ID</th>
                                    <th>Action</th>

                                </tr>
                            </thead>
                            <tbody>
                                <!-- Data from JSP -->
=======
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
>>>>>>> main
                                <c:forEach items="${requestScope.ldata}" var="o">
                                    <tr>                                    
                                        <td></td>
                                        <td>${o.userName}</td>
<<<<<<< HEAD

=======
<!--                                        <td>${o.password}</td>-->
>>>>>>> main
                                        <td>${o.firstName}</td>
                                        <td>${o.lastName}</td>
                                        <td>${o.email}</td>
                                        <td>${o.phone}</td>
                                        <td>${o.roleID}</td>
                                        <c:if test="${o.roleID!=0}" >
<<<<<<< HEAD
                                            <td>
                                                <a class="action-btn" href="admin?type=0&id=${o.customerID}">Update</a>
                                                <a class="action-btn" href="admin?type=1&id=${o.customerID}">Remove</a>
                                            </td>

=======
                                            <td><a style="text-decoration: none" href="admin?type=0&id=${o.customerID}" >Update</a></td>
                                            <td><a style="text-decoration: none" href="admin?type=1&id=${o.customerID}" >Remove</a></td>
>>>>>>> main
                                        </c:if>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="right-column">
<<<<<<< HEAD
                        <p style="font-weight: 600;">Insert new Account</p>
                        <form action="admin" method="post">
                            <input type="hidden" value="${detailaccount.customerID}" name="account_id">
=======
                        <form action="admin" method="post">
                            <input type="hidden" value="${detailaccount.customerID}" name="account_id">
                            <!--                            <div class="row">  
                                                            <div class="label">Id: </div>
                                                            <div class="input"><input type="text" name="account_id" value="${detailaccount.customerID}"></div>
                                                        </div>-->
>>>>>>> main
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
<<<<<<< HEAD
                                <div class="input"><input type="text" name="first_name" value="${detailaccount.firstName}"></div>
                            </div>
                            <div class="row">
                                <div class="label">Last Name:</div>
                                <div class="input"><input type="text" name="last_name" value="${detailaccount.lastName}"></div>
=======
                                <div class="input"><input type="text" name="first_name"value="${detailaccount.firstName}"></div>
                            </div>
                            <div class="row">
                                <div class="label">Last Name:</div>
                                <div class="input"><input type="text" name="last_name"value="${detailaccount.lastName}"></div>
>>>>>>> main
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

                            <input class="action-btn" type="submit" value="INSERT_UPDATE" name="btnInUp">
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>