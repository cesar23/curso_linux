function getUrlQuery() {
    return window.location.pathname + window.location.search;
}

jQuery(document).ready(function() {
    const current_url=getUrlQuery();
    var li_activos_menu = ["menu-media", "menu-posts-product", "menu-dashboard","menu-posts-blocks","menu-pages","menu-posts-popup","toplevel_page_learndash-lms","menu-users","toplevel_page_woocommerce"];
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



//---- fase para Extra para  learndash

    function ocultarElementos(elements_array) {
        //si es  array
        if (typeof elements_array === 'object') {
            //Recorremos el array i  pcultamos
            elements_array.forEach(ele => {
                // let objHtml= document.getElementById(ele);
                let objHtml = document.querySelector(ele);
                if (objHtml) {
                    objHtml.style.display = "none";
                }
            })
        } else {
            // let objHtml= document.getElementById(elements_array);
            let objHtml = document.querySelector(elements_array);
            if (objHtml) {
                objHtml.style.display = "none";
            }
        }


    }


    function mostrarElementos(elements_array) {
        //si es  array
        if (typeof elements_array === 'object') {
            //Recorremos el array i  pcultamos
            elements_array.forEach(ele => {
                // let objHtml= document.getElementById(ele);
                let objHtml = document.querySelector(ele);
                if (objHtml) {
                    objHtml.style.display = "block";
                }
            })
        } else {
            // let objHtml= document.getElementById(elements_array);
            let objHtml = document.querySelector(elements_array);
            if (objHtml) {
                objHtml.style.display = "block";
            }
        }


    }


    // Estas  ocultaciones  son para  learndash
    let itemsToHide = ["#tab-admin_page_learndash_lms_settings", "#tab-admin_page_learndash_lms_settings_custom_labels",
        "tab-admin_page_learndash_lms_settings_paypal", "#tab-admin_page_learndash_data_upgrades",
        "tab-admin_page_learndash_support", "#tab-admin_page_learndash_lms_translations", "#tab-admin_page_nss_plugin_license-sfwd_lms-settings"];

    itemsToHide = [...itemsToHide, "#learndash_settings_courses_themes_themes", "#learndash-settings-page-form"
        , "learndash-settings-page-form"];

    //------tab seting y body general
    itemsToHide = [...itemsToHide, ".wrap.learndash-settings-page-wrap.learndash-overview-page-wrap"];
    //botones de coonfiguracion de learndas
    // itemsToHide=[...itemsToHide,".ld-tab-buttons"];


    ocultarElementos(itemsToHide);

    let itemsToShow = [`#woocommerce-product-data .ui-sortable-handle`];
    mostrarElementos(itemsToShow);


    //if(getUrlQuery()==""){
    //----- Oculta las  configuraciones de los curso temas y cuestionarios
    document.querySelectorAll("div.ld-tab-buttons a").forEach((ele, key) => {
        if (key > 0) {
            ele.style.display = "none";
        }

    });


    //------Filtrar creacion de usuarios para que  solo se  puedan crear  suscriptores cuando se crear un usuario
    document.querySelectorAll("#role option").forEach((ele, key) => {
        if (ele.value !=='subscriber') {
            ele.style.display = "none";
        }
    });





    //Paar  ocutar configuraciones de los  popup
    if(current_url==="/wp-admin/edit.php?post_type=popup"){
        document.querySelectorAll(".nav-tab-wrapper a").forEach((ele, key) => {
            if (key > 0) {
                ele.style.display = "none";
            }

        });
    }

    //-------- buscamos si estamos en alguna de estas  urls
    if(current_url.indexOf("/wp-admin/post-new.php")>=0 || current_url.indexOf("/wp-admin/post.php")>=0){
        document.querySelectorAll(".ui-sortable-handle").forEach((ele, key) => {
            if (key > 0) {
                ele.style.display = "block";
            }

        });

    }



});
