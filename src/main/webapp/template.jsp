<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title><c:if test="${empty comment}">Adding</c:if><c:if test="${not empty comment}">Editing</c:if> comment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: lightgray;
        }
    </style>
</head>
<body>
<div class="text-center m-2">
    <a class="btn btn-dark" href="comments">Index page</a>
</div>
<div class="container text-center">
    <form action="comments" method="POST">
        <c:if test="${not empty comment}">
            <input type="hidden" name="id" value="<c:out value="${comment.id}"/>">
        </c:if>
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" class="form-control-lg m-1" value="<c:if test="${not empty comment}"><c:out value="${comment.username}"/></c:if>" required>
        </div>
        <div class="form-group">
            <label for="text">Text:</label>
            <input type="text" name="text" id="text" class="form-control-lg m-1" value="<c:if test="${not empty comment}"><c:out value="${comment.text}"/></c:if>" required>
        </div>
        <div class="button-container m-3">
            <c:if test="${empty comment}">
                <input type="hidden" name="action" value="add">
            </c:if>
            <c:if test="${not empty comment}">
                <input type="hidden" name="action" value="edit">
            </c:if>
            <button type="submit" class="btn btn-success">Save</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>