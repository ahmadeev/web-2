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
    <h2>Akhmadeev Danis P3309 #777</h2>
  </div>
  <div class="content_main">
    <div id="content_left">
      <jsp:include page="jsp_pages/form.jsp" />
    </div>
    <div id="content_right">
      <jsp:include page="jsp_pages/graph.jsp" />
    </div>
  </div>
  <div id="content_center">
    <jsp:include page="jsp_pages/result_table.jsp" />
  </div>
</div>

<script src="js/validation.js"></script>
<script src="js/graph.js" defer></script>
<script src="js/reset_button_handler.js"></script>
<script src="js/graph_changer.js"></script>
<script src="js/show_dot.js" defer></script>
<script src="js/on_load.js" defer></script>

</body>
</html>
