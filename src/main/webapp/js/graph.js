let svg = document.querySelector('svg')
let div = document.querySelector("#contentRight")

/*svg.addEventListener('click', (event) => {
    var svgx = event.clientX - div.offsetLeft - 25
    var svgy = event.clientY - div.offsetTop - 25
    //alert("x: " + svgx + ", y: " + svgy)

    const dot = document.createElementNS("http://www.w3.org/2000/svg", 'circle')
    dot.setAttributeNS(null, 'cx', svgx);
    dot.setAttributeNS(null, 'cy', svgy);
    dot.setAttributeNS(null, 'class', "target-dot");
    dot.setAttributeNS(null, 'r', 3);
    dot.setAttributeNS(null, 'style', 'fill: white; stroke: black;');
    svg.appendChild(dot);
})*/
function drawDot(x, y, byClick) {
    let svg = document.querySelector('svg')
    let R = form.querySelector('input[name="RType"]:checked').value
    let isRSet = R == null ? false : true
    if (isRSet) {
        if (byClick = false) {
            var xToSend = x
            var yToSend = y
            x += 150
            y += 150
        } else {
            var xToSend = (x - 125)/ (80 / R)
            var yToSend = (y - 125)/(-(80 / R))
        }
        if (yToSend < -5 || yToSend > 3) {
            alert('y has to be greater than -5 and less than 3!')
        }
        else {
            const dot = document.createElementNS("http://www.w3.org/2000/svg", 'circle')
            dot.setAttributeNS(null, 'cx', x);
            dot.setAttributeNS(null, 'cy', y);
            dot.setAttributeNS(null, 'class', "target-dot");
            dot.setAttributeNS(null, 'r', 3);
            dot.setAttributeNS(null, 'style', 'fill: white; stroke: black;');
            svg.appendChild(dot);
        }
    }

}

svg.addEventListener('click', (event) => {
    var svgx = event.clientX - div.offsetLeft - 25
    var svgy = event.clientY - div.offsetTop - 25
    //alert("x: " + svgx + ", y: " + svgy)
    drawDot(svgx, svgy, true)

    let R = form.querySelector('input[name="RType"]:checked').value;
    var data = {'xType':(svgx - 125)/ (80 / R), 'yType':(svgy - 125)/(-(80 / R)), 'RType':R};
    $.ajax({
        url: 'controller',
        method: 'post',
        dataType: 'html',
        data: data,
        success: function(data){
            alert(data);
        }
    });
    //alert('xType: ' + (svgx - 125)/20 + ', yType: ' + (svgy - 125) / (-20) + ', RType: ' + R)
})


