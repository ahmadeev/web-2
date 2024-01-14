/*function disableButton() {
    var submitButton = form.querySelector('#submitButton');
    submitButton.setAttribute("disabled", "")
    //window.localStorage.clear()
    for (var i = 1; i != stringCounter; i++) {
        var table = document.getElementById('resultTable')
        table.deleteRow(1)
        stringCounter = 1
        //window.localStorage.setItem('stringCounter', stringCounter)
    }*/

function pupu() {
    var submitButton = form.querySelector('#submitButton');
    var yInput = form.querySelector('[name="yType"]').value;
    var RInput = form.querySelector('input[name="RType"]:checked').value;

    if (parseFloat(yInput) <= 3 && parseFloat(yInput) >= -5 && parseFloat(yInput) != null && parseInt(RInput) != null) {
        submitButton.removeAttribute("disabled");

    } else {
        submitButton.setAttribute("disabled", "");
    }
    yInput = null;
    RInput = null;
}

const form = document.getElementById("form")
form.onchange = function() {pupu()};
let yInput = form.querySelector('[name="yType"]')
yInput.oninput = function() {
    pupu();
}