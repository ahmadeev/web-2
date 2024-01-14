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
    let isRSet = form.querySelector('input[name="RType"]:checked').value == null ? false : true
    if (isRSet) {
        if (byClick = false) {
            x += 150
            y += 150
        }
        const dot = document.createElementNS("http://www.w3.org/2000/svg", 'circle')
        dot.setAttributeNS(null, 'cx', x);
        dot.setAttributeNS(null, 'cy', y);
        dot.setAttributeNS(null, 'class', "target-dot");
        dot.setAttributeNS(null, 'r', 3);
        dot.setAttributeNS(null, 'style', 'fill: white; stroke: black;');
        svg.appendChild(dot);
    }

}

svg.addEventListener('click', (event) => {
    var svgx = event.clientX - div.offsetLeft - 25
    var svgy = event.clientY - div.offsetTop - 25
    //alert("x: " + svgx + ", y: " + svgy)
    drawDot(svgx, svgy, true)
})


