<%-- 
    Document   : admineditfilm
    Created on : Oct 25, 2023, 5:25:25 AM
    Author     : PC-Phong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Css/styleAdminEditFilm.css"/>
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
                <h1>Quản lí Film</h1>
                <form action="AdminEditFilm"method="get">
                    <div class="form-container" style="margin-bottom: 30px">
                        <span style="font-size: 20px ">Chọn phim để lấy thông tin:</span>
                        <select name="film">
                            <c:forEach items="${filmDao.accFilm}" var="f">
                                <option>${f.title}</option>
                            </c:forEach>
                        </select>
                        <br>
                        <input style="margin-top: 10px" type="submit" name="Submit">
                    </div>
                </form>
                <h2>${detailFilm.title}</h2>
                <form action="AdminEditFilm" method="post">
                    <table>

                        <input type="hidden"  name="filmid" value="${detailFilm.id}">
                        <!-- title -->
                        <tr>
                            <td><label for="title">Title:</label></td>
                            <td><input type="text" id="title" name="title"  value="${detailFilm.title}"></td>
                        </tr>

                        <!-- category -->
                        <tr>
                            <td><label for="category">Category:</label></td>
                            <td><input type="text" id="category" value="${detailFilm.category}" name="category" maxlength="50"></td>
                        </tr>

                        <!-- length -->
                        <tr>
                            <td><label for="length">Length:</label></td>
                            <td><input type="text" value="${detailFilm.length}" id="length" name="length" ></td>
                        </tr>

                        <!-- description -->
                        <tr>
                            <td><label for="description">Description:</label></td>
                            <td><textarea id="description" value="${detailFilm.description}" name="description">${detailFilm.description}</textarea></td>
                        </tr>

                        <!-- age_limit -->
                        <tr>
                            <td><label for="age_limit">Age Limit:</label></td>
                            <td><input type="text" value="${detailFilm.ageLimit}" id="age_limit" name="age_limit" ></td>
                        </tr>

                        <!-- director -->
                        <tr>
                            <td><label for="director">Director:</label></td>
                            <td><input type="text"value="${detailFilm.director} "id="director" name="director" ></td>
                        </tr>

                        <!-- actor -->
                        <tr>
                            <td><label for="actor">Actor:</label></td>
                            <td><input type="text"value="${detailFilm.actors}" id="actor" name="actor" ></td>
                        </tr>

                        <!-- warning_text -->
                        <tr>
                            <td><label for="warning_text">Warning Text:</label></td>
                            <td><textarea id="warning_text"value="${detailFilm.warningText}" name="warning_text">${detailFilm.warningText}</textarea></td>
                        </tr>

                        <!-- publish_time -->
                        <tr>
                            <td><label for="publish_time">Publish Time:</label></td>
                            <td><input type="date"value="${detailFilm.publishTime}" id="publish_time" name="publish_time"></td>
                        </tr>

                        <!-- origin -->
                        <tr>
                            <td><label for="origin">Origin:</label></td>
                            <td><input type="text" id="origin"value="${detailFilm.origin}" name="origin" maxlength="50"></td>
                        </tr>

                        <!-- img -->
                        <tr>
                            <td><label for="img">Image Link:</label></td>
                            <td><input type="text" id="img"value="${detailFilm.imageUrl}" name="img" maxlength="255"></td>
                        </tr>

                        <!-- img_background -->
                        <tr>
                            <td><label for="img_background">Background Image Link:</label></td>
                            <td><input type="text" id="img_background"value="${detailFilm.image_backgroundUrl}" name="img_background" maxlength="255"></td>
                        </tr>

                        <!-- status -->
                        <tr>
                            <td><label for="status">Status:</label></td>
                            <td><input type="number"value="${detailFilm.status}" id="status" name="status" ></td>
                        </tr>

                    </table>
                    <input style="margin-top: 12px;
                           margin-left: 200px" type="submit" value="Insert_Update" name="btnInUp"></td
                </form>
            </div>
        </div>
    </body>
</html>
