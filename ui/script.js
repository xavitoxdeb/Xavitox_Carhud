window.addEventListener("message", (event) => {
    var v = event.data;
    //make switch
    switch (v.action) {

    case 'showCarhud': 
        $('#velocidad').text(v.velo.toFixed(0));
        $('#gasolina').text(v.gaso.toFixed(0));
        if (v.cinturon == true) {
            $('#on span').text('ON');
            $('#on').css({'color':'green'})
        } else if(v.cinturon == false) {
            $('#on span').text('OFF');
            $('#on').css({'color':'red'})
        }
        $('.raya').show(500)
    break; 

    case 'hideCarhud':
        $('.raya').hide(500)
    break;

    }
});