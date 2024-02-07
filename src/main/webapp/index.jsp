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
<%--      <a href="result.jsp">--0--</a>--%>
<%--      <a href="controller">--1--</a><br>--%>
<%--      <a href="areaCheck">--2--</a><br>--%>
<%--      <a href="cleaner">--3--</a>--%>
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
  function disableButton() {
    let submitButton = form.querySelector('#submitButton');
    submitButton.setAttribute("disabled", "")

    $.ajax({
      url: 'controller',
      method: 'post',
      //dataType: 'html',
      data: {'action':'clean'},
      success: function(){
        const dots = document.querySelectorAll('.target-dot');
        dots.forEach(dot => {dot.remove()})

        const results = document.querySelectorAll('.result');
        results.forEach(result => {result.remove()})

        for(let i=0; i<2; i++) {
          svg1[i].childNodes[0].nodeValue = '-R'
          svg2[i].childNodes[0].nodeValue = '-R/2'
          svg3[i].childNodes[0].nodeValue = 'R'
          svg4[i].childNodes[0].nodeValue = 'R/2'
        }

        //alert(data);
        //return $('html').html(data);
      }
    });
  }
</script>
<script>
  let table = document.getElementById("resultTable")
  let rows = table.querySelectorAll('.tableRow')

  const svg1 = document.querySelectorAll('.min_R')
  const svg2 = document.querySelectorAll('.min_half_R')
  const svg3 = document.querySelectorAll('.R')
  const svg4 = document.querySelectorAll('.half_R')

  function drawDotsAfterRefresh(rows, lastR) {
    rows.forEach((row) => {
      if (row != null) {
        var cells = row.querySelectorAll('.result')
        //alert(cells[0].innerText + ' ' + cells[1].innerText + ' ' + cells[3].innerText)
        var REqualsLastR = parseInt(cells[2].innerText) == lastR ? true : false
        drawDot(parseFloat(cells[0].innerText), parseFloat(cells[1].innerText), lastR, (cells[3].innerText == 'true' ? true : false), REqualsLastR)
      }
    })
  }

  window.onload = function() {
    let lastR = parseInt((rows[rows.length - 1].querySelectorAll('.result'))[2].innerText)
    drawDotsAfterRefresh(rows, lastR)

    for(let i=0; i<2; i++) {
      svg1[i].childNodes[0].nodeValue = '' + -lastR
      svg2[i].childNodes[0].nodeValue = '' + -lastR / 2
      svg3[i].childNodes[0].nodeValue = '' + lastR
      svg4[i].childNodes[0].nodeValue = '' + lastR / 2
    }
  }

  var radios = document.querySelectorAll('input[name="RType"]')
  radios.forEach(function(radio) {
    radio.addEventListener("click", function() {
      const dots = document.querySelectorAll('.target-dot');
      dots.forEach(dot => {dot.remove()})
      let lastR = parseInt(radio.value)
      drawDotsAfterRefresh(rows, lastR)

      for(let i=0; i<2; i++) {
        svg1[i].childNodes[0].nodeValue = '' + -lastR
        svg2[i].childNodes[0].nodeValue = '' + -lastR / 2
        svg3[i].childNodes[0].nodeValue = '' + lastR
        svg4[i].childNodes[0].nodeValue = '' + lastR / 2
      }
    })
  })

  function drawDot(x, y, R, isHit, isEqual) {
    let svg = document.querySelector('svg')
    x += 80 * x / R + 125
    y += -80 * y / R + 125

    const dot = document.createElementNS("http://www.w3.org/2000/svg", 'circle')
    dot.setAttributeNS(null, 'cx', x);
    dot.setAttributeNS(null, 'cy', y);
    dot.setAttributeNS(null, 'class', "target-dot");
    dot.setAttributeNS(null, 'r', 3);

    if (isEqual) {
      var dotColor = (isHit == true ? 'fill: green; stroke: black;' : 'fill: red; stroke: black;')
    } else {
      var dotColor = 'fill: white; stroke: black;'
    }

    dot.setAttributeNS(null, 'style', dotColor);
    svg.appendChild(dot);
  }

</script>
<script>
  const svg = document.querySelector('svg')
  const div = document.querySelector("#contentRight")
  const offsetLeft = div.offsetLeft
  const offsetTop = div.offsetTop
  svg.addEventListener('click', (event) => {
    let RInput = form.querySelector('input[name="RType"]:checked')
    let isRSet = RInput == null ? false : true
    if (isRSet) {
        let R = parseInt(RInput.value)
        let svgx = ((event.clientX - offsetLeft - 25) - 125) / (80 / R)
        //var svgy = ((event.clientY - div.offsetTop - 25) - 125) / (-80 / R)
        let svgy = ((event.clientY - offsetTop - 25) - 125) / (-80 / R)
        //alert(svgx + '\n' + svgy)
        alert(event.clientY + "\n" + div.offsetTop)
        alert((event.clientY - div.offsetTop - 25) + '\n' + svgy)
        //alert()
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
        } else alert('Значение y должно быть в пределах от -5 до 3!')
    } else alert('Должно быть передано значение R!')
  })
</script>
<script>
/*  const tableBody = document.querySelector('tbody')
  const rows = tableBody.querySelectorAll('tr')
  rows.forEach(function(row) {
    row.addEventListener("click", function() {alert('meow')})
  })*/
</script>
</body>
</html>
