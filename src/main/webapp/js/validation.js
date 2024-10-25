//  проверка введенных значений, блокировка кнопки в случае невалидных
//  срабатывает на изменение в форме, на ввод в поле y
function validateInputFields() {
    let submitButton = form.querySelector('#submit_button');
    let xInput = form.querySelector("[name='xType']")
    let yInput = form.querySelector('[name="yType"]')
    let RInput = form.querySelector('input[name="RType"]:checked')

    if (xInput === null || yInput === null || RInput === null) return
    else {
        xInput = xInput.value
        yInput = yInput.value
        RInput = RInput.value
    }

    if (xInput !== "null" && parseInt(xInput) != null && yValueCheck(yInput) && parseFloat(RInput) != null) {
        submitButton.removeAttribute("disabled");
    } else {
        submitButton.setAttribute("disabled", "");
    }
    xInput = null
    yInput = null
    RInput = null
}

function yValueCheck(y) {
    return !isNaN(y.replace(",", ".")) && parseFloat(y) <= 5 && parseFloat(y) >= -5;
}

const form = document.getElementById("form")
form.onchange = function() {validateInputFields()}

let yInput = form.querySelector('[name="yType"]')
yInput.oninput = function() {
    validateInputFields();
}
