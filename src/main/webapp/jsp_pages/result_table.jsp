<%--
  Created by IntelliJ IDEA.
  User: danis
  Date: 10.02.2024
  Time: 0:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Results</title>
</head>
<body>
<table align="center" id="result_table">
  <thead>
  <tr>
    <th style="width:40px">x</th>
    <th style="width:40px">y</th>
    <th style="width:40px">R</th>
    <th style="width:80px">Hit</th>
  </tr>
  </thead>
  <tbody>
  <jsp:useBean id="results" scope="application" class="beans.Results"/>
  <c:forEach var="hit" items="${results.getResults()}">
    <tr class="table_row">
      <td class="result">${hit.getX()}</td>
      <td class="result">${hit.getY()}</td>
      <td class="result">${hit.getR()}</td>
      <td class="result">${hit.isResult()}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
