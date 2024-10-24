const svg = document.querySelector('svg')
const div = document.querySelector("#contentRight")
const offsetLeft = div.offsetLeft
const offsetTop = div.offsetTop
svg.addEventListener('click', (event) => {
    let RInput = form.querySelector('input[name="RType"]:checked')
    let isRSet = RInput == null ? false : true
    if (isRSet) {
        let R = parseInt(RInput.value)
        let svg_x = ((event.clientX - offsetLeft - 25) - 125) / (80 / R)
        let svg_y = ((event.clientY - offsetTop - 25) - 125) / (-80 / R)
        if (yValueCheck(svg_y.toString())) {
            var data = {'xType':svg_x, 'yType':svg_y, 'RType':R};
            $.ajax({
                url: 'controller',
                method: 'post',
                dataType: 'html',
                data: data,
                success: function(data){
                    return $('body').html(data);
                }
            });
        } else alert('Значение y должно быть в пределах от -5 до 3!')
    } else alert('Должно быть передано значение R!')
})
