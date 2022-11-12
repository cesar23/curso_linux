<?php

//-------------- al iniciar el login --------------
function action_login_init() {
    global $config_child_cesar;
    //Si activamos la  validacion de ip
    if($config_child_cesar['valid_ip_country']['active']==1){

        require(dirname(__FILE__) . '/filterGeoIp.php');

        try {
            $CountryIpAllowClass = new FilterGeoIp();
             $ip = $_SERVER['REMOTE_ADDR'];


//        $country_allows = array("PE");
            $country_allows = $config_child_cesar['valid_ip_country']['country_allows'];
            $ips_allows = $config_child_cesar['valid_ip_country']['ips_allows'];
            // si la ip no es valida por pais
            if (!$CountryIpAllowClass->validIpCountry($ip,$country_allows,$ips_allows)) {
                wp_die("Tu Ip: {$ip}  No es valida", 'Error', array('back_link' => true));
            } else {
                //guardamos la  ip en la  lista blanca
                //$CountryIpAllowClass->query_save_json($ip);
            }


        } catch (Exception $e) {
            wp_die('Error: ' . $e->getMessage(), 'Error', array('back_link' => true));

        }

    }



}
add_action( 'login_init', 'action_login_init', 10, 0 );
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
    wp_enqueue_script('custom-login', home_url('/') . 'soluciones-tools/js/style-login.js');
}
add_action('login_enqueue_scripts', 'my_login_stylesheet');


// Custom Admin footer
// define the admin_footer_text callback
function filter_admin_footer_text( $span_id_footer_thankyou_text_span ) {
    return str_replace('<a href="https://es.wordpress.org/">WordPress</a>','<a href="https://solucionessystem.com/">www.solucionessystem.com</a>',$span_id_footer_thankyou_text_span);
}
add_filter( 'admin_footer_text', 'filter_admin_footer_text', 10, 1 );

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
    //wp_add_dashboard_widget('custom_dashboard_widget2', 'Panel de administracion', 'dashboard_widget_function');

}

function add_custom_dashboard_widget2()
{
    /// wp_add_dashboard_widget('custom_dashboard_widget', 'Ayuda amigos', 'dashboard_help_widget_function');
    wp_add_dashboard_widget('dashboard_widget', 'Panel de administracion usuario', 'dashboard_widget_function1');

}

add_action('wp_dashboard_setup', 'add_custom_dashboard_widget');
add_action('wp_dashboard_setup', 'add_custom_dashboard_widget2');

//-------------------Widget para el Dashboard N|2





//------------------------agrega un stylo al admin panel
add_action('admin_head', 'my_custom_fonts');
function my_custom_fonts()
{

    $user      = new WP_User(get_current_user_id());
    $rol_first = $user->roles[0];
    $userID = $user->ID;


    echo '<link href="https://fonts.googleapis.com/css?family=Roboto|Rubik" rel="stylesheet">';
    echo '<style>
    #wpadminbar{
    background: #8e0d0d;
    }
    #adminmenu, #adminmenu .wp-submenu, #adminmenuback, #adminmenuwrap{
    background-color: #20314e;
    }';

    echo ' </style>';

    //si no es el super administrador
    if($userID == 2) {
        wp_enqueue_script('backend-js-gestor-v1',  home_url('/') .'soluciones-tools/js/back-end-gestor.js', array(), version_id(), true);
        wp_enqueue_style('backend-css-gestor-v1',  home_url('/') .'soluciones-tools/css/back-end-gestor.css', array(), version_id(), 'all');
    }
}


//-------------- mis  script frontend
function script_front_end()
{

    wp_enqueue_script('script-frontend', home_url('/') . 'soluciones-tools/js/front-end.js', array(
        'jquery'
    ), version_id(), true);
    wp_enqueue_style('theme-override',  home_url('/') . 'soluciones-tools/css/front-end.css', array(), version_id(), 'all');
    wp_enqueue_style('cdn-font-awesome','https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css', array(), version_id(), 'all');


}
add_action('wp_enqueue_scripts', 'script_front_end');


//--------- Optimizadod e imagenes
function bp_mime_type ( $mime_types ) {
//    unset($mime_types);
    $mime_types['svg'] = 'image/svg+xml';
    $mime_types['webp'] = 'image/webp';
    return $mime_types;}

add_filter('upload_mimes', 'bp_mime_type', 1, 1);

function webp_is_displayable($result, $path) {
    if ($result === false) {
        $displayable_image_types = array( IMAGETYPE_WEBP );
        $info = @getimagesize( $path );

        if (empty($info)) {
            $result = false;
        } elseif (!in_array($info[2], $displayable_image_types)) {
            $result = false;
        } else {
            $result = true;
        }
    }

    return $result;
}
add_filter('file_is_displayable_image', 'webp_is_displayable', 10, 2);


function remove_default_image_sizes( $sizes ) {

    /* Default WordPress */
    unset( $sizes[ 'thumbnail' ]);       // Remove Thumbnail (150 x 150 hard cropped)
    unset( $sizes[ 'medium' ]);          // Remove Medium resolution (300 x 300 max height 300px)
    unset( $sizes[ 'medium_large' ]);    // Remove Medium Large (added in WP 4.4) resolution (768 x 0 infinite height)
    unset( $sizes[ 'large' ]);           // Remove Large resolution (1024 x 1024 max height 1024px)

    /* With WooCommerce */
    unset( $sizes[ 'woocommerce_gallery_thumbnail' ]);  /* siempre es cuadrado recortado y el valor predeterminado es 100 × 100 píxeles. Esto se usa para navegar por las imágenes en la galería.*/
    unset( $sizes[ 'woocommerce_thumbnail' ]); /* el valor predeterminado es 600px de ancho, cuadrado recortado para que las cuadrículas del producto se vean ordenadas. El propietario de la tienda puede personalizar la relación de aspecto para el recorte.*/
    unset( $sizes[ 'woocommerce_single' ]);  /* muestra la imagen completa del producto, tal como se cargó, por lo que siempre está sin recortar de forma predeterminada. Tiene un ancho predeterminado de 600 px.*/
    unset( $sizes[ 'shop_thumbnail' ]);  // Remove Shop thumbnail (180 x 180 hard cropped)
    unset( $sizes[ 'shop_catalog' ]);    // Remove Shop catalog (300 x 300 hard cropped)
    unset( $sizes[ 'shop_single' ]);     // Shop single (600 x 600 hard cropped)

    return $sizes;
}
//Si queremos quitar las  imagenes  generadas
if($config_child_cesar['delete_images_genereadas']==1){
    add_filter( 'intermediate_image_sizes_advanced', 'remove_default_image_sizes' );
}



function check_valid_image_size( $file ) {
    global $config_child_cesar;
    if($config_child_cesar['valid_size_image']['active']!=1) return $file;


    $allowed_mimetypes = array('image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/webp');

    //Si no validaremos este  tipo de imagenes escapamos
    if (!in_array($file['type'], $allowed_mimetypes)){
        return $file;
    }

    $image = getimagesize($file['tmp_name']);
    $maximum = array(
        'width' => $config_child_cesar['valid_size_image']['maximum_width'],
        'height' => $config_child_cesar['valid_size_image']['maximum_height']
    );
    $minimum = array(
        'width' => $config_child_cesar['valid_size_image']['minimum_width'],
        'height' => $config_child_cesar['valid_size_image']['minimum_height']
    );


//    $maximum = array(
//        'width' => '1920',
//        'height' => '1920'
//    );
//    $minimum = array(
//        'width' => '200',
//        'height' => '200'
//    );



    $image_width = $image[0];
    $image_height = $image[1];

    $too_large = "Las dimensiones de la imagen son demasiado grandes. Ancho Maximo: {$maximum ['width']} píxeles Alto Maximo {$maximum['height']} píxeles <br>La imagen cargada tiene {$image_width} por {$image_height} píxeles.";
    $too_small = "Las dimensiones de la imagen son demasiado pequeña. Ancho Minimo: {$minimum ['width']} píxeles Alto Minimo {$minimum['height']} píxeles <br>La imagen cargada tiene {$image_width} por {$image_height} píxeles.";
    //$too_large = "Image dimensions are too large. Maximum size is {$maximum['width']} by {$maximum['height']} pixels. Uploaded image is $image_width by $image_height pixels.";


    //-------------version solo controla  el maximo y minimo
    if ( $image_width < $minimum['width'] || $image_height < $minimum['height'] ) {

        //solo si es una  imagen png permitimos que sea pequeña
        if($file['type'] == 'image/png'){
            return $file;
        }

        $file['error'] = $too_small;
        return $file;
    }elseif ( $image_width > $maximum['width'] || $image_height > $maximum['height'] ) {
        $file['error'] = $too_large;
        return $file;
    }else {
        return $file;
    }
    //-------------version solo controla  el maximo
//    if ( $image_width > $maximum['width'] || $image_height > $maximum['height'] ) {
//        $file['error'] = $too_large;
//        return $file;
//    }else {
//        return $file;
//    }
}
add_filter( 'wp_handle_upload_prefilter', 'check_valid_image_size' );