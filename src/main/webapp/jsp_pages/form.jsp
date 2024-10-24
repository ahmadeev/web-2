<%--
  Created by IntelliJ IDEA.
  User: danis
  Date: 10.02.2024
  Time: 0:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Form component</title>
</head>
<body>
<form action="controller" method="post" id="form">
    <div class="form_line"><label for="x_input">x value:</label></div>
    <div class="form_line">
        <select id="x_input" name="xType">
            <option value="-2">-2</option>
            <option value="-1.5">-1.5</option>
            <option value="-1">-1</option>

            <option value="-0.5">-0.5</option>
            <option value="0">0</option>
            <option value="0.5">0.5</option>

            <option value="1">1</option>
            <option value="1.5">1.5</option>
            <option value="2">2</option>
        </select>
    </div>
    <div class="form_line"><label for="y_input">y value:</label></div>
    <div class="form_line">
        <input type="text" maxlength="10" id="y_input" name="yType" placeholder="-5 to 3" autocomplete="off"> <!-- 17 -->
    </div>
    <div class="form_line"><label>R value:</label></div>
    <div class="form_line">
        <label><input type="radio" name="RType" value="1">1</label>
        <label><input type="radio" name="RType" value="2">2</label>
        <label><input type="radio" name="RType" value="3">3</label>
        <label><input type="radio" name="RType" value="4">4</label>
        <label><input type="radio" name="RType" value="5">5</label>
    </div>
    <div class="form_line">
        <button type="submit" disabled="" id="submit_button" name="submit_button">Submit</button>
        <button type="reset" onclick="disableButton()" id="reset_button" name="reset_button">Reset</button>
    </div>
</form>
</body>
</html>
