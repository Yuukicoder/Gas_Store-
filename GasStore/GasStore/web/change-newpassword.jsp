<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!--Author: DPV-->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Change Password</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/q-icon.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .form-container {
                max-width: 800px;
                margin: auto;
                padding: 20px;
                background-color: white;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                display: flex;
                align-items: center;
            }
            .form-content {
                flex: 1;
            }
            .form-image {
                flex: 1;
                padding-left: 20px;
            }
            .form-image img {
                max-width: 100%;
                height: auto;
            }
        </style>
    </head>

    <body>
        <section class="vh-100" style="background-color: #eee;">
            <div class="container h-100 d-flex align-items-center justify-content-center">
                <div class="form-container text-black">
                    <div class="form-content">
                        <p class="text-center h1 fw-bold mb-5">Change Password</p>
                        <form action="changepass" method="post">
                            <div class="mb-3">
                                <label for="form3Example1c" class="form-label">Enter UserName</label>
                                <input type="text" id="form3Example1c" class="form-control" required name="user"/>
                            </div>
                            <div class="mb-3">
                                <label for="form3Example1c" class="form-label">Enter Password</label>
                                <input type="password" id="form3Example1c" class="form-control" required name="pass"/>
                            </div>
                            <div class="mb-3">
                                <label for="form3Example1c" class="form-label">New Password</label>
                                <input type="password" id="form3Example1c" class="form-control" required name="newPassword"/>
                            </div>
                            <div class="mb-3">
                                <label for="form3Example3c" class="form-label">Confirm Password</label>
                                <input type="password" id="form3Example3c" class="form-control" required name="confirmPassword"/>
                            </div>
                            <div class="mb-3 text-danger text-center"><b>${mess}</b></div>
                            <div class="d-grid">
                                <button class="btn btn-primary" type="submit">Confirm</button>
                            </div>
                            <div class="text-center pt-2">
                                <a href="login">Back to Login</a>
                            </div>
                        </form>
                    </div>
                    <div class="form-image">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp" alt="Sample image">
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
