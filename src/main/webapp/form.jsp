<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title><c:if test="${empty person}">Добавление</c:if><c:if test="${not empty person}">Редактирование</c:if> человека</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Дополнительные стилизации */
        body {
            padding: 20px;
        }
        .container {
            text-align: center;
            max-width: 500px;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .button-container {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h1><c:if test="${empty person}">Добавление</c:if><c:if test="${not empty person}">Редактирование</c:if> человека</h1>
    <form action="person" method="POST">
        <c:if test="${not empty person}">
            <input type="hidden" name="id" value="<c:out value="${person.id}"/>">
        </c:if>
        <div class="form-group">
            <label for="surname">Фамилия:</label>
            <input type="text" name="surname" id="surname" class="form-control" value="<c:if test="${not empty person}"><c:out value="${person.surname}"/></c:if>" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" class="form-control" value="<c:if test="${not empty person}"><c:out value="${person.email}"/></c:if>" required>
        </div>
        <div class="form-group">
            <label for="firstAddress">Первый адрес:</label>
            <input type="text" name="firstAddress" id="firstAddress" class="form-control" value="<c:if test="${not empty person}"><c:out value="${person.comment.firstAddress}"/></c:if>" required>
        </div>
        <div class="form-group">
            <label for="secondAddress">Второй адрес:</label>
            <input type="text" name="secondAddress" id="secondAddress" class="form-control" value="<c:if test="${not empty person}"><c:out value="${person.comment.secondAddress}"/></c:if>" required>
        </div>
        <div class="button-container">
            <c:if test="${empty person}">
                <input type="hidden" name="action" value="add">
            </c:if>
            <c:if test="${not empty person}">
                <input type="hidden" name="action" value="edit">
            </c:if>
            <button type="submit" class="btn btn-primary">Сохранить</button>
            <a href="personList.jsp" class="btn btn-secondary">Отменить</a>
        </div>
    </form>
</div>

<!-- Включение скрипта Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>