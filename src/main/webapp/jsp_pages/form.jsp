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
    <div class="formLine"><label>x value:</label></div>
    <div class="formLine">
        <select id="xInput" name="xType">
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
    <div class="formLine"><label>y value:</label></div>
    <div class="formLine">
        <input type="textbox" maxlength="10" id="textingtext" name="yType" placeholder="-5 to 3" autocomplete="off"> <!-- 17 -->
    </div>
    <div class="formLine"><label>R value:</label></div>
    <div class="formLine">

        <label><input type="radio" name="RType" value="1">1</label>
        <label><input type="radio" name="RType" value="2">2</label>
        <label><input type="radio" name="RType" value="3">3</label>
        <label><input type="radio" name="RType" value="4">4</label>
        <label><input type="radio" name="RType" value="5">5</label>
    </div>
    <div class="formLine">
        <button type="submit" disabled="" id="submitButton" name="submitButton">Submit</button>
        <button type="reset" onclick="disableButton()" id="resetButton" name="resetButton">Reset</button>
    </div>
</form>
</body>
</html>
