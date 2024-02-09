let table = document.getElementById("resultTable")
let rows = table.querySelectorAll('.tableRow')

const svg1 = document.querySelectorAll('.min_R')
const svg2 = document.querySelectorAll('.min_half_R')
const svg3 = document.querySelectorAll('.R')
const svg4 = document.querySelectorAll('.half_R')

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