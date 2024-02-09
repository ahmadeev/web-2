const svg = document.querySelector('svg')
const div = document.querySelector("#contentRight")
const offsetLeft = div.offsetLeft
const offsetTop = div.offsetTop
svg.addEventListener('click', (event) => {
    let RInput = form.querySelector('input[name="RType"]:checked')
    let isRSet = RInput == null ? false : true
    if (isRSet) {
        let R = parseInt(RInput.value)
        let svgx = ((event.clientX - offsetLeft - 25) - 125) / (80 / R)
        //var svgy = ((event.clientY - div.offsetTop - 25) - 125) / (-80 / R)
        let svgy = ((event.clientY - offsetTop - 25) - 125) / (-80 / R)
        //alert(svgx + '\n' + svgy)
        /*        alert(event.clientY + "\n" + div.offsetTop)
                alert((event.clientY - div.offsetTop - 25) + '\n' + svgy)*/
        //alert()
        if (yValueCheck(svgy.toString())) {
            var data = {'xType':svgx, 'yType':svgy, 'RType':R};
            $.ajax({
                url: 'controller',
                method: 'post',
                dataType: 'html',
                data: data,
                success: function(data){
                    //alert(data);
                    return $('body').html(data);
                }
            });
        } else alert('Значение y должно быть в пределах от -5 до 3!')
    } else alert('Должно быть передано значение R!')
})