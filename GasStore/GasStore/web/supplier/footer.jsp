<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/admin/lib/chart/chart.min.js"></script>
            <script src="${pageContext.request.contextPath}/admin/lib/easing/easing.min.js"></script>
            <script src="${pageContext.request.contextPath}/admin/lib/waypoints/waypoints.min.js"></script>
            <script src="${pageContext.request.contextPath}/admin/lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="${pageContext.request.contextPath}/admin/lib/tempusdominus/js/moment.min.js"></script>
            <script src="${pageContext.request.contextPath}/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="${pageContext.request.contextPath}/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

            <!-- Template Javascript -->
            <script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
            <script>
                                                               function changeColor(element) {
                                                                   var paginationLinks = document.querySelectorAll(".pagination a");
                                                                   for (var i = 0; i < paginationLinks.length; i++) {
                                                                       paginationLinks[i].classList.remove("active");
                                                                   }
                                                                   element.classList.add("active");
                                                               }
            </script>
            <script>
                function showMess(id) {
                    var option = confirm('Are you sure to hide?');
                    if (option === true) {
                        window.location.href = 'productDeactive?action=hide&id=' + id;
                    }
                }
            </script>


            <style>
                #productTable {
                    border-collapse: collapse;
                    width: 100%;
                }

                #productTable td, #productTable th {
                    border: 1px solid #ddd;
                    padding: 8px;
                }

                #productTable tr:nth-child(even){
                    background-color: #f2f2f2;
                }

                #productTable tr:hover {
                    background-color: #ddd;
                }

                #productTable th {
                    padding-top: 12px;
                    padding-bottom: 12px;
                    text-align: left;
                    background-color: #22A699;
                    color: white;
                }
            </style>l
    </body>

</html>