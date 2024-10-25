function disableButton() {
    let submitButton = form.querySelector('#submit_button');
    submitButton.setAttribute("disabled", "")

    const svg1 = document.querySelectorAll('.min_R')
    const svg2 = document.querySelectorAll('.min_half_R')
    const svg3 = document.querySelectorAll('.R')
    const svg4 = document.querySelectorAll('.half_R')

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
