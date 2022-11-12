jQuery(document).ready(function() {
    var li_activos_menu = ["menu-media", "menu-posts-product", "menu-dashboard","menu-posts-blocks","toplevel_page_woocommerce"];
    var li_activos_nav = [
        "wp-admin-bar-site-name",
        "menu-posts-product",
        "menu-dashboard",
        "wp-admin-bar-view-site",
        "wp-admin-bar-view-store"
    ];

    var panel_activos_1 = ["custom_dashboard_widget", "dashboard_widget"];
    var panel_activos_2 = [];

    var ventanasPluginsEscritorio=[
        "#wp-optimize-dashnotice",//noticia de ultrasuft
        ".hndle.ui-sortable-handle" //title de uno
    ]



    //1.ocultar menus que no se deben ver
    if (document.querySelector("#adminmenu")) {
        var elements = document.querySelectorAll("#adminmenu li");

        elements.forEach(elemento => {
            var id = elemento.getAttribute("id");

            //----si son los id que deben estar activos no hace nada  sino ocultarlos
            if (li_activos_menu.includes(id)) {
                // elemento.style.display = "block";
            } else {

                if (document.getElementById(id)) {
                    document.getElementById(id).style.display = "none";
                }

                //elemento.style.display = "none";

            }
        });
    }

    //2.ocultar nav que no se deben ver
    if (document.querySelector("#wp-admin-bar-root-canvas.cesar.com.conf")) {
        var elements = document.querySelectorAll("#wp-admin-bar-root-canvas.cesar.com.conf li");

        elements.forEach(elemento => {
            var id = elemento.getAttribute("id");

            if (li_activos_nav.includes(id)) {
                //console.log("id: oculto v2:", id);
                document.getElementById(id).style.display = "block";
            } else {
            }
        });
    }

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



    //jQuery("#wpcontent").show();
    //jQuery("#adminmenuwrap").show();
    if (document.getElementById("wpcontent")) {
        document.getElementById("wpcontent").style.display = "block";
    }

    if (document.getElementById("adminmenuwrap")) {
        document.getElementById("adminmenuwrap").style.display = "block";
    }


    //Agergado ultimos
    ventanasPluginsEscritorio.forEach(element => {

        //Si encontro  un Div  si no ser a una  clase
        if (element.indexOf("#") > -1){
            var idElemento = element.replace("#", "");
            if(document.getElementById(idElemento))
                document.getElementById(idElemento).style.display="none";


        }else{

            document.querySelectorAll(element).forEach(ele => {
                ele.style.display="none";
            });




        }


    });




});
