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
        if (!yValueCheck(yToSend)) {
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
    let R = form.querySelector('input[name="RType"]:checked').value;
    drawDot(svgx, svgy, true)
    if (yValueCheck((svgy - 125)/(-(80 / R)))) {
        var data = {'xType':(svgx - 125)/ (80 / R), 'yType':(svgy - 125)/(-(80 / R)), 'RType':R};
        $.ajax({
            url: 'controller',
            method: 'post',
            dataType: 'html',
            data: data,
            success: function(data){
                alert(data);
                return $('html').html(data);
            }
        });
    }

    //alert('xType: ' + (svgx - 125)/20 + ', yType: ' + (svgy - 125) / (-20) + ', RType: ' + R)
})

// function submitButton() {
//     const submitButton = form.querySelector('#submitButton');
//     let xInput = form.getElementById('xInput').value;
//     let yInput = form.querySelector('[name="yType"]').value;
//
//     submitButton.onclick = function() {drawDot(xInput, yInput, false)}
// }

// $("#form").on("submit", function(){
//     //event.preventDefault();
//     submitButton();
//     alert('не проблема')
// });

