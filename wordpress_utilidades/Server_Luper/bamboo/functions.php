<?php
//bambaoo.pe

$url_amigable='www.'.preg_replace('/(http|https):\/\/(\S+)(\/)/i', '${2}', home_url('/') );//www.example.com

define ('VERSION', '2020-08-24.03');


function version_id() {
    //return time();
    if ( WP_DEBUG )
        return time();
    return VERSION;
}

// Add custom Theme Functions here
// ---------------------------- start Crear ROl Gestor-------------------------------------------------
add_action('init', 'cloneRole');

function cloneRole()
{
    global $wp_roles;

    if (!isset($wp_roles))
        $wp_roles = new WP_Roles();

    $adm = $wp_roles->get_role('administrator');
    //Adding a 'new_role' with all admin caps
    $wp_roles->add_role('gestor', 'Gestor', $adm->capabilities);
    $wp_roles->add_role('gestor2', 'Gestor2', $adm->capabilities);
}
// ---------------------------- end Crear ROl Gestor-------------------------------------------------


//---------------------------------- start Modificar apariencia de Login----------------------------------------
function my_login_logo()
{

    ?>
    <style type="text/css">
        #login h1 a, .login h1 a {
            background-image: url(<?php
    echo home_url('/');
?>soluciones-tools/images/logo-sistema.png);
            padding-bottom: 30px;
        }
    </style>
    <?php
}
add_action('login_enqueue_scripts', 'my_login_logo');

function my_login_stylesheet()
{

    wp_enqueue_style('custom-login', home_url('/') . 'soluciones-tools/css/style-login.css?version'.version_id());
    wp_enqueue_script('custom-login', home_url('/') . 'soluciones-tools/js/style-login.js?version'.version_id());
}
add_action('login_enqueue_scripts', 'my_login_stylesheet');

// Custom Admin footer
function wpexplorer_remove_footer_admin()
{
    echo '<span id="footer-thankyou">Sistema creado por <a href="http://www.solucionessystem.com/" target="_blank">www.solucionessystem.com</a></span>';
}
add_filter('admin_footer_text', 'wpexplorer_remove_footer_admin');




//--------------------Eliminar el icono de WordPress de la barra de administración - NAV
function ls_admin_bar_remove()
{

    global $wp_admin_bar;
    $wp_admin_bar->remove_menu('updates'); // eliminamos el calendario del nav tambien
    $wp_admin_bar->remove_menu('wp-logo'); //eliminamos el logo


}

add_action('wp_before_admin_bar_render', 'ls_admin_bar_remove', 0);

//-----------------agregar un elemento al top menu dashboard
function my_tweaked_admin_bar()
{

    global $wp_admin_bar;

    //Add a link called 'My Link'...
    $wp_admin_bar->add_node(array(
        //'id'    => 'my-link',
        'id' => 'site-name',
        'title' => 'Panel Administrativo',
        //'href'  => admin_url()
        'href' => home_url('/') . 'wp-admin/index.php'
    ));

}
add_action('wp_before_admin_bar_render', 'my_tweaked_admin_bar');







//------------------------agrega un stylo al admin panel
add_action('admin_head', 'my_custom_fonts');
function my_custom_fonts()
{

    $user      = new WP_User(get_current_user_id());
    $rol_first = $user->roles[0];


    echo '<link href="https://fonts.googleapis.com/css?family=Roboto|Rubik" rel="stylesheet">';
    echo '<style>
    body, td, textarea, input, select {
      font-family: \'Rubik\', sans-serif;
      font-size: 12px;
    } 
    #wpadminbar{
    background: #8e0d0d;
    }
    #adminmenu, #adminmenu .wp-submenu, #adminmenuback, #adminmenuwrap{
    background-color: #20314e;
    }
    ';

    //si no es el super administrador

    if ($rol_first !== 'administrator') {
        echo '
        /*-----ocultar actualizacion de worpress----*/
        .update-nag{
            display: none;
            }
        /*-----ocultar alertas de plugins----*/    
        .notice.notice-error.yoast-notice-error{
        display: none;
        }
        #setting-error-tgmpa{
        display: none;
        }
        .notice.notice-error{
        display: none;
        }
        .updated.woocommerce-message.wc-connect{
            display:none;
        }
        .updated.woocommerce-message{
            display:none;
        }
        .wrap .updated{
            display:none;
        }
         ul.wp-submenu.wp-submenu-wrap li:nth-child(3) {
            display:none;
        }
       
        /*---------- ocultar nav bar theme y plugins-----------*/
      
        
        ';
    }
    echo ' </style>';
}
//---------------------------------- end Modificar apariencia de Login----------------------------------------
//* Cargue una hoja de estilo externa (recuerde ingresar la ruta correcta a su hoja de estilo)

//add_action( 'admin_enqueue_scripts', 'rv_custom_wp_admin_style_enqueue' );
//function rv_custom_wp_admin_style_enqueue() {
//    wp_enqueue_style( 'custom_wp_admin_css', get_template_directory_uri() . '/admin-style.css', false, '1.0.0' );
//}




//-------------------Widget para el Dashboard N|1
function dashboard_widget_function1()
{
    echo '<img src="http://icons.iconarchive.com/icons/apathae/wren/128/Utilities-icon.png" /><br>
Cuenta con una interfaz que controla una o varias bases de datos donde se aloja el contenido del sitio web. El sistema permite manejar de manera independiente el contenido y el diseño. Así, es posible manejar el contenido y darle en cualquier momento un diseño distinto al sitio web sin tener que darle formato al contenido de nuevo, además de permitir la fácil y controlada publicación en el sitio a varios editores. Un ejemplo clásico es el de editores que cargan el contenido al sistema y otro de nivel superior (moderador o administrador) que permite que estos contenidos sean visibles a todo el público .';
}

function dashboard_help_widget_function()
{
    echo '<img src="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-help-about-icon.png" /><br>
Puedes encontrar mas ayuda contactate: 937516027<br>email:ventas@solucionessytem.com.';
}

function add_custom_dashboard_widget()
{
    wp_add_dashboard_widget('custom_dashboard_widget', 'Ayuda amigos', 'dashboard_help_widget_function');


}

function add_custom_dashboard_widget2()
{

    wp_add_dashboard_widget('dashboard_widget', 'Panel de administracion usuario', 'dashboard_widget_function1');

}

add_action('wp_dashboard_setup', 'add_custom_dashboard_widget');
add_action('wp_dashboard_setup', 'add_custom_dashboard_widget2');

//-------------------Widget para el Dashboard N|2



//---------------------------------------------------- script para poner input de origin de producto contact form---------
add_action("wp_enqueue_scripts", "mis_scripts_js");
function mis_scripts_js()
{


    //Cargar sólo en las entradas
    // if (is_single()){
    wp_enqueue_script('contact-form-woo', home_url('/') . 'soluciones-tools/js/formulario.js', array(
        'jquery'
    ),  version_id(), true);
    wp_enqueue_script('contact-form-woo');
    //}

}

//-------------- mis  script fron end
function script_front_end()
{


    wp_enqueue_script('script-func-cesar-numbers', home_url('/') . 'soluciones-tools/js/func.cesar.numbers.js', array(), version_id(), true);
    wp_enqueue_script('script-frontend', home_url('/') . 'soluciones-tools/js/front-end.js', array(
        'jquery'
    ), version_id(), true);

    wp_enqueue_style('theme-override',  home_url('/') . 'soluciones-tools/css/front-end.css', array(), version_id(), 'all');
    wp_enqueue_style('theme-impacto-web',  home_url('/') . 'soluciones-tools/css/style_font_v1.css', array(), version_id(), 'all');

    wp_enqueue_style('cdn-font-awesome','https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css', array(), version_id(), 'all');
}
add_action('wp_enqueue_scripts', 'script_front_end');
//-------------- mis script backend
function script_back_end($hook)
{

    wp_enqueue_script('func-cesar-numbers', home_url('/') . 'soluciones-tools/js/func.cesar.numbers.js', array(),  version_id(), true);

    $user      = new WP_User(get_current_user_id());
    $rol_first = $user->roles[0];
    //si no es el super administrador

    if ($rol_first !== 'administrator') {

        wp_enqueue_style('theme-override',  home_url('/') . 'soluciones-tools/css/back-end-gestor.css', array(), version_id(), 'all');

        wp_enqueue_script('back-end-gestor', home_url('/') . 'soluciones-tools/js/back-end-gestor.js', array('jquery'),  version_id(), true);
    }
    wp_enqueue_style('backend-css',  home_url('/') . 'soluciones-tools/css/back-end.css', array(), version_id(), 'all');

}

add_action('admin_enqueue_scripts', 'script_back_end');




//------------------------------------------------
//----- agregar contenido al footer y head---------------------------
//------------------------------------------------


function funcion_footer() {


    ?>

    <?php

    //wp_enqueue_script( 'script-prueba',  get_template_directory_uri().'/js/prueba_peru.js');

}

add_action( 'wp_footer', 'funcion_footer' );


//--------------------------------------------------------------
//----- agregar contenido al la apertura del body---------------------------
//-----------------------------------------------------------------

// Add Google Tag code which is supposed to be placed after opening body tag.
add_action( 'wp_body_open', 'add_custom_body_open_code' );

function add_custom_body_open_code() {
     ?>

    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TMB6R35"
                      height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
    <?php
}

//---------------------------------------------------------------------------------------
//--------------------------- hooks para pagina producto  woocomerce----------------------------------
//---------------------------------------------------------------------------------------



//--------------------------quitar ligbox en woocomerce producto

//------------------------------------------------
//----- ADD CUSTO FILES campos del plugin ya  agregados ---------------------------
//------------------------------------------------



function scriptHead(){
    ?>

    <!-- Google Tag Manager -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
            'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','GTM-TMB6R35');</script>
    <!-- End Google Tag Manager -->

    <?php
}
add_action( 'wp_head', "scriptHead",1);

//mostrar descripcion corta en productos
add_action( 'woocommerce_after_shop_loop_item', 'woocommerce_template_single_excerpt', 5);

//script al finalizar compra
add_action( 'wp_enqueue_scripts', 'fn_solu_add_finalizarCompra' );
function fn_solu_add_finalizarCompra() {

    //Esta variable debe contener el slug, la id, o el nombre de la página
    $pagina    = 'finalizar-compra';

    if ( is_page( $pagina )  ) {
        // 1 ----------REGISTRAMOS EL STYLOS
        wp_register_style(
            'style-finalizar-compra',
            home_url( '/' ) . 'soluciones-tools/css/finalizar-compra.css',   //la  ruta del script
            array(),
            '1.2'

        );
        //loponemos en cola del wp
        wp_enqueue_style( 'style-finalizar-compra' );

        // 2 ----------REGISTRAMOS EL JS

        wp_register_script(
            'JS-finalizar-compra',                                     //el id del script
            home_url( '/' ) . 'soluciones-tools/js/finalizar-compra.js',   //la  ruta del script
            array('jquery'),                                //dependecnias de script
            '3',                                            //la version del script
            true                                            //si va en el footer
        );
        wp_enqueue_script('JS-finalizar-compra');

    }



}
