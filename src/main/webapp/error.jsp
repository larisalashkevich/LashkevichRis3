<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    .container {
      margin-top: 50px;
      text-align: center;
    }

    h1 {
      color: red;
    }

    .btn-primary {
      background-color: blue;
      color: white;
      font-weight: bold;
      text-decoration: none;
      padding: 10px 20px;
      border-radius: 5px;
    }

    .btn-primary:hover {
      background-color: darkblue;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Произошла ошибка!</h1>
  <a href="/ris3/person" class="btn btn-primary">Главная</a>
</div>

<!-- Включение скрипта Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>