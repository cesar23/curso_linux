jQuery(document).ready(function () {

    var panel_activos_1 = ["custom_dashboard_widget", "dashboard_widget"];
    var panel_activos_2 = [];


//------------------------------------------------------------
//-------------------Ocultar Paneles del Escritorio---------------------
//----------------------------------------------------------------

    // si estamos en la pagina dashboard ocultaremos paneles
    if (document.querySelectorAll("#dashboard-widgets").length) {
        //3. ocultar paneles N-1
        if (document.querySelector("#postbox-container-1")) {
            var elements = document.querySelectorAll("#normal-sortables div");
            elements.forEach(elemento => {
                var id = elemento.getAttribute("id");

                if (document.getElementById(id)) {
                    if (panel_activos_1.includes(id)) {

                        document.getElementById(id).style.display = "block";
                    } else {

                        document.getElementById(id).style.display = "none";
                    }
                }
            });
        }

        //4. ocultar paneles N-2
        if (document.querySelector("#postbox-container-2")) {
            var elements = document.querySelectorAll("#side-sortables div");
            elements.forEach(elemento => {
                var id = elemento.getAttribute("id");
                //Si existe el div
                if (document.querySelector("#" + id)) {
                    if (panel_activos_2.includes(id)) {
                        document.getElementById(id).style.display = "block";
                    } else {
                        document.getElementById(id).style.display = "none";
                    }
                }
            });
        }

        //4. ocultar paneles N-3
        if (document.querySelector("#postbox-container-3")) {
            document.querySelector("#postbox-container-3").style.display = "none";
        }
        //5. ocultar paneles N-4
        if (document.querySelector("#postbox-container-4")) {
            document.querySelector("#postbox-container-4").style.display = "none";
        }
    }

});