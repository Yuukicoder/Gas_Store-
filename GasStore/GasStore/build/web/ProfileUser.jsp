<%-- 
    Document   : ProfileUser
    Created on : Jul 20, 2023, 11:01:38 AM
    Author     : 1234
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="component/topbar.jsp" %>
<%@include file="component/navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>GasStore</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="select.css">
        <link href="css/style.css" rel="stylesheet">
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
        <link rel="stylesheet" href="css/productCard.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <style>
            .image-overlay {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                display: none;
                justify-content: center;
                align-items: center;
                color: white;
                font-size: 24px;
                cursor: pointer;
            }


            #profileImage:hover + #imageOverlay,
            #imageOverlay:hover {
                display: flex;
                background: rgba(0, 0, 0, 0.5);
                width: 180px;
                height: 180px;
                border-radius: 50%;
            }
            /* CSS để cấu trúc giao diện */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
            }

            .col-md-3, .col-md-4, .col-md-5 {
                flex-basis: 0;
                flex-grow: 1;
                max-width: 100%;
            }

            .border-right {
                border-right: 1px solid #ccc;
            }

            .d-flex {
                display: flex;
            }

            .align-items-center {
                align-items: center;
            }

            .text-center {
                text-align: center;
            }

            .py-5 {
                padding-top: 3rem;
                padding-bottom: 3rem;
            }

            .mt-5 {
                margin-top: 3rem;
            }

            /* CSS để tạo cửa sổ */
            .overlay {
                display: flex;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;

            }
            body.modal-open {
                overflow: hidden;
            }


            /* CSS để tạo màn hình che phủ */



        </style>
    </head>

    <body>

        <div class="container rounded bg-white mt-3 mb-5">
            <form action="UserProfile" method="post" id="formUpdate" onsubmit="return ValidateProfileForm()" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-3 col-lg-4 col-6 col-sm-12 border-right">
                        <input type="text" name="aimg" value="${acc.getImage()}" hidden>

                        <div class="d-flex flex-column align-items-center text-center p-3 py-5 position-relative">
    <!-- Hiển thị ảnh hiện tại -->
    <img id="profileImage" class="mt-5 rounded-circle" width="50%;" src="${sessionScope.account.getImage()}" alt="This is profile">

    <!-- Overlay để cho phép chọn ảnh -->
    <div id="imageOverlay" class="image-overlay">
        <span class="edit-icon">&#9998;</span> <!-- Unicode for a pen icon -->
    </div>

    <!-- Input để chọn file ảnh -->
    <input type="file" name="pimg" id="imageUpload" class="d-none" accept="image/*" onchange="validateImage(this)">
    
    <!-- Thông báo lỗi -->
    <!--<p id="imageError" style="color: red; display: none;">Please select a valid image file (JPEG, PNG, GIF)</p>-->

    <span class="font-weight-bold">${sessionScope.account.getUserName()}</span>
    <span class="text-black-50">${sessionScope.account.getFullName()}</span>
    <p id="imageError" style="color: red; display: none;">Please select a valid image file (JPEG, PNG, GIF)</p>
</div>

                        <p style="color: red;">${errorrr}</p>
                        <div class="col-md-12">
                            <div class="p-3 center">


                                <button class="border px-3 p-1 add-experience"  type="button">
                                    <a href="change-pass">
                                        <i class="fa fa-edit"></i>&nbsp;Change Password
                                    </a>
                                </button>
                            </div>
                            <br>
                        </div>

                    </div>

                    <div class="col-md-3 col-lg-4 col-6 col-sm-12  border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <p class="text-right text-danger">${requestScope.err}</p>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels mt-2">User Name</label>
                                    <input style="background-color: white;" type="text" class="form-control " value="${sessionScope.account.getUserName()}" name="user" id="uname" readonly>
                                </div>
                                <div class="col-md-12">
                                    <label class="labels mt-2">Full name</label>
                                    <input type="text" class="form-control" value="${sessionScope.account.getFullName()}" name="name" id="ufullname">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels mt-2">Mobile Number</label>
                                    <a style="margin-left: 5px;" href="#" onclick="confirmChangePhone()">Change</a>
                                    <input type="text" class="form-control" value="${sessionScope.account.getPhone()}" name="mobile" id="uphone" readonly>
                                </div>

                                <div class="col-md-12">
                                    <label class="labels mt-2">Email</label>
                                    <a style="margin-left: 5px;" href="#" onclick="confirmChangeEmail()">Change</a>
                                    <input type="text" class="form-control" value="${sessionScope.account.getEmail()}" name="email" id="uemail" readonly>
                                </div>

                                <div class="col-md-12">
                                    <label class="labels mt-2">Address</label>
                                    <input type="text" class="form-control" value="${sessionScope.account.getAddress()}" name="address" id="uaddress">
                                </div>
                            </div>
                            <div class="mt-5 text-center">
                                <button class="btn btn-warning  profile-button" type="submit"  name="update" value="profile">Save Profile</button>
                            </div>
                        </div>
                    </div>

                </div>
            </form>
        </div>


        <!-- Nội dung cửa sổ chứa màn hình chèn phủ -->
        <div class="overlay" id="modalWrapper" style="display: none;">
            <div class="col-md-5 border-right" style="background-color: white; max-width: 30%;">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Change Password</h4>
                    </div>

                    <form action="UserProfile" method="post" id="formUpdate" onsubmit="return savePassword();">
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label class="labels">Enter old password</label>
                                <input type="password" class="form-control" name="oldpass" >
                            </div>
                            <p id="passwordMismatchOld" style="color: red; display: none;">Password incorrect. Please re-enter!</p>
                            <div class="col-md-12">
                                <label class="labels">Enter new Password</label>
                                <input type="password" class="form-control" name="newpass">
                            </div>
                            <p id="passwordMismatchRegex" style="color: red; display: none;">Password must have at least 6 characters, including uppercase and lowercase letters</p>
                            <div class="col-md-12">
                                <label class="labels">Re-Enter new Password</label>
                                <input type="password" class="form-control" name="repass">
                            </div>
                            <p id="passwordMismatch" style="color: red; display: none;">Password does not match. Please re-enter!</p>
                        </div>
                        <div class="mt-5 text-center">
                            <button class="btn btn-primary profile-button" type="submit" onclick="savePassword()" name="update" value="password">Save Password</button>
                            <button class="btn btn-secondary profile-button" type="button" onclick="closePasswordModal()">Cancel</button>
                        </div>
                        <div class="mt-5 text-center">
                            <a href="forgotpass">Forget Password?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--div để chứa thông báo -->
        <div id="successMessage" class="alert alert-success" style="display: none;">
            Update profile successfully!
        </div>

        <%@include file="component/footer.jsp" %>

        <script>
            var passAcc = '<%= request.getAttribute("pass") %>';
        </script>
        <script>
            function confirmChangeEmail() {
                var result = confirm("Are you sure you want to change your email?");
                if (result) {
                    document.getElementById("uemail").removeAttribute("readonly");
                }
            }
        </script>

        <script>
            function confirmSave() {
                var result = confirm("Are you sure you want to update profile?");
                if (result) {
                    document.getElementById("formUpdate1").submit();
                    return true;
                } else {
                    return false;
                }
            }
            function openPasswordModal() {
                document.getElementById('modalWrapper').style.display = 'flex';
                document.body.classList.add('modal-open');
            }

            function closePasswordModal() {
                document.getElementById('modalWrapper').style.display = 'none';
                document.body.classList.remove('modal-open');
            }
            function savePassword() {
                var newPassword = document.getElementsByName('newpass')[0].value;
                var oldpass = document.getElementsByName('oldpass')[0].value;
                var reEnteredPassword = document.getElementsByName('repass')[0].value;
                const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z]).{6,}$/;
                if (toSHA1(oldpass) === passAcc) {
                    if (passwordRegex.test(newPassword)) {
                        if (newPassword === reEnteredPassword) {
                            var result = confirm("Are you sure you want to update password?");
                            if (result) {
                                document.getElementById("formUpdate").submit();
                                return true;
                            }
                        } else {
                            var passwordMismatchMessage = document.getElementById("passwordMismatch");
                            passwordMismatchMessage.style.display = "block";
                            return false;
                        }
                    } else {
                        var passwordMismatchRegex = document.getElementById("passwordMismatchRegex");
                        passwordMismatchRegex.style.display = "block";
                        return false;
                    }
                } else {
                    var passwordMismatchOld = document.getElementById("passwordMismatchOld");
                    passwordMismatchOld.style.display = "block";
                    return false;
                }
            }
        </script>

        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script type="text/javascript">
            function buy(id) {
                var m = document.f.num.value;
                document.f.action = "buy?id=" + id + "&num=" + m;
                document.f.submit();
            }
        </script>
        <script>
            function ValidateProfileForm() {
                var userName = document.getElementById("uname").value;
                var userFName = document.getElementById("ufullname").value;
                var mobileNumber = document.getElementById("uphone").value;
                var email = document.getElementById("uemail").value;
                var address = document.getElementById("uaddress").value;
                // Kiểm tra  chứa ký tự đặc biệt
                var specialCharRegex = /[!@#$%^&*(),.?":{}|<>]/;
                if (specialCharRegex.test(userFName)) {
                    alert("FullName cannot contain special characters!");
                    return false;
                }
                if (userName.trim() === "" || userName === "") {
                    alert("Please input username before update !!!");
                    return false;
                }
                if (userFName.trim() === "" || userFName === "") {
                    alert("Please input Fullname before update !!!");
                    return false;
                }
                if ((mobileNumber) === "" || mobileNumber.trim() === "") {
                    alert("Please input numberphone before update !!!");
                    return false;
                }
                if ((email) === "" || email.trim() === "") {
                    alert("Please input email before update !!!");
                    return false;
                }

                // Kiểm tra số điện thoại là số nguyên dương
                // Kiểm tra số điện thoại là số nguyên dương và có đúng 10 chữ số
                var phoneNumberRegex = /^[0-9]\d{9}$/;
                if (!phoneNumberRegex.test(mobileNumber)) {
                    alert("Mobile number must be a positive integer with exactly 10 digits!");
                    return false;
                }
                //check email
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    alert("Please enter a valid email address!");
                    return false;
                }



            }

        </script>
        <script>
            document.getElementById('profileImage').addEventListener('click', function () {
                this.classList.toggle('blur');
                document.getElementById('imageOverlay').style.display = 'flex';
            });

            document.getElementById('imageOverlay').addEventListener('click', function () {
                document.getElementById('imageUpload').click();
            });

            document.getElementById('imageUpload').addEventListener('change', function (event) {
        const file = event.target.files[0];
        if (file) {
            // Check file type
            const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
            if (!allowedTypes.includes(file.type)) {
                alert('Please select a valid image file (JPEG, PNG, GIF)');
                // Reset input field to clear the invalid file
                event.target.value = '';
                return;
            }

            // Check file size (5MB limit)
            const maxSize = 5 * 1024 * 1024;
            if (file.size > maxSize) {
                alert('File size exceeds 5MB limit');
                // Reset input field to clear the invalid file
                event.target.value = '';
                return;
            }

            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('profileImage').src = e.target.result;
                document.getElementById('profileImage').classList.remove('blur');
                document.getElementById('imageOverlay').style.display = 'none';
            }
            reader.readAsDataURL(file);
        }
    });
        </script>
        <script>
    function validateImage(input) {
        const file = input.files[0];
        const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
        const maxSize = 5 * 1024 * 1024; // 5MB

        // Kiểm tra loại file
        if (!allowedTypes.includes(file.type)) {
            document.getElementById('imageError').style.display = 'block';
            input.value = ''; // Đặt lại giá trị của input để xóa file không hợp lệ
            return;
        }

        // Kiểm tra kích thước file
        if (file.size > maxSize) {
            alert('File size exceeds 5MB limit');
            document.getElementById('imageError').style.display = 'block';
            input.value = ''; // Đặt lại giá trị của input để xóa file không hợp lệ
            return;
        }

        // Nếu hợp lệ, hiển thị ảnh mới
        const reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('profileImage').src = e.target.result;
            document.getElementById('profileImage').classList.remove('blur');
            document.getElementById('imageOverlay').style.display = 'none';
            document.getElementById('imageError').style.display = 'none'; // Ẩn thông báo lỗi
        };
        reader.readAsDataURL(file);
    }
</script>

        <script>
            function confirmChangePhone() {
                var result = confirm("Are you sure you want to change your phone number?");
                if (result) {
                    document.getElementById("uphone").removeAttribute("readonly");
                }
            }
        </script>

    </body>
</html>
