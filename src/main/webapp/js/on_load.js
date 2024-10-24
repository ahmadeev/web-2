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
