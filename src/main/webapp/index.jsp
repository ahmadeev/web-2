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
<script src="js/handle_graph.js" defer></script>
<script src="js/reset_button_handler.js"></script>
<script src="js/change_graph.js"></script>
<script src="js/show_dot.js" defer></script>
<script src="js/draw_graph.js" defer></script>
<script src="js/on_load.js" defer></script>

<script>
  const DEFAULT_LABEL_TEXT = "x value: "
  $('.x_input').each(function(index, button) {
    button.onclick = () => {
      console.log("Клик по кнопке x!")
      let hidden_input = document.querySelector("input[name='xType']")
      hidden_input.value = button.value
      let button_value = hidden_input.value
      validateInputFields()
      document.getElementById("x_input_label").innerText = DEFAULT_LABEL_TEXT + button_value
      console.log("Значение x успешно изменено на " + button_value)
    }
  })
</script>

</body>
</html>
