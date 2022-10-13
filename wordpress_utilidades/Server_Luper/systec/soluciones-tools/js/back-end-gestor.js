jQuery(document).ready(function() {

  var li_activos_menu = [
    "menu-dashboard",
    "menu-media",//media  imagenes
   // "menu-posts",//entradas
    "menu-pages",//Paginas
   //"menu-comments",//comentarios
   // "toplevel_page_elementor",//elementor
  //  "menu-posts-elementor_library",//elementor plantillas
    //  "toplevel_page_wpforms-overview", //wp-forms
    // "menu-appearance",//Apariencia
    //"menu-plugins",//Plugins
    //"menu-users",//Usuarios
    // "menu-tools",//herranmientas Wordpres
    //"menu-settings",//Configuracion wordpress
    //"toplevel_page_wp-mail-smtp",//smtp pro plugin
    //"toplevel_page_aiowpsec",//Seguridad Wp (Plugin)
      "toplevel_page_smart-slider3", //Smart slider (plugin)
      "collapse-menu",//colapsar menu

  ];



  var li_activos_nav = [
    "wp-admin-bar-site-name",
    "wp-admin-bar-menu-toggle",
  ];

  var panel_activos_1 = ["custom_dashboard_widget", "dashboard_widget"];
  var panel_activos_2 = [];

  //1. Ocultar menus del Sidebar que Se deben ver (primero se oculto el archivo css)
  if (document.querySelector("#adminmenu")) {
    var elements = document.querySelectorAll("#adminmenu li");

    elements.forEach(elemento => {
      var id = elemento.getAttribute("id");

      //----si son los id que deben estar activos no hace nada  sino ocultarlos
      if (li_activos_menu.includes(id)) {
           elemento.style.display = "block";
      } else {

        if (document.getElementById(id)) {
         // document.getElementById(id).style.display = "none";
        }

      }
    });
  }

  //2. Desocultar : si existe nav menu admin (ojo se oculta  primero con el archivo css)
  if (document.querySelector("#wp-admin-bar-root-canvas.cesar.com.conf")) {
    var elements = document.querySelectorAll("#wp-admin-bar-root-canvas.cesar.com.conf li");

    elements.forEach(elemento => {
      var id = elemento.getAttribute("id");
      if (li_activos_nav.includes(id)) {
        elemento.style.display = "block";
      } else {
        //elemento.style.display = "none";
      }
    });

    //--- deshabilitar link del usuario logeado
    document.querySelector('#wp-admin-bar-my-account a').setAttribute('src','#');
  }


  //3 .ocultar mensajes de noticia (ojo se oculta  primero con el archivo css)
  var wordpresUpdateMsg= document.getElementsByClassName('notice');
  if (wordpresUpdateMsg.length > 0) {
    for(var i=0;i<wordpresUpdateMsg.length;i++){
      wordpresUpdateMsg[i].style.display='none';
    }
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
  // document.getElementById("wpcontent").style.display = "block";
  // document.getElementById("adminmenuwrap").style.display = "block";



// 5. Quitar Enlaces de Wordpress  de los links -----
  document.querySelectorAll('a').forEach(ele => {
    if(ele.getAttribute('href').indexOf('wordpress') != -1 ) {
      //console.log('se encontro',ele);
      ele.setAttribute('href','#')
    }

  });
  
  
});



