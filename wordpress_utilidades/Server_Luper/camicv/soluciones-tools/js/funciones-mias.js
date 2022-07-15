
function BuscarReemplazarEnlaces($textoBuscar,$urlReemplazar){
        document.querySelectorAll('a').forEach(ele => {
            if(ele.getAttribute('href').indexOf($textoBuscar) != -1 ) {
                //console.log('se encontro',ele);
                ele.setAttribute('href',$urlReemplazar)
            }

        });

}

function docReady(fn) {
    // see if DOM is already available
    if (document.readyState === "complete" || document.readyState === "interactive") {
        // call on next available tick
        setTimeout(fn, 1);
    } else {
        document.addEventListener("DOMContentLoaded", fn);
    }
}

