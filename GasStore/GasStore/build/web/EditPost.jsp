<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="ckeditor/ckeditor.js"></script>
        <script src="./tinymce/tinymce.min.js"></script>
        <script src="./js/tinymceConfig.js"></script>
        
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <!-- Libraries Stylesheet -->
        <link href="admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="admin/css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid position-relative d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <%@include file="component/SideBarAdmin.jsp" %>

            <!-- Content Start -->
            <div class="content">
                <%@include file="component/navbarAdmin.jsp" %>
                <form action="EditPost" method="post" enctype="multipart/form-data" onsubmit="return validate_Form2()">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="left-side">
                                    <label class="form-label" style="color: #E57C23">Title</label>
                                    <textarea id="w3review" name="title" rows="4" cols="50" class="form-control col-3">${pdto.getTitle()}</textarea>
                                    <label class="form-label" style="color: #E57C23">Category</label>
                                    <select name="category" id="category" class="form-control col-4">
                                        <option value="${pdto.getPostCate()}" selected>${pdto.getPostCate()}</option>
                                        <c:forEach items="${requestScope.postCategoryDTOs}" var="c">
                                            <option value="${c.getCategoryID()}">${c.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="right-side">
                                    <label class="form-label" style="color: #E57C23">Banner</label>
                                    <input type="file" value="" class="form-control col-3" name="banner" style="width: 80%; margin-bottom: .5rem; margin-top: .5rem">
                                    <img style="width: 12rem; margin: 0.2rem" src="images/Banner/${pdto.getPostbanner()}" alt="alt" id="img"/>
                                </div>
                            </div>
                        </div>
                        <label class="form-label" style="color: #E57C23">Content</label>
                        <textarea name="content" id="content" rows="5" cols="80">${pdto.getContext()}</textarea>
                        
                        <input name="pid" value="${pdto.getPostID()}" hidden> 
                        <input name="pbanner" value="${pdto.getPostbanner()}" hidden> 

                        <button type="submit" class="btn btn-primary" style="margin-top: 30px" value="imageAdd" name="update">Update Post</button> 
                    </div>
                </form>
                <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="admin/lib/chart/chart.min.js"></script>
                <script src="admin/lib/easing/easing.min.js"></script>
                <script src="admin/lib/waypoints/waypoints.min.js"></script>
                <script src="admin/lib/owlcarousel/owl.carousel.min.js"></script>
                <script src="admin/lib/tempusdominus/js/moment.min.js"></script>
                <script src="admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
                <script src="admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
                <!-- Template Javascript -->
                <script src="admin/js/main.js"></script>
                <script>
                    function validate_Form2() {
                        var title = document.getElementById("w3review").value;
                        var banner = document.getElementById("img").value;
                        var description = document.getElementById("content").value;

                        // Kiểm tra không chứa ký tự đặc biệt
                        var specialCharRegex = /[!@#$%^&*{}|<>]/;

                        if (title === "" && description === "") {
                            alert("Please complete full information !!!");
                            return false;
                        }
                        if (specialCharRegex.test(title)) {
                            alert("Title cannot contain special characters!");
                            return false;
                        }
                        if (title.trim().length === 0 || title.trim().length <= 6) {
                            alert("Title must not be empty and longer than 6 characters!");
                            return false;
                        }
                        if (banner === "") {
                            alert("Please choose an image to add post !");
                            return false;
                        }
                        if (description.trim().length <= 20 || description.trim().length === 0) {
                            alert("Content must have more than 20 characters and must not be empty !!!");
                            return false;
                        }
                        return true;
                    }

                    tinymce.init({
                        selector: 'textarea#content',
                        width: '100%',
                        height: 300,
                        plugins: [
                            'advlist', 'autolink', 'link', 'image', 'lists', 'charmap', 'preview', 'anchor', 'pagebreak',
                            'searchreplace', 'wordcount', 'visualblocks', 'code', 'fullscreen', 'insertdatetime', 'media',
                            'table', 'emoticons', 'template', 'codesample'
                        ],
                        toolbar: 'undo redo | styles | bold italic underline | alignleft aligncenter alignright alignjustify |' +
                            'bullist numlist outdent indent | link image | print preview media fullscreen | ' +
                            'forecolor backcolor emoticons',
                        menu: {
                            favs: { title: 'menu', items: 'code visualaid | searchreplace | emoticons' }
                        },
                        menubar: 'favs file edit view insert format tools table',
                        file_picker_types: 'image',
                        file_picker_callback: (cb, value, meta) => {
                            const input = document.createElement('input');
                            input.setAttribute('type', 'file');
                            input.setAttribute('accept', 'image/*');
                            input.addEventListener('change', (e) => {
                                const file = e.target.files[0];
                                const reader = new FileReader();
                                reader.addEventListener('load', () => {
                                    const id = 'blobid' + (new Date()).getTime();
                                    const blobCache = tinymce.activeEditor.editorUpload.blobCache;
                                    const base64 = reader.result.split(',')[1];
                                    const blobInfo = blobCache.create(id, file, base64);
                                    blobCache.add(blobInfo);
                                    cb(blobInfo.blobUri(), { title: file.name });
                                });
                                reader.readAsDataURL(file);
                            });
                            input.click();
                        },
                        content_style: 'body{font-family:Helvetica,Arial,sans-serif; font-size:16px}'
                    });
                </script>
            </div>
        </div>
    </body>
</html>