//  отправляет запрос с координатами на сервер
//  срабатывает по клику на график
const svg = document.querySelector('svg')
const div = document.querySelector("#content_right")
const offsetLeft = div.offsetLeft
const offsetTop = div.offsetTop
svg.addEventListener('click', (event) => {
    let RInput = form.querySelector('input[name="RType"]:checked')
    let isRSet = RInput != null
    if (isRSet) {
        let R = parseInt(RInput.value)
        let svg_x = ((event.clientX - offsetLeft - 25) - 125) / (80 / R)
        let svg_y = ((event.clientY - offsetTop - 25) - 125) / (-80 / R)
        if (yValueCheck(svg_y.toString())) {
            var data = {'xType':svg_x, 'yType':svg_y, 'RType':R};
            $.ajax({
                url: 'controller',
                method: 'get',
                dataType: 'html',
                data: data,
                success: function(data){
                    return $('body').html(data);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Ошибка запроса:", textStatus, errorThrown);
                    alert("ашипка")

                    if (jqXHR === 400) {
                        console.log("Ошибка 400: Неправильный запрос.");
                    } else if (jqXHR.status === 404) {
                        console.log("Ошибка 404: Ресурс не найден.");
                    } else if (jqXHR.status === 500) {
                        console.log("Ошибка 500: Внутренняя ошибка сервера.");
                    } else {
                        console.log("Произошла неизвестная ошибка.");
                    }
                }
            });
        } else alert('Значение y должно быть в пределах от -5 до 3!')
    } else alert('Должно быть передано значение R!')
})
