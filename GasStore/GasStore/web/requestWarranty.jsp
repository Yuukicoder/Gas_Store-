<%-- 
    Document   : requestWarranty
    Created on : 8 Jul, 2024, 1:24:20 AM
    Author     : HP
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="DAO.*" %>
<%@page import="DTO.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>My purchase</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
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
            #special-link {
                border-bottom: 2px solid red;
            }

            .navigation {
                background-color: #FFFFFF;
                border-bottom: 1px solid #e0e0e0;
                padding: 20px;
                width: 92%;
                margin-bottom: 20px
            }

            .navigation .row .col-2.text-center {
                padding: 0 15px;
            }

            .navigation .row .col-2.text-center a.nav-link {
                color: #333;
                text-decoration: none;
                font-weight: 500;
                display: block;
                transition: color 0.3s ease;
            }

            .navigation .row .col-2.text-center.active a.nav-link {
                color: #ff4500;
            }

            .navigation .row .col-2.text-center a.nav-link:hover {
                color: #ff4500;
            }
            .popup {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 999;
            }
            .popup-content {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                width: 80%;
                max-width: 600px;
            }
            /* CSS cho nút đóng */
            .close-btn {
                position: absolute;
                top: 10px;
                right: 10px;
                cursor: pointer;
                color: #888;
                font-size: 24px;
            }
            /* CSS cho nút mở cửa sổ popup */
            #btn-bao-hanh {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            #btn-bao-hanh:hover {
                background-color: #0056b3;
            }
            /* CSS cho form */
            .form-container {
                max-width: 600px;
                margin: 0 auto;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }
            .form-group input,
            .form-group textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .form-group textarea {
                resize: vertical;
            }
            .form-group button {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .form-group button:hover {
                background-color: #0056b3;
            }

            /* CSS cho thông báo thành công */
            #success-message {
                display: none;
                padding: 10px;
                background-color: #28a745;
                color: white;
                border-radius: 4px;
                margin-top: 10px;
            }
        </style>

    </head>

    <body>
        <%@include file="component/topbar.jsp" %>
        <%@include file="component/navbar.jsp" %>

        <!-- Phần giới thiệu về bảo hành -->
        <div id="popup-bao-hanh" class="popup">
            <div class="popup-content">
                <h2>Chính sách bảo hành</h2>
                <p>Chào mừng bạn đến với phần Bảo hành của trang web bán điện thoại của chúng tôi! Tại đây, chúng tôi cam kết cung cấp dịch vụ hỗ trợ chất lượng cao và đảm bảo rằng mọi trải nghiệm mua sắm của bạn đều được bảo vệ và hỗ trợ.</p>
                <ol>
                    <li><strong>Cam kết Bảo hành:</strong> Chúng tôi cam kết cung cấp sản phẩm chính hãng và chất lượng cao. Mọi sản phẩm đều đi kèm với thông tin chi tiết về thời gian bảo hành và các điều kiện cụ thể.</li>
                    <li><strong>Dịch vụ hỗ trợ khách hàng:</strong> Chúng tôi luôn sẵn lòng hỗ trợ bạn trong suốt quá trình sử dụng sản phẩm. Đội ngũ chăm sóc khách hàng của chúng tôi luôn sẵn lòng trợ giúp qua điện thoại, email hoặc trực tuyến.</li>
                    <li><strong>Thủ tục bảo hành:</strong> Khi bạn gặp vấn đề với sản phẩm, vui lòng liên hệ với chúng tôi để được hướng dẫn về quy trình bảo hành. Chúng tôi sẽ hỗ trợ bạn với các thủ tục đổi/trả hàng và sửa chữa theo quy định.</li>
                    <li><strong>Dịch vụ sửa chữa chuyên nghiệp:</strong> Chúng tôi có các đối tác sửa chữa chuyên nghiệp và uy tín để đảm bảo rằng sản phẩm của bạn sẽ được sửa chữa một cách nhanh chóng và hiệu quả nhất.</li>
                    <li><strong>Liên hệ:</strong> Nếu bạn cần bất kỳ hỗ trợ nào hoặc có bất kỳ câu hỏi nào về dịch vụ bảo hành, vui lòng liên hệ với chúng tôi qua thông tin liên hệ được cung cấp trên trang web của chúng tôi.</li>
                </ol>
                <button id="close-popup">Đóng</button>
            </div>
        </div>
        <c:set var="cus" value="${sessionScope.account}"/>
        <c:set var="pro" value="${pro}"/>
        <h5 style="text-align: center; margin-top: 20px;">----Lịch sử bảo hành----</h5>
       <div class="table-container">
            <table class="styled-table">
            <thead>
                <tr>
                    <th>WarrantId</th>
                    <th>Serial</th>
                    <th>Create date</th>
                    <th>Reciver date</th>
                    <th>Image</th>
                    <th>Expect date</th>
                    <th>Done date</th>
                    <th>Status</th>
                    <th>Note</th>
                    <th>Warranty report</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="warrs" items="${listWarranty}">
                    <c:set var="warr" value="${warrs}"/>
                    <tr>
                        <td>${warrs.getWarrantyID()}</td>
                        <td>${warrs.getSerialNumbers()}</td>
                        <td>${warrs.getCreateDate()}</td>
                        <td>${warrs.getReciverDate()}</td>
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

                    <td>${warrs.getExpectedDate()}</td>
                    <td>${warrs.getDoneDate()}</td>
                    <td>${warrs.getStatus()}</td>
                    <td>${warrs.getNotes()}</td>
                    <td>
                        <a href="viewMyWarranty?waId=${warrs.getWarrantyID()}">View detail</a>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
       </div>
    </body>
</html>
