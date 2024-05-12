<%-- 
    Document   : admin.jsp
    Created on : Oct 19, 2023, 3:17:10 PM
    Author     : PC-Phong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FPT Cinema</title>
        <link rel="stylesheet" href="Css/styleAdmin.css"/>
        <link rel="icon" type="image/x-icon" href="https://th.bing.com/th/id/R.e15d750fe41eb99350f0c56e6b66b653?rik=QJI66s2o67Q7jw&pid=ImgRaw&r=0">
    </head>
    <body>
        <%@include file="/components/header.jsp"%>
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
                <h1>Phòng chiếu</h1>

                <div class="form-container">
                    <div class="left-column">
                        <table class="account" >
                            <thead>
                            <!--<th>ID</th>-->
                            <th>Name</th>
                            <th>Capacity</th> 
                            <th></th>
                            <th></th>
                            </thead>
                            <tbody>
                                <c:forEach items="${RoomDAO.listRoom}" var="r">
                                    <tr>                                    
                                        <!--<td>${r.id}</td>-->
                                        <td>${r.name}</td>
                                        <td>${r.capacity}</td>
                                        <td><a style="text-decoration: none" href="AdminEditRoom?type=0&roomid=${r.id}" >Update</a></td>
                                        <td><a style="text-decoration: none" href="AdminEditRoom?type=1&roomid=${r.id}" >Remove</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="right-column">
                        <form action="AdminEditRoom" method="post">
                            <!--                            <div class="row">  
                                                            <div class="label">Id: </div>
                                                            <div class="input"><input type="text" name="id" value="${detailRoom.id}"></div>
                                                        </div>-->
                            <input type="hidden" name="id" value="${detailRoom.id}">
                            <div class="row">  
                                <div class="label">Name:</div>
                                <div class="input"><input type="text" name="name" value="${detailRoom.name}"></div>
                            </div>
                            <div class="row">
                                <div class="label">Capacity</div>
                                <div class="input"><input type="text" name="capacity" value="${detailRoom.capacity}"></div>
                            </div>


                            <input type="submit" value="Insert_Update" name="btnInUp">
                        </form>
                    </div>
                </div>

            </div>
        </div>


    </body>
</html>
