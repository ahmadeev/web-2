<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <tbody>
      <jsp:useBean id="results" scope="application" class="beans.Results"/>
      <c:forEach var="hit" items="${results.getResults()}">
        <tr class="tableRow">
          <td class="result">${hit.getX()}</td>
          <td class="result">${hit.getY()}</td>
          <td class="result">${hit.getR()}</td>
          <td class="result">${hit.isResult()}</td>
        </tr>
      </c:forEach>
      </tbody>
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

    $.ajax({
      url: 'controller',
      method: 'post',
      dataType: 'html',
      data: {'action':'clean'},
      success: function(){
        const dots = document.querySelectorAll('.target-dot');
        dots.forEach(dot => {dot.remove()})

        const results = document.querySelectorAll('.result');
        results.forEach(result => {result.remove()})

        //alert(data);
        //return $('html').html(data);
      }
    });
  }
</script>
<script>
  window.onload = function() {
    let table = document.getElementById("resultTable")
    let rows = table.querySelectorAll('.tableRow')
    let lastR = parseInt((rows[rows.length - 1].querySelectorAll('.result'))[2].innerText)

    rows.forEach((row) => {
      if (row != null) {
        var cells = row.querySelectorAll('.result')
        //alert(cells[3].innerText)
        //alert('meow')
        //alert(cells[0].innerText + ' ' + cells[1].innerText + ' ' + cells[3].innerText)
        //(parseFloat(cells[0].innerText) + ' ' + parseFloat(cells[1].innerText) + ' ' + (cells[3].innerText == 'true' ? true : false))
        drawDotAfterRefresh(parseFloat(cells[0].innerText), parseFloat(cells[1].innerText), lastR, (cells[3].innerText == 'true' ? true : false), false)
      }
    })
  }

  function drawDotAfterRefresh(x, y, R, isHit, byClick) {
    let svg = document.querySelector('svg')
    x += 80 * x / R + 125
    y += -80 * y / R + 125

    const dot = document.createElementNS("http://www.w3.org/2000/svg", 'circle')
    dot.setAttributeNS(null, 'cx', x);
    dot.setAttributeNS(null, 'cy', y);
    dot.setAttributeNS(null, 'class', "target-dot");
    dot.setAttributeNS(null, 'r', 3);
    dot.setAttributeNS(null, 'style', (isHit == true ? 'fill: green; stroke: black;' : 'fill: red; stroke: black;'));
    svg.appendChild(dot);
    //alert('точка')
  }

  let svg = document.querySelector('svg')
  let div = document.querySelector("#contentRight")

  svg.addEventListener('click', (event) => {
    let RInput = form.querySelector('input[name="RType"]:checked')
    let isRSet = RInput == null ? false : true
    if (isRSet) {
        let R = RInput.value
        var svgx = ((event.clientX - div.offsetLeft - 25) - 125) / (80 / R)
        var svgy = ((event.clientY - div.offsetTop - 25) - 125) / (-80 / R)
        //alert("x: " + svgx + ", y: " + svgy)

        //drawDot(svgx, svgy, true)
        if (yValueCheck(svgy)) {
            var data = {'xType':svgx, 'yType':svgy, 'RType':R};
            $.ajax({
                url: 'controller',
                method: 'post',
                dataType: 'html',
                data: data,
                success: function(data){
                    //alert(data);
                    return $('html').html(data);
                }
            });
        } else alert('y has to be greater than -5 and less than 3!')
    } else alert('Должно быть передано значение R!')


    //alert('xType: ' + (svgx - 125)/20 + ', yType: ' + (svgy - 125) / (-20) + ', RType: ' + R)
  })
</script>
</body>
</html>
