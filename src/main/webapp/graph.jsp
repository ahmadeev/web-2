<%--
  Created by IntelliJ IDEA.
  User: danis
  Date: 13.01.2024
  Time: 0:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Graph component</title>
</head>
<body>
<svg width="250" height="250">
    <g class="x-grid">
        <line stroke="black" x1="0" x2="250" y1="125" y2="125"></line>
    </g>
    <g class="y-grid">
        <line stroke="black" x1="125" x2="125" y1="0" y2="250"></line>
    </g>

    <g class="grid-labels">
        <text x="135" y="15">Y</text>
        <text x="235" y="105">X</text>
    </g>

    <polygon fill="black" points="125, 0 130, 10 120, 10" stroke="black"></polygon>
    <polygon fill="black" points="250, 125 240, 120 240, 130" stroke="black"></polygon>

    <polygon fill="white" fill-opacity="0.7" stroke="black" points="125, 125 125, 165 85, 125"></polygon>
    <polygon fill="white" fill-opacity="0.7" stroke="black" points="125, 125 125, 45 85, 45 85, 125"></polygon>
    <path fill="white" fill-opacity="0.7" stroke="black" d="M 125, 125 L 125, 85 A 40, 40 90 0, 1 165, 125"></path>

    <g class="labels x-labels">
        <text x="45" y="115">-R</text>
        <text x="90" y="115">-R/2</text>
        <text x="165" y="140">R/2</text>
        <text x="205" y="140">R</text>
    </g>
    <g class="labels y-labels">
        <text x="130" y="205">-R</text>
        <text x="130" y="165">-R/2</text>
        <text x="130" y="80">R/2</text>
        <text x="130" y="40">R</text>
    </g>
    <g class="pridumaupozhe">
        <line stroke="black" x1="122" x2="128" y1="205" y2="205"></line>
        <line stroke="black" x1="122" x2="128" y1="165" y2="165"></line>
        <line stroke="black" x1="122" x2="128" y1="85" y2="85"></line>
        <line stroke="black" x1="122" x2="128" y1="45" y2="45"></line>

        <line stroke="black" y1="122" y2="128" x1="205" x2="205"></line>
        <line stroke="black" y1="122" y2="128" x1="165" x2="165"></line>
        <line stroke="black" y1="122" y2="128" x1="85" x2="85"></line>
        <line stroke="black" y1="122" y2="128" x1="45" x2="45"></line>
    </g>
</svg>
</body>
</html>
