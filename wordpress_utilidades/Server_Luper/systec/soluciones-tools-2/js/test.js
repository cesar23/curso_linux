
var li_activos_nav = [
    "wp-admin-bar-site-name",
    "wp-admin-bar-menu-toggle",
];

if (document.querySelector("#wp-admin-bar-root-default")) {
    var elements = document.querySelectorAll("#wp-admin-bar-root-default li");

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