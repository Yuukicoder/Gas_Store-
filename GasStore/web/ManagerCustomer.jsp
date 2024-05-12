
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>test</title>
        <link rel="stylesheet" type="text/css" href="MC/style.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>

    <body>
        <main class="table" id="customers_table">
            <section class="table__header">
                <h1>Customer's Orders</h1>
                <div class="input-group">
                    <input type="search" placeholder="Search Data...">
                    <img src="MC/images/search.png" alt="">
                </div>
                <div class="export__file">
                    <a href="index.jsp"> 
                        <label for="export-file" class="export__file-btn" title="Export File"></label>
                        <div class="export__file-options">

                        </div>
                    </a>
                </div>
            </section>
            <section class="table__body">
                <table>
                    <thead>
                        <tr>
                            <th> Id <span class="icon-arrow">&UpArrow;</span></th>
                            <th> Customer <span class="icon-arrow">&UpArrow;</span></th>
                            <th> Pass <span class="icon-arrow">&UpArrow;</span></th>
                            <th> Is Sell <span class="icon-arrow">&UpArrow;</span></th>
                            <th> Active <span class="icon-arrow">&UpArrow;</span></th>
                            <th> Edit </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${accounts}" var="p">
                            <tr>

                                <td>${p.uid}</td>
                                <td>${p.user}</td>
                                <td>${p.pass}</td>
                                <td>${p.isSell}</td>
                                <td>

                                    <c:choose>
                                        <c:when test="${p.active}">
                                            <p class="status delivered">Active</p>
                                        </c:when>    
                                        <c:otherwise>
                                            <p class="status cancelled">Banned</p>
                                        </c:otherwise>
                                    </c:choose>
                                <td>
                                    <a href="loadAccount?pid=${p.uid}">
                                        <span class="material-symbols-outlined" style="color: blue">
                                            edit
                                        </span>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
            </section>
        </main>
        <script src="MC/script.js"></script>

    </body>

</html>
