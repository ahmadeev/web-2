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

    const dot = document.createElementNS('http://www.w3.org/2000/svg', 'circle')
    dot.setAttributeNS(null, 'cx', x);
    dot.setAttributeNS(null, 'cy', y);
    dot.setAttributeNS(null, 'class', 'target-dot');
    dot.setAttributeNS(null, 'r', '3');

    var dotColor
    if (isEqual) {
        dotColor = (isHit ? 'fill: green; stroke: black;' : 'fill: red; stroke: black;')
    } else {
        dotColor = 'fill: white; stroke: black;'
    }

    dot.setAttributeNS(null, 'style', dotColor);
    svg.appendChild(dot);
}

function drawDotsAfterRefresh(rows, lastR) {
    rows.forEach((row) => {
        if (row != null) {
            var cells = row.querySelectorAll('.result')
            var REqualsLastR = parseInt(cells[2].innerText) === lastR
            drawDot(parseFloat(cells[0].innerText), parseFloat(cells[1].innerText), lastR, (cells[3].innerText === 'true'), REqualsLastR)
        }
    })
}
