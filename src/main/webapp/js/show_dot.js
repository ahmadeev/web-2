//  показывает выбранную в таблице точку на графике
//  срабатывает по нажатии на строку таблицы
let table_rows = document.getElementsByTagName('tr')
let table_rows_length = table_rows.length
let dots = document.getElementsByTagName('circle')
const style_attribute_new = 'fill: #E6D4C3FF; stroke: black;'

for(let i = 1; i < table_rows_length; i++) {
    table_rows[i].addEventListener("click", function() {
        const style_attribute_old = dots.item(i-1).getAttribute('style')
        dots.item(i-1).setAttribute("style", style_attribute_new)
        setTimeout(function() {dots.item(i-1).setAttribute("style", style_attribute_old)}, 1500)
        dots.item(i-1).setAttribute("r", '5')
        setTimeout(function() {dots.item(i-1).setAttribute("r", '3')}, 1500)
    })
}
