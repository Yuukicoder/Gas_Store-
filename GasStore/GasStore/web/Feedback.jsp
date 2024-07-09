<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>GasStore</title>
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

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <%@include file="component/topbar.jsp" %>
        <%@include file="component/navbar.jsp" %>



        <!-- Breadcrumb Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-12">
                    <nav class="breadcrumb bg-light mb-30">
                        <a class="breadcrumb-item text-dark" href="home">Home</a>
                        <a class="breadcrumb-item text-dark" href="shop">Shop</a>
                        <a class="breadcrumb-item text-dark" href="mypurchase">My Purchase</a>
                        <span class="breadcrumb-item active">Feedback</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->


        <!-- Cart Start -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="bg-light p-30">
                        <h4 class="mb-4 text-center">Feedback</h4>

                        <table class="table table-light table-borderless table-hover text-center mb-4">

                            <img  class="img-fluid w-100" src="${requestScope.productid.image}" style="width: 650px; height: 250px ;max-width: 70% ;margin: 0 auto; display: block;" alt="">
                            <p style="    text-align: center; ">${requestScope.productid.name}</p>

                        </table>



                        <div class="d-flex my-3">
                            <p class="mb-0 mr-2">Your Rating * :</p>
                            <div class="text-primary">
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                        </div>
                        <p style="color: black;margin-left: 120px" id="rating-text"></p>
                        <form  onsubmit="return validateReview()" action="feedback" method="post">
                            <div class="form-group">
                                <label for="message">Your Review:</label>
                                <textarea name="text" id="message" cols="30" rows="5" class="form-control"></textarea>
                                <p id="characterMessage" style="color: red;"></p>
                            </div>
                            <input type="hidden" id="rating-input" name="rating" value="0">
                            <input hidden name="date" value="<%
                                                Date dNow = new Date();
                                                SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
                                                String formattedDate = ft.format(dNow);
                                                out.println(formattedDate);
                                   %>"/>
                            <input hidden name="pid" value="${requestScope.productid1}"/>
                            <input hidden name="oid" value="${requestScope.orderid}"/> 

                            <div class="form-group text-center">
                                <input type="submit"  value="Leave Your Review" class="btn btn-primary px-4">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Cart End -->
        <%@include file="component/footer.jsp" %>
        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>


        <script>
                            // Lấy phần tử chứa dòng chữ phí
                            const ratingText = document.getElementById('rating-text');

                            // Lấy danh sách các ngôi sao
                            const stars = document.querySelectorAll('.fa-star');

                            // Biến để lưu số lượng sao được chọn
                            let rating = 0;

                            // Lặp qua từng ngôi sao và thêm sự kiện click
                            stars.forEach((star, index) => {
                                star.addEventListener('click', () => {
                                    rating = index + 1; // Lấy số lượng sao được chọn

                                    // Đặt màu cho các ngôi sao trước đó
                                    for (let i = 0; i <= index; i++) {
                                        stars[i].classList.add('fas', 'text-primary');
                                        stars[i].classList.remove('far');
                                    }

                                    // Đặt màu cho các ngôi sao còn lại
                                    for (let i = index + 1; i < stars.length; i++) {
                                        stars[i].classList.remove('fas', 'text-primary');
                                        stars[i].classList.add('far');
                                    }

                                    // Cập nhật giá trị của input ẩn
                                    document.getElementById('rating-input').value = rating;

                                    // Thay đổi nội dung của dòng chữ phí
                                    switch (rating) {
                                        case 1:
                                            ratingText.textContent = "Không thích";
                                            break;
                                        case 2:
                                            ratingText.textContent = "Bình thường";
                                            break;
                                        case 3:
                                            ratingText.textContent = "Tạm được";
                                            break;
                                        case 4:
                                            ratingText.textContent = "Rất tốt";
                                            break;
                                        case 5:
                                            ratingText.textContent = "Tuyệt vời";
                                            break;
                                        default:
                                            ratingText.textContent = "";
                                    }
                                });
                            });
        </script>
        <script>
            function validateReview() {
                var textareaValue = document.getElementById("message").value;
                var forbiddenCharacters = ['@', '#', '$', '&', '!', '^'];
                var rating = document.getElementById('rating-input').value;

            
                if (rating === "0") {
                    document.getElementById("characterMessage").textContent = "Please select the number of stars before submitting a review!";
                    return false; 
                }

           
                if (textareaValue.trim() === "") {
                    document.getElementById("characterMessage").textContent = "Please enter review text!";
                    return false;
                }

               
                if (textareaValue.length > 200) {
                    document.getElementById("characterMessage").textContent = "Review must not exceed 200 characters!";
                    return false;
                }

             
                for (var i = 0; i < forbiddenCharacters.length; i++) {
                    if (textareaValue.includes(forbiddenCharacters[i])) {
                        
                        document.getElementById("characterMessage").textContent = "You violated the special character rule. Please civilize!";
                        return false;
                    }
                }

                document.getElementById("characterMessage").textContent = "";
                return true;
            }
        </script>


    </body>

</html>


