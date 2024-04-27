<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>comment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: lightgray;
        }
        table {
            width: 100%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="text-center m-2">
        <a class="btn btn-dark" href="comments?action=add">Add new comment</a>
    </div>
    <table class="table table-danger text-center">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Username</th>
            <th scope="col">Text</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="comment" items="${comments}">
            <tr>
                <td><c:out value="${comment.id}" /></td>
                <td><c:out value="${comment.username}" /></td>
                <td><c:out value="${comment.text}" /></td>
                <td>
                    <div class="btn-group" role="group" aria-label="Actions">
                        <a href="comments?action=edit&amp;id=${comment.id}" class="btn btn-warning">Edit</a>
                        <a href="comments?action=delete&amp;id=${comment.id}" class="btn btn-danger">Delete</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Включение скриптов Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>