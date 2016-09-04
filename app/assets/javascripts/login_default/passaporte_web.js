var passaporte_web_bar;
function verifica_passaporte_web() {
    passaporte_web_bar = document.getElementById("PassaporteWeb");
    if (passaporte_web_bar!=undefined && passaporte_web_bar.clientHeight != undefined && passaporte_web_bar.clientHeight > 0) {
        passaporte_web_bar.className = 'navbar-fixed-top';
        //document.body.className+= ' passaporte_web';
        var event_passaporte_web_bar = new CustomEvent('passaporteWebBar', {detail: {element: passaporte_web_bar}});
        window.dispatchEvent(event_passaporte_web_bar);
    } else {
        setTimeout(verifica_passaporte_web, 500);
    }
}; verifica_passaporte_web();