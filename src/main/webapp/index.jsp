<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>web practice #2</title>
  <link rel="icon" href="images/icon.png" type="image/png">
  <link rel="stylesheet" href="stylesheets/style.css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<div id="container">
  <div id="header">
    <h2>Akhmadeev Danis P3209 #95730</h2>
  </div>
  <div class="mainContent">
    <div id="contentLeft">
      <jsp:include page="jsp_pages/form.jsp" />
    </div>
    <div id="contentRight">
      <jsp:include page="jsp_pages/graph.jsp" />
    </div>
  </div>
  <div id="contentCenter">
    <jsp:include page="jsp_pages/result_table.jsp" />
  </div>
</div>

<script src="js/validation.js"></script>
<script src="js/graph.js" defer></script>
<script src="js/reset.js"></script>
<script src="js/graphChanger.js"></script>

<script>
/*  const tableBody = document.querySelector('tbody')
  const rows = tableBody.querySelectorAll('tr')
  rows.forEach(function(row) {
    row.addEventListener("click", function() {alert('meow')})
  })*/
</script>

</body>
</html>
