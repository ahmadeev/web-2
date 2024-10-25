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
<form action="controller" method="get" id="form">

    <div class="form_line"><label for="x_input" id="x_input_label">x value:</label></div>
    <input hidden id="x_input" value="null" name="xType" />

    <div class="form_line">
        <input type="button" id="x_input_1" class="x_input" value="-3">
        <input type="button" id="x_input_2" class="x_input" value="-2">
        <input type="button" id="x_input_3" class="x_input" value="-1">
    </div>

    <div class="form_line">
        <input type="button" id="x_input_4" class="x_input" value="0">
        <input type="button" id="x_input_5" class="x_input" value="1">
        <input type="button" id="x_input_6" class="x_input" value="2">
    </div>

    <div class="form_line">
        <input type="button" id="x_input_7" class="x_input" value="3">
        <input type="button" id="x_input_8" class="x_input" value="4">
        <input type="button" id="x_input_9" class="x_input" value="5">
    </div>

    <div class="form_line"><label for="y_input">y value:</label></div>
    <div class="form_line">
        <input type="text" maxlength="10" id="y_input" name="yType" placeholder="-5 to 5" autocomplete="off"> <!-- 17 -->
    </div>
    <div class="form_line"><label>R value:</label></div>
    <div class="form_line">
        <label><input type="radio" name="RType" value="1.0">1.0</label>
        <label><input type="radio" name="RType" value="1.5">1.5</label>
        <label><input type="radio" name="RType" value="2.0">2.0</label>
        <label><input type="radio" name="RType" value="2.5">2.5</label>
        <label><input type="radio" name="RType" value="3.0">3.0</label>
    </div>
    <div class="form_line">
        <button type="submit" disabled="" id="submit_button" name="submit_button">Submit</button>
        <button type="reset" onclick="disableButton()" id="reset_button" name="reset_button">Reset</button>
    </div>
</form>
</body>
</html>
