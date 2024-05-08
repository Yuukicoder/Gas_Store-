
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
        function doforgetPass() {
            window.location.href = "changepass";
        }
    </script>
</head>

<body>

    <div class="container" id="container">
        <div class="form-container sign-up">
            <form action="signup">
                <h1>Create Account</h1>
                <div class="social-icons">
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8080/Test6-FrontEnd(1)/login&response_type=code&client_id=740029421192-c126d7mbqg2666s0s1lr15ana8k6i45m.apps.googleusercontent.com&approval_prompt=force" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                </div>
                <span>or use your email for registeration</span>
                <input type="text" id="user-email" class="form-control" placeholder="Username" required autofocus="" name="user">
                <input type="password" id="user-pass" class="form-control" placeholder="Password" required autofocus="" name="pass">
                <input type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required autofocus="" name="repass">
                <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Sign Up</button>
            </form>
        </div>

        <div class="form-container sign-in">
            <form action="login">
                <h1>Đăng Nhập</h1>
                <div class="social-icons">
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8080/Test6-FrontEnd(1)/login&response_type=code&client_id=740029421192-c126d7mbqg2666s0s1lr15ana8k6i45m.apps.googleusercontent.com&approval_prompt=force" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                </div>
                <span>Hoặc username password</span>
                <div style="color: red;"><b>${mess}</b></div>
                <input type="text" id="inputEmail" class="form-control" placeholder="Username" required="" autofocus="" name="Username">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="" name="Password">

                <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Sign in</button>
                <hr>
                <button class="btn btn-success btn-block" type="button" onclick="doforgetPass()">Change Password</button>
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
                    <p>Đăng ký với thông tin cá nhân của bạn để sử dụng tất cả các tính năng của trang web</p>
                    <button class="hidden" id="register">Sign Up</button>
                </div>
            </div>
        </div>
    </div>

    <script src="login.js"></script>
</body>

</html>