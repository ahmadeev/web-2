//  изменяет положение точек и текст лейблов
//  срабатывает на изменение радиуса
var radios = document.querySelectorAll('input[name="RType"]')
radios.forEach(function(radio) {
    radio.addEventListener("click", function() {
        console.log("Произошло изменение радиуса!")

        const svg1 = document.querySelectorAll('.min_R')
        const svg2 = document.querySelectorAll('.min_half_R')
        const svg3 = document.querySelectorAll('.R')
        const svg4 = document.querySelectorAll('.half_R')

        const rows = document.getElementById("result_table").querySelectorAll('.table_row')

        const dots = document.querySelectorAll('.target-dot');
        dots.forEach(dot => {dot.remove()})
        let lastR = parseFloat(radio.value)
        drawDotsAfterRefresh(rows, lastR)

        for(let i=0; i<2; i++) {
            svg1[i].childNodes[0].nodeValue = '' + -lastR
            svg2[i].childNodes[0].nodeValue = '' + -lastR / 2
            svg3[i].childNodes[0].nodeValue = '' + lastR
            svg4[i].childNodes[0].nodeValue = '' + lastR / 2
        }
        console.log("Лейблы были перерисованы!")
    })
})

function drawDot(x, y, R, isHit, isEqual) {
    const CENTER_CONST = 125
    const R_CONST = 80

    let svg = document.querySelector('svg')
    x += R_CONST * x / R + CENTER_CONST
    y += -R_CONST * y / R + CENTER_CONST

    const dot = document.createElementNS('http://www.w3.org/2000/svg', 'circle')
    dot.setAttributeNS(null, 'cx', x);
    dot.setAttributeNS(null, 'cy', y);
    dot.setAttributeNS(null, 'class', 'target-dot');
    dot.setAttributeNS(null, 'r', '3');

    let dotColor
    if (isEqual) {
        dotColor = (isHit ? 'fill: green; stroke: black;' : 'fill: red; stroke: black;')
    } else {
        dotColor = 'fill: white; stroke: black;'
    }

    dot.setAttributeNS(null, 'style', dotColor);
    svg.appendChild(dot);
}

function drawDotsAfterRefresh(rows, lastR) {
    if (rows == null) return
    rows.forEach((row) => {
        if (row != null) {
            let cells = row.querySelectorAll('.result')
            let REqualsLastR = parseInt(cells[2].innerText) === lastR
            drawDot(parseFloat(cells[0].innerText), parseFloat(cells[1].innerText), lastR, (cells[3].innerText === 'true'), REqualsLastR)
        }
    })
}
