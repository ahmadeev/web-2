<%--
  Created by IntelliJ IDEA.
  User: danis
  Date: 25.10.2024
  Time: 23:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ошибочка случилась</title>
</head>
<body>
    <h2>Упс! Страница недоступна.</h2>
    <p>Вероятно, адрес <b>не находится</b> в списке разрешенных для пользовательских запросов!</p>
    <p>${requestScope.path}</p>
    <a href="index.jsp">back</a>
</body>
</html>
