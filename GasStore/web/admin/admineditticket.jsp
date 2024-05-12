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
                <h1>Suất chiếu</h1>

                <div class="form-container">

                    <table class="account" >
                        <thead>

                        <th>Tên Phim</th>
                        <th>Phòng chiếu</th>
                        <th>Thời gian chiếu</th>

                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="l">
                                <tr>                                                                     
                                    <td>${l.filmName}</td>
                                    <td>${l.roomName}</td>
                                    <td>${l.date}</td>

                
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>           
                </div>
                <div style="height: 200px">
                    <h1>Thêm suất chiếu cho phim</h1>
                    <form action="AdminEditTicket" method="post">
                        <select name="film">
                            <c:forEach items="${filmDao.accFilm}" var="f">
                                <option value="${f.id}">${f.title}</option>
                            </c:forEach>
                        </select>
                        <select name="room">
                           . <c:forEach items="${roomDao.listRoom}" var="r">
                                <option value="${r.id}">${r.name}</option>
                            </c:forEach>.
<!--                            .<c:forEach items="${listRooms}" var="r">
                                <option value="${r.id}">${r.name}</option>
                            </c:forEach>.-->
                        </select>
                        <select name="event">
                            <c:forEach items="${eventDao.listEvent}" var="e">
                                <option value="${e.id}">${e.startHour}</option>
                            </c:forEach>
                        </select>
                        <!--<input type="text" name="event">-->
                        <input type="submit" value="Insert" name="btnInUp">
                    </form>
                </div>
            </div>


    </body>
</html>
