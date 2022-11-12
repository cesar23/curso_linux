//Cambiar la url del boton login
(function(funcName, baseObj) {
    // El nombre de la función pública por defecto es window.docReady
    // pero puede pasar su propio objeto y su propio nombre de función y esos serán usados
    // si desea ponerlos en un espacio de nombres diferente
    funcName = funcName || "docReady";
    baseObj = baseObj || window;
    var readyList = [];
    var readyFired = false;
    var readyEventHandlersInstalled = false;

    // llamar a esto cuando el documento esté listo
    // esta función se protege a sí misma contra ser llamada más de una vez
    function ready() {
        if (!readyFired) {
            // esto debe establecerse en verdadero antes de comenzar a llamar devoluciones de llamada
            readyFired = true;
            for (var i = 0; i < readyList.length; i++) {
                // si ocurre una devolución de llamada aquí para agregar nuevos controladores listos,
                // la función docReady () verá que ya se disparó
                // y programará la devolución de llamada para que se ejecute justo después
                // este ciclo de eventos finaliza, por lo que todos los controladores se ejecutarán
                // en orden y no se agregarán nuevos a readyList
                // mientras procesamos la lista
                readyList[i].fn.call(window, readyList[i].ctx);
            }
            // Permitir que los cierres de estas funciones se liberen
            readyList = [];
        }
    }

    function readyStateChange() {
        if ( document.readyState === "complete" ) {
            ready();
        }
    }

    // Esta es la única interfaz pública
    // docReady (fn, contexto);
    // el argumento de contexto es opcional - si está presente, será pasado
    // como argumento para la devolución de llamada
    baseObj[funcName] = function(callback, context) {
        if (typeof callback !== "function") {
            throw new TypeError("callback for docReady(fn) must be a function");
        }
        // si listo ya se ha disparado, simplemente programe la devolución de llamada
        // para disparar de forma asincrónica, pero de inmediato
        if (readyFired) {
            setTimeout(function() {callback(context);}, 1);
            return;
        } else {
            // agrega la función y el contexto a la lista
            readyList.push({fn: callback, ctx: context});
        }
        // si el documento ya está listo, programe la función lista para que se ejecute
        if (document.readyState === "complete") {
            setTimeout(ready, 1);
        } else if (!readyEventHandlersInstalled) {
            // de lo contrario, si no tenemos controladores de eventos instalados, instálelos
            if (document.addEventListener) {
                // la primera opción es el evento DOMContentLoaded
                document.addEventListener("DOMContentLoaded", ready, false);
                // la copia de seguridad es un evento de carga de ventana
                window.addEventListener("load", ready, false);
            } else {
                // debe ser IE
                document.attachEvent("onreadystatechange", readyStateChange);
                window.attachEvent("onload", ready);
            }
            readyEventHandlersInstalled = true;
        }
    }
})("docReady", window);

docReady(function() {
    document.querySelector('h1 a').setAttribute("href", "https://solucionessystem.com/?link=admin-wp");
});

