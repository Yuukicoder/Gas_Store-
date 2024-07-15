<%-- 
    Document   : manageWarranty
    Created on : 9 Jul, 2024, 2:14:41 AM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .table-container {
                padding: 20px;
                /* Điều chỉnh các thuộc tính căn giữa */
                display: block;
                margin-top: 20px;
            }

            .styled-table {
                width: 100%;
                max-width: 1200px;
                border-collapse: collapse;
                margin: 25px auto; /* Giữ lại để căn giữa ngang */
                font-size: 0.9em;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            }

            .styled-table thead tr {
                background-color: #009879;
                color: #ffffff;
                text-align: left;
            }

            .styled-table th,
            .styled-table td {
                padding: 12px 15px;
            }

            .styled-table tbody tr {
                border-bottom: 1px solid #dddddd;
            }

            .styled-table tbody tr:nth-of-type(even) {
                background-color: #f3f3f3;
            }

            .styled-table tbody tr:last-of-type {
                border-bottom: 2px solid #009879;
            }

            .styled-table tbody tr.active-row {
                font-weight: bold;
                color: #009879;
            }
        </style>
    </head>
    <body>
        <form action="manageWarranty" method="GET">
            <input name="Service" value="search" hidden /></br>
            <input name="serialNumber" value="${serialNumber}" />
            <button type="submit">Search</button>
        </form>
        <a href="manageWarranty?Service=addWarranty">Add more Warranty</a>
        <div class="table-container">
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>WarrantyId</th>
                        <th>SerialId</th>
                        <th>Create date</th>
                        <th>SerialCode</th>
                        <th>Reciver date</th>
                        <th>Expect date</th>
                        <th>Done date</th>
                        <th>Process By</th>
                        <th>Notes</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="war" items="${list}">
                        <tr>
                            <td>
                                ${war.getWarrantyID()}
                            </td>
                            <td>
                                ${war.getSerialID()}
                            </td>
                            <td>
                                ${war.getCreateDate()}
                            </td>
                            <td>
                                ${war.getSerialNumbers()}
                            </td>
                            <td>
                                ${war.getReciverDate()}
                            </td>
                            <td>
                               ${war.getExpectedDate()}
                            </td>
                            <td>
                               ${war.getDoneDate()}
                            </td>
                            <td>
                                ${war.getProcess_By()}
                            </td>
                            <td>
                                ${war.getNotes()}
                            </td>
                             <td>
                                <c:if test="${war.getStatus() == 'accepted'}">
                                    <a  style="color: green; text-decoration: none" href="manageWarranty?Service=updateStatus&warrantyId=${war.getWarrantyID()}&status=done">Confim Done</a>
                                </c:if>
                                <c:if test="${war.getStatus() == 'wait' || war.getStatus() == 'Wait' }">
                                    
                                <select onchange="changeStatus([this, ${war.getWarrantyID()}])">
                                    <option value="wait" ${war.getStatus() == 'wait' ? 'selected' : ''}>Wait</option>
                                    <option value="unaccept" ${war.getStatus() == 'unaccept' ? 'selected' : ''}>Unaccept</option>
                                </select>
                                
                                </c:if>
                                    <c:if test="${war.getStatus() == 'done'}">
                                        <span style="color: green;">Done</span>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${war.getStatus() == 'wait' || war.getStatus() == 'Wait' }">
                                     <a href="manageWarranty?Service=accept&warId=${war.getWarrantyID()}" style="text-decoration: none; color: red;">Tiếp nhận</a>
                                </c:if>
                                <c:if test="${war.getStatus() == 'done' || war.getStatus() == 'accepted' }">
                                     <a href="manageWarranty?Service=viewDetail&warId=${war.getWarrantyID()}" style="text-decoration: none; color: red;">Xem chi tiết</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:if test="${mess != null}">
                <p>${mess}</p>
            </c:if>
            <c:if test="${mess == null}">
                <c:if test="${empty list}">
                 <p>This product has no warranty</p>
                </c:if>
            </c:if>
        </div>
       <script>
        const changeStatus = (param) => {
               let url = 'manageWarranty?Service=updateStatus&warrantyId='+param[1]+"&status="+param[0].value
               window.location = url
           }
    </script>
    </body>
</html>
