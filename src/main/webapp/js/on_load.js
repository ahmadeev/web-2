//----------------------------------------тут задаются треугольник и четырехугольник
let polygon_points = {
    2: form_polygon_string([
        `${CENTER}, ${CENTER}`,
        `${X_MINUS_R}, ${CENTER}`,
        `${CENTER}, ${Y_HALF_R}`
    ]),
    3: form_polygon_string([
        `${CENTER}, ${CENTER}`,
        `${CENTER}, ${Y_MINUS_R}`,
        `${X_MINUS_HALF_R}, ${Y_MINUS_R}`,
        `${X_MINUS_HALF_R}, ${CENTER}`,
    ]),
}

//----------------------------------------тут задается четверть круга
let path_points = {
    1: form_path_string({
        "L"     : `${X_HALF_R}, ${CENTER}`,
        "A"     : `${R / 2}, ${R / 2}`,
        "ANGLE" : "0",
        "END"   : `${CENTER}, ${Y_HALF_R}`
    }),
}

window.onload = function() {
    const svg = document.querySelector('svg')
    draw_graph(svg, polygon_points, path_points)

    let table = document.getElementById("result_table")
    let rows = table.querySelectorAll('.table_row')

    const svg1 = document.querySelectorAll('.min_R')
    const svg2 = document.querySelectorAll('.min_half_R')
    const svg3 = document.querySelectorAll('.R')
    const svg4 = document.querySelectorAll('.half_R')

    let lastR = parseInt((rows[rows.length - 1].querySelectorAll('.result'))[2].innerText)
    drawDotsAfterRefresh(rows, lastR)

    for(let i=0; i<2; i++) {
        svg1[i].childNodes[0].nodeValue = '' + -lastR
        svg2[i].childNodes[0].nodeValue = '' + -lastR / 2
        svg3[i].childNodes[0].nodeValue = '' + lastR
        svg4[i].childNodes[0].nodeValue = '' + lastR / 2
    }
}
