<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>admin</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <h3>ADD CATEGORY</h3>
    <form:form action="/admin/add/category" method="post" commandName="category" role="form">
        <div class="form-group">
            <label for="name"> Name: </label>
            <input type="text" name="name" placeholder="Enter category name" id="name" class="form-control">
        </div>
        <div>
            <button class="btn btn-default btn-success" type="submit">Submit</button>
        </div>
    </form:form>


    <h3>ADD POST</h3>
    <form:form action="/admin/add/post" method="post" commandName="post" role="form" enctype="multipart/form-data">
        <div class="form-group">
            <label for="title"> Title: </label>
            <input type="text" id="title" name="title" placeholder="Title" class="form-control">
        </div>

        <div class="form-group">
            <label for="category">Choose category:</label>
            <select id="category" name="categoryId" class="form-control">
                <c:forEach items="${categoryList}" var="category">
                    <option value="${category.id}">${category.name}</option>
                </c:forEach>
            </select>
        </div>

        <div>


        </div>

        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" placeholder="Add description" class="form-control"></textarea>
        </div>

        <div class="form-group">
            <label for="image">Image:</label>
            <input type="file" id="image" name="image" class="form-control">

        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-default btn-success">Submit</button>
        </div>
    </form:form>

    <table class="table table-bordered table-striped">
        <tr>
            <th width="15px">Id</th>
            <th>Cover Photo</th>
            <th>Title</th>
            <th>Category</th>
            <th>Created Date</th>
            <th>Delete Option</th>
            <th>Update Option</th>
        </tr>

        <c:forEach items="${postList}" var="post">
            <tr>
                <td>${post.id}</td>
                <td><img src="/getImage?imageName=${post.coverImage}" style="width: 100px; height:50px"/></td>
                <td>${post.title}</td>
                <td>${category.name}</td>
                <td>${post.createdDate}</td>
                <td><a href="/admin/delete/post/${post.id}" type="button" class="btn btn-sm btn-danger">Delete</a></td>
                <td><a href="/update/post/${post.id}" type="button" class="btn btn-sm btn-primary">Update</a></td>

            </tr>
        </c:forEach>
    </table>


</div>

</body>
</html>
