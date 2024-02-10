<jsp:useBean id="result" scope="request" class="beans.Hit"/>
<%--
  Created by IntelliJ IDEA.
  User: danis
  Date: 03.02.2024
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="images/icon.png" type="image/png">
    <link rel="stylesheet" href="stylesheets/style.css">
    <title>result table</title>
</head>
<body>
<div id="container">
    <div id="mainContent">
        <div align="center" id="contentCenter">
            <table align="center" id="resultTable">
                <thead>
                <tr>
                    <th style="width:40px">x</th>
                    <th style="width:40px">y</th>
                    <th style="width:40px">R</th>
                    <th style="width:80px">Hit</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${result.getX()}</td>
                    <td>${result.getY()}</td>
                    <td>${result.getR()}</td>
                    <td>${result.isResult()}</td>
                </tr>
                </tbody>
            </table>
            <a href="index.jsp">back</a>
        </div>
    </div>
</div>



<%
    ServletContext context = request.getServletContext();
    request.setAttribute("results", context.getAttribute("results"));
%>

</body>
</html>
