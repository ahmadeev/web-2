<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>web practice #2</title>
  <link rel="icon" href="assets/icon.png" type="image/png">
  <link rel="stylesheet" href="stylesheets/style.css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<div id="container">
  <div id="header">
    <h2>Ahmadeev Danis P3209 #95730</h2>
  </div>
  <div class="mainContent">
    <div id="contentLeft">
      <a href="controller">--1--</a><br>
      <a href="areaCheck">--2--</a><br>
      <a href="result.jsp">--0--</a>
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

          <input type="textbox" id="textingtext" name="yType" placeholder="-5 to 3" maxlength="10" autocomplete="off"> <!-- 17 -->
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

    </div>
    <div id="contentRight">
      <jsp:include page="graph.jsp" />
    </div>

  </div>
  <div id="contentCenter">
    <table align="center" id="resultTable">
      <thead>
      <tr>
        <th style="width:40px">x</th>
        <th style="width:40px">y</th>
        <th style="width:40px">R</th>
        <th style="width:80px">Hit</th>
      </tr>
      </thead>
    </table>
  </div>
</div>
<script src="js/validation.js"></script>
<script src="js/graph.js"></script>
<script>
  alert('я родился')
</script>
<script>
  function disableButton() {
    let submitButton = form.querySelector('#submitButton');
    submitButton.setAttribute("disabled", "")

    const dots = document.querySelectorAll('.target-dot');
    dots.forEach(dot => {dot.remove()})
  }
</script>
</body>
</html>
