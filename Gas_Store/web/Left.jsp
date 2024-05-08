
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
        <ul class="list-group category_block">
            <c:forEach items="${listCategories}" var="C">
                <li class="list-group-item text-white ${tag == C.cid? "active":""}"><a href="category?categoryId=${C.cid}">${C.cname}</a></li>
                </c:forEach>

        </ul>
    </div>
    
</div>
