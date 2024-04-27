<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Список людей</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Дополнительные стилизации */
        body {
            padding: 20px;
        }
        .container {
            text-align: center;
        }
        .add-button {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Список людей</h1>
    <a class="btn btn-primary add-button" href="person?action=add">Добавить человека</a>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Фамилия</th>
            <th scope="col">Email</th>
            <th scope="col">Первый адрес</th>
            <th scope="col">Второй адрес</th>
            <th scope="col">Действия</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="person" items="${people}">
            <tr>
                <td><c:out value="${person.id}" /></td>
                <td><c:out value="${person.surname}" /></td>
                <td><c:out value="${person.email}" /></td>
                <td><c:out value="${person.comment.firstAddress}" /></td>
                <td><c:out value="${person.comment.secondAddress}" /></td>
                <td>
                    <a href="person?action=edit&amp;id=${person.id}" class="btn btn-primary">Редактировать</a>
                    <a href="person?action=delete&amp;id=${person.id}" class="btn btn-danger">Удалить</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Включение скрипта Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>