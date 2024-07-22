<%-- 
    Document   : warrantyPaper
    Created on : 9 Jul, 2024, 3:06:27 AM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phiếu bảo hành</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
              integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            .table-container {

                /* Điều chỉnh các thuộc tính căn giữa */
                display: block;
                margin-top: 20px;
            }

            .styled-table {
                width: 90%;
                max-width: 1200px;
                border-collapse: collapse;
                font-size: 0.9em;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            }

            .styled-table thead tr {
                background-color: #000;
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
                border-bottom: 2px solid #3333;
            }

            .styled-table tbody tr.active-row {
                font-weight: bold;
                color: #3333;
            }
        </style>
    </head>
    <a href="manageWarranty" style="text-decoration: none; color: blue"> < Back to manage Warranty</a>
    <c:set var="warr" value="${warr}"/>
    <c:set var="pro" value="${pro}"/>
    <c:set var="cus" value="${cus}"/>
    <h3>${mess}</h3>
    <form action="manageWarranty" method="POST">
        <input name="warrId" value="${warr.getWarrantyID()}" hidden />
        <input name="Service" value="sendMail" hidden/>
        <input name="proName" value="${pro.getName()}" hidden/>
        <input name="mailTo" value="${cus.getEmail()}" hidden/>
        <input name="serialNumber" value="${serialNumber}" hidden/>
        <button type="submit" style="border: 0; border-radius: 5px; color: #fff; background-color: green">Export to customer</button>
    </form>
        
    <body class="p-3">
        <h4 class="text-center text-uppercase">PHIẾU BẢO HÀNH</h4>
        <div class="text-center" id="current-date"></div>
        <div>
            <h6 class="text-uppercase">Thông tin khách hàng</h6>
            <p>Tên KH: ${cus.getFullName()}</p>
            <p>ĐT: ${cus.getPhone()}</p>
        </div>  
        <div>
            <h6 class="text-uppercase">Thông tin người tiếp nhận</h6>
            <c:set var="emp" value="${sessionScope.account}"/>
            <p>Tên Nhân viên: ${emp.getUserName()}</p>
            <p>Mã số nv: NV${emp.getAdminID()}</p>
        </div>
        <form action="manageWarranty" method="POST">
            <div class="">
                <h6>Ngày hẹn trả: <input type="Date" name="expectDate" value="${warr.getExpectedDate()}" required /></h6>
            </div>
            
            <input type="text" name="Service" value="updateReciver" hidden />
            <input type="text" name="warStatus" value="accepted" hidden />
            <input type="text" name="warId" value="${warr.getWarrantyID()}" hidden />
            <div class="table-container">
                <table class="styled-table" style="margin: 0 auto;">
                    <thead>
                        <tr>
                            <th>TT</th>
                            <th>Mã SP</th>
                            <th>Tên SP</th>
                            <th>Tình trạng sp</th>
                            <th>Ảnh sp</th>
                            <th>Hạn bảo hành</th>
                            <th>Hình thức</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>${warr.getWarrantyID()}</td>
                            <td>${warr.getSerialID()}</td>
                            <td>${pro.getName()}</td>
                            <td>${warr.getNotes()}</td>
                            <td>
                                <%
         // Lấy giá trị của thuộc tính proofImg từ đối tượng warr
         String proofImg = (String) pageContext.findAttribute("warr").getClass().getMethod("getProofImg").invoke(pageContext.findAttribute("warr"));
    
         // Tách chuỗi proofImg thành mảng
         if (proofImg != null && !proofImg.isEmpty()) {
             String[] images = proofImg.split(",");
             for (String img : images) {
                                %>
                                <img src="images/productError/<%= img.trim() %>" style="width: 150px;" alt="Image"/><br>
                                <%
                                        }
                                    }
                                %>
                            </td>
                            <td>${pro.getLimit()} tháng</td>
                            <td>Trong thời gian</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="d-flex justify-content-between">
                <div>Khách hàng: ${cus.getFullName()}</div>
                <div>Nhân viên tiếp nhận: ${emp.getUserName()}</div>
            </div>
            <c:if test="${warr.getStatus() == 'wait' || warr.getStatus() == 'Wait'}">
                <button type="submit" class="bg-success border-0 px-3 py-2 rounded mt-5 text-white">Accept</button>
            </c:if>
        </form>
        <script type="text/javascript">
            function displayCurrentDate() {
                const today = new Date();
                const day = String(today.getDate()).padStart(2, '0');
                const month = String(today.getMonth() + 1).padStart(2, '0'); // Tháng bắt đầu từ 0, nên cần cộng thêm 1
                const year = today.getFullYear();

                const formattedDate = day + "/" + month + "/" + year;
                console.log(formattedDate);
                document.getElementById('current-date').innerHTML = formattedDate;
            }
            window.onload = displayCurrentDate();
        </script>
    </body>
</html>
