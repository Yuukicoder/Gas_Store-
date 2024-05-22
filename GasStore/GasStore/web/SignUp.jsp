<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!--Author: DPV-->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Sign Up</title>
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
                        <p class="text-center h1 fw-bold mb-5">Sign Up</p>
                        <p style="color: red">${err}</p>
                        <form action="signup" method="post">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" value="${user}" id="username" class="form-control" required name="username"/>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" value="${pass}" id="password" class="form-control" required name="password"/>
                            </div>
                            <div class="mb-3">
                                <label for="repass" class="form-label">Repeat Password</label>
                                <input type="password"  id="repass" class="form-control" required name="repass"/>
                            </div>
                            <div class="mb-3">
                                <label for="firstname" class="form-label">First Name</label>
                                <input type="text" value="${firstname}" id="firstname" class="form-control" required name="firstname"/>
                            </div>
                            <div class="mb-3">
                                <label for="lastname" class="form-label">Last Name</label>
                                <input type="text" value="${lastname}" id="lastname" class="form-control" required name="lastname"/>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" value="${gmail}" id="email" class="form-control" required name="email"/>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone Number</label>
                                <input type="tel" value="${phone}" id="phone" class="form-control" required name="phone"/>
                            </div>
                            <div class="mb-3 text-danger text-center"><b>${mess}</b></div>
                            <div class="d-grid">
                                <button class="btn" style="background-color: #0077b6; color: white" type="submit">Sign Up</button>
                            </div>
                            <div class="text-center pt-2">
                                <a href="login" style="color: #0077b6">Back to Login</a>
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
