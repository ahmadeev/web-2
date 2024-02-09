function disableButton() {
    let submitButton = form.querySelector('#submitButton');
    submitButton.setAttribute("disabled", "")

    $.ajax({
        url: 'controller',
        method: 'post',
        data: {'action':'clean'},
        success: function(){
            const dots = document.querySelectorAll('.target-dot');
            dots.forEach(dot => {dot.remove()})

            const results = document.querySelectorAll('.result');
            results.forEach(result => {result.remove()})

            for(let i=0; i<2; i++) {
                svg1[i].childNodes[0].nodeValue = '-R'
                svg2[i].childNodes[0].nodeValue = '-R/2'
                svg3[i].childNodes[0].nodeValue = 'R'
                svg4[i].childNodes[0].nodeValue = 'R/2'
            }

        }
    });
}
