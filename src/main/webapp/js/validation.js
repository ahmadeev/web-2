function pupu() {
    var submitButton = form.querySelector('#submitButton');
    var yInput = form.querySelector('[name="yType"]').value;
    var RInput = form.querySelector('input[name="RType"]:checked').value;

    if (yValueCheck(yInput) && parseInt(RInput) != null) {
        submitButton.removeAttribute("disabled");

    } else {
        submitButton.setAttribute("disabled", "");
    }
    yInput = null;
    RInput = null;
}

function yValueCheck(y) {
    if (!isNaN(y.replace(",", ".")) && y != null && parseFloat(y) <= 3 && parseFloat(y) >= -5) return true
    else return false
}

const form = document.getElementById("form")
form.onchange = function() {pupu()};
let yInput = form.querySelector('[name="yType"]')
yInput.oninput = function() {
    pupu();
}
