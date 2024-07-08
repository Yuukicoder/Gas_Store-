<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <title>Change Password</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/signup.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
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
        </style>
    </head>

    <body class="img js-fullheight" style="background-image: url(img/acc.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="overlay" id="modalWrapper">
                    <div class="col-md-5 border-right" style="background-color: white; max-width: 30%;">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Change Password</h4>
                            </div>

                            <form action="change-pass" method="post" id="formUpdate" onsubmit="return savePassword();">
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Enter old password</label>
                                        <input type="password" class="form-control" name="oldpass">
                                    </div>
                                    <c:if test="${passwordMismatchOld}">
                                        <p id="passwordMismatchOld" style="color: red;">Password incorrect. Please re-enter!</p>
                                    </c:if>
                                    <div class="col-md-12">
                                        <label class="labels">Enter new Password</label>
                                        <input type="password" class="form-control" name="newpass">
                                    </div>
                                    <c:if test="${passwordMismatchRegex}">
                                        <p id="passwordMismatchRegex" style="color: red;">Password must have at least 6 characters, including uppercase and lowercase letters</p>
                                    </c:if>
                                    <div class="col-md-12">
                                        <label class="labels">Re-Enter new Password</label>
                                        <input type="password" class="form-control" name="repass">
                                    </div>
                                    <c:if test="${passwordMismatch}">
                                        <p id="passwordMismatch" style="color: red;">Password does not match. Please re-enter!</p>
                                    </c:if>
                                </div>
                                <div class="mt-5 text-center">
                                    <button class="btn btn-primary profile-button" type="submit" name="update" value="password">Save Password</button>
                                    <button class="btn btn-secondary profile-button" type="button" onclick="closePasswordModal()">Cancel</button>
                                </div>
                                <div class="mt-5 text-center">
                                    <a href="forgotpass">Forget Password?</a>
                                </div>
                            </form>
                            <div class="m-4 mt-4">
                        <a href="UserProfile" class="btn btn-primary">Back </a>
                    </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </section>
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>

        <script>
                                        var passAcc = '<%= session.getAttribute("passW") %>';

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

                                        function toSHA1(str) {
                                            var salt = "leuleulamsaomabietduocmatkhau";
                                            str = str + salt;

                                            var hash = CryptoJS.SHA1(CryptoJS.enc.Utf8.parse(str));
                                            var hashBase64 = CryptoJS.enc.Base64.stringify(hash);

                                            return hashBase64;
                                        }
        </script>
    </body>

</html>
