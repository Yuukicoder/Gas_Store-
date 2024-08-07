<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="login.css">
        <title>LOGIN</title>
        <script>
            function forgotBtn() {
                window.location.href = "forgotpass";
            }

            window.onload = function () {
                const container = document.getElementById('container');
                if (<%= request.getAttribute("wrongSignUpInfo") %>) {
                    container.classList.add("active");
                }
            }
        </script>
    </head>

    <body>

        <div class="container" id="container">
            <div class="form-container sign-up">
                <form action="signup" method="POST">
                    <h1>Sign Up</h1>    
                    <input type="text" id="username-input1" class="form-control" placeholder="Username" required autofocus="" name="user">
                    <input type="password" id="password-field1" class="form-control" placeholder="Password" required autofocus="" name="pass">
                    <input type="password" id="repass" class="form-control" placeholder="Repeat Password" required autofocus="" name="repass">
                    <input type="text" id="firstname" class="form-control" placeholder="First Name" required autofocus="" name="firstname">
                    <input type="text" id="lastname" class="form-control" placeholder="Last Name" required autofocus="" name="lastname">
                    <input type="email" id="email" class="form-control" placeholder="Email" required autofocus="" name="email">
                    <input type="tel" id="phone" class="form-control" placeholder="Phone Number" required autofocus="" name="phone">
                    <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Sign Up</button>
                </form>
            </div>

            <div class="form-container sign-in">
                <form action="login" class="signin-form" method="POST" onsubmit="return validateForm()">
                    <h1>Đăng Nhập</h1>
                    <div class="social-icons">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8888/GasStore2/LoginGoogleServlet&response_type=code&client_id=1038400586522-1g779ncgmua1fqbnblc92t35mjn7nf9c.apps.googleusercontent.com&approval_prompt=force" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                        <a href="https://www.facebook.com/v20.0/dialog/oauth?client_id=898071928705250&redirect_uri=http://localhost:8888/GasStore2/LoginFaceBookServlet" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                    </div>
                    <div style="color: red;"><b>${mess}</b></div>
                    <input type="text" id="username-input" class="form-control" placeholder="Username" required="" autofocus="" name="username">
                    <input type="password" id="password-field" class="form-control" placeholder="Password" required="" name="password">
                    <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Sign in</button>
                    <hr>
                    <button class="btn btn-success btn-block" type="button" onclick="forgotBtn()">Forgot Password</button>
                    <hr>
                </form>
            </div>

            <div class="toggle-container">
                <div class="toggle">
                    <div class="toggle-panel toggle-left">
                        <h1>Welcome Back!</h1>
                        <p>Nhập thông tin cá nhân của bạn để sử dụng tất cả các tính năng của trang web</p>
                        <button class="hidden" id="login">Sign In</button>
                    </div>
                    <div class="toggle-panel toggle-right">
                        <h1>Hello, Friend!</h1>
                        <p>Nếu bạn chưa có tài khoản hãy đăng ký</p>
                        <button class="hidden" id="register">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
        <div style="color: red;"><b>${err}</b></div>
        <script src="login.js"></script>
        <script>
                        const form = document.querySelector('.signin-form');
                        const usernameInput = document.getElementById('username-input');
                        const passwordInput = document.getElementById('password-field');
                        const errorMessage = document.getElementById('error-message');
                        const errorMessage2 = document.getElementById('error-message2');

                        form.addEventListener('submit', function (event) {
                            if (usernameInput.value.trim() === '' || passwordInput.value.trim() === '') {
                                event.preventDefault();
                                errorMessage.style.display = 'block';
                            } else {
                                return validateForm();
                            }
                        });
        </script>
        <script>
            function validateForm() {
                var username = document.forms["signin-form"]["username"].value;
                var password = document.forms["signin-form"]["password"].value;
                System.out.println("validateForm()");

                if (validateUsername(username) && validatePassword(password)) {
                    return true;
                } else {
                    alert("Thông tin tài khoản không chính xác!");
                    return false;
                }
            }

            function validateUsername(username) {
                // Đảm bảo username chỉ chứa chữ cái không dấu và số
                var regex = /^[A-Za-z0-9]+$/;
                if (!regex.test(username)) {
                    alert("Username có chứa kí tự đặc biệt!");
                    return false;
                }
            }

            function validatePassword(password) {
                return (password.length >= 6 && !/[^\w\s]/.test(password));
            }

            function checkSpecialCharacters(input) {
                var specialChars = /[^\w\s]/;
                if (specialChars.test(input.value)) {
                    errorMessage2.style.display = 'block';
                } else {
                    errorMessage2.style.display = 'none';
                }
            }
        </script>
        <script>
            // Lấy phần tử icon và trường input password
            const togglePassword = document.querySelector('.toggle-password');
            const password_Input = document.getElementById('password-field');

            // Xử lý sự kiện click vào icon
            togglePassword.addEventListener('click', function () {
                const type = password_Input.getAttribute('type') === 'password' ? 'text' : 'password';
                password_Input.setAttribute('type', type);
            });
            password_Input.setAttribute('type', 'password');
        </script>
    </body>

</html>
