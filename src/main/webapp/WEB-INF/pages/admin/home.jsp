<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" style="height: 250px; width: 900px;">
    <div><img src="/img/web-development.jpg " class="img-rounded" width="900px" height="250px"></div>


    <div style="height: 800px; width: 640px; float: left">

        <c:if test="${!empty postList}">
            <c:forEach items="${postList}" var="post">
            <h3>${post.title}</h3>
            <img src="/getImage?imageName=${post.coverImage}" style="width: 640px; height: 160px"
                 class="img-rounded">
                <p>${post.createdDate}</p>
            <p style="text-align: justify">${post.description}</p>
            </c:forEach>
        </c:if>

    </div>


    <div style="height: 800px; width: 220px; float: left; padding-left: 90px; padding-top: 28px">
        <div style="padding-bottom: 68px">
            <c:if test="${!empty categoryList}">
                <c:forEach items="${categoryList}" var="category">
                    <h3 style="font-family:Tahoma; color: steelblue"><a
                            href="/home/category/${category.id}">${category.name}</a></h3>
                </c:forEach>
            </c:if>

        </div>

        <button type="button" class="btn btn-basic" style="font-family:Tahoma"><a href="/admin">ADMIN PANEL</a></button>
    </div>


</div>
</body>
</html>