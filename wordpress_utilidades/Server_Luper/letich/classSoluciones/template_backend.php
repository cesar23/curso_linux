<?php
// version: 2.0.0
//--Eliminar la  version de wordpres (seguridad)
function complete_version_removal()
{
    return '';
}

add_filter('the_generator', 'complete_version_removal');

//Evitar maximo de revisiones para  los  post
if (!defined('WP_POST_REVISIONS')) define('WP_POST_REVISIONS', 5);

if (!function_exists('showPopUp')) {
    function showPopUp($msg, $label = '')
    {
        ?>

        <script>
            document.addEventListener("DOMContentLoaded", function (event) {
                var popup = document.createElement('div');
                popup.className = 'popup';
                popup.id = 'lightbox';
                popup.style.padding = '5px';
                popup.style.position = 'fixed';
                popup.style.zIndex = '9999';
                popup.style.filter = 'drop-shadow(0 6px 5px rgba(0,0,0,0.7))';
                popup.style.border = '2px solid #3c3c3c';
                popup.style.borderRadius = '15px';
                popup.style.width = '200px';
                popup.style.height = '100px';
                popup.style.background = '#1e1c1c';
                popup.style.color = 'white';
                popup.style.textAlign = 'center';
                //-- centrar
                popup.style.bottom = '2%';
                popup.style.right = '2%';
                // popup.style.top = window.innerHeight/2 - 50 + 'px';
                // popup.style.left = window.innerWidth/2 - 100 + 'px';
                var cancel = document.createElement('div');
                cancel.className = 'cancel';
                cancel.style.color = 'white';
                cancel.style.textAlign = 'center';
                cancel.style.visibility = 'visible';
                cancel.style.display = 'flex';
                cancel.style.justifyContent = ' right';

                cancel.innerHTML = `<span style="cursor: pointer;" >
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACnElEQVQ4jWWTy08TURTGfzOdKyW0IwEChVBKUSoooJJoWJH4iEld6cKE4MJEd7rTv8KYaOJGlsYHiC6UjRoDO2JcGaX4QJQ+MGBBSmHKq4W55k5bQfmSk0nOfOfLdx5Xqw91UoTGPzgANBUSP4BvxZ+2ts002I1G4CpwcofAFDAC3ANiOyv+cWDo+qVMZvVuNpczy8tNpJR5kqaRSi/jFsayx1N2LSflo2KNrhWsG7p+0bJW7huGy/TVVpNM/lY5DJdOMjlPfW0NLiFMy8o8FJrWo0uJEwWh2kxm9b4QBoMP+ngzNEBT0E90Kkb0e4x9wQCvhwZ4+qAPIQSZzOpDwOc4KAjcyOZyRmmpm472QwQa/Lx63o+3ooLyqkpevnhMoKGejraDKI7iAteLAvuBM6rnmdkkXd1nSSR+Egj4eTs8xOjwC0cwnvjJ8e4wM7NzKK6qUUNWSs2AXw2szlfNxMQkR7tOM/LqGUcOtzv2PnyMcCJ8gfRCimBTgE3bVumAWrXO/5Cg6RpS23kVWn7ayF10JTAJTKtVzfyao6U1xPt3wxztaCMy/sWJI4fbnFxzS8jhaHnxOPAVf6hTxS2zplk2HjwmF9NpqRCNJqTX1yz3+kIyFks4udTiogy2HpOK6w913lS1xRZuixKxub66wdjYJ+LxacLne7FSaZZSKcLneoknpolEPrO2to4hxCZwx2lOqSi4dL3HslYG1C2YpukU1PnUqm3HdrDBT3rZIpfL4vV6erZse9CpMytr8w9EynF3acmPjfXsqaVly11VVYEtbZXH4yljfiGlel/yesuubGn2E8e7vkMgDzkmhNHvdpfkgD1AGbAORNzukkdCGJellKN/G///MTnD3d6Uug91ZArfC9vKw1X4An8AJAwER29rYHYAAAAASUVORK5CYII=" alt="Cerrar" />
</span>`;
                cancel.onclick = function (e) {
                    popup.parentNode.removeChild(popup)
                };

                var message = document.createElement('span');
                message.innerHTML = `<?php echo $msg;?> `;
                popup.appendChild(cancel);
                popup.appendChild(message);

                document.body.appendChild(popup);
            });
        </script>
        <?php
    }
}


if (!function_exists('phpConsoleLog')) {
    function phpConsoleLog($data, $label = '')
    {

        if (gettype($data) == "array") {

            echo "<script>";
            if ($label != '') {
                echo "console.group(`" . $label . "`);";
            }
            echo "console.log(`debugWP (array):`,`" . json_encode($data) . "`);";
            if ($label != '') {
                echo "console.groupEnd();";
            }
            echo "</script>";
        } else if (gettype($data) == "object") {


            echo "<script>";
            if ($label != '') {
                echo "console.group('" . $label . "');";
            }
            echo "console.log(`debugWP (Object):`,`" . json_encode($data) . "`);";
            if ($label != '') {
                echo "console.groupEnd();";
            }
            echo "</script>";


        } else if (gettype($data) == "integer") {
            echo "<script>";
            if ($label != '') {
                echo "console.group('" . $label . "');";
            }
            echo "console.log(`debugWP (Integer):`,`" . json_encode($data) . "`);";
            if ($label != '') {
                echo "console.groupEnd();";
            }
            echo "</script>";


        } else if (gettype($data) == "double") {
            echo "<script>";
            if ($label != '') {
                echo "console.group('" . $label . "');";
            }
            echo "console.log(`debugWP (double):`,`" . json_encode($data) . "`);";
            if ($label != '') {
                echo "console.groupEnd();";
            }
            echo "</script>";


        } else {
            echo "<script>";
            if ($label != '') {
                echo "console.group('" . $label . "');";
            }
            echo "console.log(`debugWP (string):`,`" . ($data) . "`);";
            if ($label != '') {
                echo "console.groupEnd();";
            }
            echo "</script>";
        }
    }
}

function getUserIP()
{
    $ipaddress = '';
    if (isset($_SERVER['HTTP_CLIENT_IP']))
        $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
    else if (isset($_SERVER['HTTP_X_FORWARDED_FOR']))
        $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
    else if (isset($_SERVER['HTTP_X_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
    else if (isset($_SERVER['HTTP_X_CLUSTER_CLIENT_IP']))
        $ipaddress = $_SERVER['HTTP_X_CLUSTER_CLIENT_IP'];
    else if (isset($_SERVER['HTTP_FORWARDED_FOR']))
        $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
    else if (isset($_SERVER['HTTP_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_FORWARDED'];
    else if (isset($_SERVER['REMOTE_ADDR']))
        $ipaddress = $_SERVER['REMOTE_ADDR'];
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}

function plantilla_bloqueo($ip, $capaSeguridad = 'CAPA SEGURIDAD NUMERO 01', $extra = '', $country_code = '', $country_name = '', $DEBUG = '')
{

    if ($DEBUG != '') {
        $type_degub = gettype($DEBUG);
        if (in_array($type_degub, array("array", "object"))) {
            $DEBUG = json_encode($DEBUG);
        }

    }

    $platillaHtml = '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Informativo</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
<style>
    .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    @media (min-width: 768px) {
        .bd-placeholder-img-lg {
            font-size: 3.5rem;
        }
    }
</style>
 
<!-- Custom styles for this template -->
<link href="https://getbootstrap.com/docs/4.3/examples/sign-in/signin.css" rel="stylesheet">
</head>
<body class="text-center">
<form class="form-signin">
    <img class="mb-4" src="https://1.bp.blogspot.com/-aahfC3fLFXU/YFkuaFCCrQI/AAAAAAAAcs0/LJV9Ir2YIMwZSGVmoDTn2-JmjrR2YsIqgCLcBGAsYHQ/s16000/logo%2Bfacebook.png" alt="" width="50%" height="">
    <h1 class="h3 mb-12 font-weight-normal">No tienes acceso desde tu Ip.</h1>
    <h3 class="h3 mb-3 font-weight-normal"><strong>%IP_DENIED%</strong></h3>
     <h3 class="h5 mb-3 font-weight-normal"><strong>%EXTRA%</strong></h5>
     <h3 class="h5 mb-3 font-weight-normal">%BANERA%</h5>
    <button type="button" class="btn btn-warning">%CAPA_SEGURITY%</button>
    <p>Contacta  con el webmaster www.solucionessystem.com</p>
    <a class="btn btn-lg btn-primary btn-block" href="https://www.solucionessystem.com?type=bloqueado-por-ip">click aqui</a>
    <p class="mt-5 mb-3 text-muted">&copy; 2009-2021 - version 01</p>
</form>

    <script>
        document.addEventListener("DOMContentLoaded", function(event) {
         
           console.group("DEBUG");
          
           console.log(`%DEBUG%`);           
           console.groupEnd();
           
        });
        </script>
</body>
</html>';
    $platillaHtml = str_replace('%IP_DENIED%', $ip, $platillaHtml);
    //$platillaHtml=str_replace('%IP_DENIED%',$ip_3,$platillaHtml);
//    $platillaHtml=str_replace('%CAPA_SEGURITY%','CAPA SEGURIDAD NUMERO 01',$platillaHtml);
    $platillaHtml = str_replace('%CAPA_SEGURITY%', $capaSeguridad, $platillaHtml);
    $platillaHtml = str_replace('%DEBUG%', $DEBUG, $platillaHtml);
    $platillaHtml = str_replace('%EXTRA%', $extra, $platillaHtml);
    if ($country_code != "") {
        $platillaHtml = str_replace('%BANERA%',
            "<img
  alt=\"{$country_name}\"
  src=\"//cesar23.github.io/cdn_webs/assets/country-flag-icons-gh-pages/1x1//{$country_code}.svg\"/>", $platillaHtml);

    }
    header('HTTP/1.0 403 Forbidden');
    exit($platillaHtml);
}

//-------------- al iniciar el login --------------
function action_login_init()
{
    global $config_child_cesar;
    $HORAS_VIDA_COOKIE = 1;
    $ip = $_SERVER['REMOTE_ADDR'];


    if ($config_child_cesar['valid_ip_country_capa_1']['active'] == 1) {

        //------------------------------------------------
        //----------- primera capa con archivo
        //------------------------------------------------
        $ips_allows = $config_child_cesar['valid_ip_country_capa_1']['ips_allows'];
        // si la  ip esta  siempre permitida la  agregamos
        if (in_array($ip, $ips_allows)) {
            return true;
        }

        if (strlen($ip) <= 15) {
            require_once(dirname(__FILE__) . '/CheckRangeIpCountry.php');
            $isTrueIpRange = CheckRangeIpCountry::validIpCountry($ip, "PE");
            if ($isTrueIpRange !== true) {
                plantilla_bloqueo(
                    "{$ip}",
                    'CAPA SEGURIDAD NUMERO 01',
                    "",
                    "",
                    "",
                    "La ip:{$ip} no esta  en el rango de ips permitidas"
                );


            } else {
                phpConsoleLog("Se valido ip {$ip}", "valid_ip_capa_1");
                //mostrar modal
                if ($config_child_cesar['valid_ip_country_capa_1']['modal_info'] == 1) {
                    showPopUp("Se valido ip {$ip} valid_ip_capa_1");
                }

                return true;
            }
        }


    }


    //------------------------------------------------
    //--------- segunda  capa con api geoIp
    //------------------------------------------------
    //Si activamos la  validacion de ip
    if ($config_child_cesar['valid_ip_country_capa_2']['active'] == 1) {

        //-- 1. comprobar si ya se  guardo en la cookie la ip
        if (isset($_COOKIE['cook_ip'])) {
            $cookie = stripslashes($_COOKIE['cook_ip']);
            $cook = json_decode($cookie);
            $_MESSAGES = implode(",", $cook->messages);
            $_DEBUG = implode(",", $cook->debug);
            phpConsoleLog($cook, "COOKIE");

            // si la ip no es  valida
            if ($cook->ip == $ip && $cook->valid == 0) {
                plantilla_bloqueo(
                    "{$ip}",
                    'CAPA SEGURIDAD NUMERO 02 - cookie',
                    "{$_MESSAGES}",
                    "{$cook->country_code}",
                    "{$cook->country_name}",
                    $cook
                );


            }
            //si la  ip que se guardo previamente es valida salimos de la funcion
            if ($cook->ip == $ip && $cook->valid == 1) {
                //mostrar modal
                if ($config_child_cesar['valid_ip_country_capa_2']['modal_info'] == 1) {
                    showPopUp("Se valido ip {$ip} valid_ip_capa_2, cookie");
                }

                return true;
            }
        } else {
            phpConsoleLog("No se encontro cookie", "COOKIE");
        }


        require_once(dirname(__FILE__) . '/filterGeoIp.php');

        try {
            $CountryIpAllowClass = new FilterGeoIp();
            //$ip=getUserIP();

            //return true;


//        $country_allows = array("PE");
            $country_allows = $config_child_cesar['valid_ip_country_capa_2']['country_allows'];
            $ips_allows = $config_child_cesar['valid_ip_country_capa_2']['ips_allows'];
            // si la ip no es valida por pais
            $objRes = $CountryIpAllowClass->validIpCountry($ip, $country_allows, $ips_allows);//
            $_DEBUG = implode(",", $objRes->debug);
            $_MESSAGES = implode(",", $objRes->messages);


            if ($objRes->success === false) {
                setcookie('cook_ip', json_encode(array(
                    "ip" => $ip,
                    "valid" => 0,
                    "messages" => implode(",", $objRes->messages),
                    "country_code" => $objRes->country_code,
                    "country_name" => $objRes->country_name,
                    "debug" => $objRes
                )), time() + 3600);//dos  horas

                plantilla_bloqueo(
                    "{$ip}",
                    'CAPA SEGURIDAD NUMERO 02',
                    "{$_MESSAGES}",
                    "{$objRes->country_code}",
                    "{$objRes->country_name}",
                    $objRes
                );


                // wp_die("Tu Ip 2: {$ip}  No es valida", 'Error', array('back_link' => true));
            } else {
                setcookie('cook_ip', json_encode(array(
                    "ip" => $ip,
                    "valid" => 1,
                    "messages" => "ip valida [{$ip}]",
                    "country_code" => $objRes->country_code,
                    "country_name" => $objRes->country_name,
                    "debug" => $_DEBUG
                )), time() + 3600);//dos  horas
                //mostrar modal
                if ($config_child_cesar['valid_ip_country_capa_2']['modal_info'] == 1) {
                    showPopUp("Se valido ip {$ip} valid_ip_capa_2");
                }

                phpConsoleLog($objRes, "debug");

            }


        } catch (Exception $e) {
            wp_die('Error: ' . $e->getMessage(), 'Error', array('back_link' => true));

        }


    }

}

add_action('login_init', 'action_login_init', 10, 0);
//---------------------------------- start Modificar apariencia de Login----------------------------------------
function my_login_logo()
{

    ?>
    <style type="text/css">
        #login h1 a, .login h1 a {
            background-image: url(<?php echo home_url('/');?>soluciones-tools/images/logo-sistema.png);

            height: 238px !important;
            background-size: 238px !important;
            width: 256px !important;
        }


    </style>
    <?php
}


function my_login_stylesheet()
{

    $filepath = $_SERVER['DOCUMENT_ROOT'] . '/soluciones-tools/js/funciones-mias.js';
    if (file_exists($filepath)) {
        wp_enqueue_script('script-func-mias', home_url('/') . 'soluciones-tools/js/funciones-mias.js', array(), version_id(), true);
    }

    wp_enqueue_style('custom-login', home_url('/') . 'soluciones-tools/css/style-login.css', array(), version_id(), true);
    wp_enqueue_script('custom-login', home_url('/') . 'soluciones-tools/js/style-login.js', array(), version_id(), true);

}


if ($config_child_cesar['my_style_login']['active'] == 1) {
    add_action('login_enqueue_scripts', 'my_login_logo');
    add_action('login_enqueue_scripts', 'my_login_stylesheet');
}


// Custom Admin footer
// define the admin_footer_text callback
function filter_admin_footer_text($span_id_footer_thankyou_text_span)
{
    return str_replace('<a href="https://es.wordpress.org/">WordPress</a>', '<a href="https://solucionessystem.com/">www.solucionessystem.com</a>', $span_id_footer_thankyou_text_span);
}

add_filter('admin_footer_text', 'filter_admin_footer_text', 10, 1);


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
    global $config_child_cesar;

    $user = new WP_User(get_current_user_id());
    $rol_first = $user->roles[0];
    $userID = $user->ID;
    $user_email = $user->user_email;


    $filepath = $_SERVER['DOCUMENT_ROOT'] . '/soluciones-tools/js/funciones-mias.js';
    if (file_exists($filepath)) {
        wp_enqueue_script('script-func-miass', home_url('/') . 'soluciones-tools/js/funciones-mias.js', array(), version_id(), true);
    }

    // si no esta  activado salimos
    if ($config_child_cesar['usuarios_opciones_limitadas']['active'] != 1) return;

    // si tiene el rol administrator pero no es uno de los admin, se le agregara los filtros
    if ($rol_first === "administrator" and !in_array($user_email, $config_child_cesar['usuarios_opciones_limitadas']['array_users_admin'])) {


        $filepath = $_SERVER['DOCUMENT_ROOT'] . '/soluciones-tools/js/back-end-gestor.js';
        if (file_exists($filepath)) {
            wp_enqueue_script('backend-js-gestor-v1', home_url('/') . 'soluciones-tools/js/back-end-gestor.js', array(), version_id(), true);
        }

        $filepath = $_SERVER['DOCUMENT_ROOT'] . '/soluciones-tools/css/back-end-gestor.css';
        if (file_exists($filepath)) {
            wp_enqueue_style('backend-css-gestor-v1', home_url('/') . 'soluciones-tools/css/back-end-gestor.css', array(), version_id(), 'all');
        }

        ##---stylo sy scritp para  gestor
        echo '<script>
                console.log("Modo Gestor con limitaciones")
            </script>
            <style>
                /*------ 3. borrar anuncios de actualizacion y errores -- */
                .notice,
                .updated,
                .update-nag,
                .bsf-update-nag,
                #welcome-panel,
                #footer-upgrade{
                    display:none;
                }
            
                /*------ 4. ocultar anuncios de SmartSlider(plugin) -- */
                .n2_getting_started__video,
                .n2_dashboard_manager,
                .n2_dashboard_info,
                .n2_help_center{
                    display:none;
                }
            
                /*---- Ocultar Paneles de Flatsone ------*/
                #wpadminbar #wp-admin-bar-flatsome_panel,#wp-admin-bar-flatsome-activate{
                    display:none;
                }
            
                /*---- Ocultar Paneles de Yoast ------*/
                #wpadminbar #wp-admin-bar-wpseo-menu{
                    display:none;
                }
            </style>
            ';

    }


    echo '<link href="https://fonts.googleapis.com/css?family=Roboto|Rubik" rel="stylesheet">';
    echo '<style>
    #wpadminbar{
    background: #8e0d0d;
    }
    #adminmenu, #adminmenu .wp-submenu, #adminmenuback, #adminmenuwrap{
    background-color: #20314e;
    }';

    echo ' </style>';


}


//-------------- mis  script frontend
function script_front_end()
{
    global $config_child_cesar;

    if ($config_child_cesar['load_script_front_end']['active'] != 1) return;


    foreach ($config_child_cesar['load_script_front_end']['js_add'] as $id_recurso => $script) {

        if (strpos($script, '://') !== false) {
            wp_register_script($id_recurso, $script, null, null, true);//cdn aqui
        } else {

            $filepath = $_SERVER['DOCUMENT_ROOT'] . "/" . $script;
            if (file_exists($filepath)) {

                if (strpos($id_recurso, '_depJquery') !== false) {
                    wp_enqueue_script($id_recurso, home_url('/') . $script, array(
                        'jquery'
                    ), version_id(), true);
                } else {
                    wp_enqueue_script($id_recurso, home_url('/') . $script, array(), version_id(), true);
                }
            }


        }
    }

    foreach ($config_child_cesar['load_script_front_end']['css_add'] as $id_recurso => $script) {

        if (strpos($script, '://') !== false) {
            wp_enqueue_style($id_recurso, $script);//cdn aqui
        } else {

            $filepath = $_SERVER['DOCUMENT_ROOT'] . "/" . $script;
            if (file_exists($filepath)) {
                wp_enqueue_style($id_recurso, home_url('/') . $script, array(), version_id(), 'all');
            }


        }
    }


//    $filepath = $_SERVER['DOCUMENT_ROOT']. '/soluciones-tools/js/func.cesar.numbers.js';
//    if (file_exists($filepath)) {
//        wp_enqueue_script('script-func-cesar-numberss', home_url('/') . 'soluciones-tools/js/func.cesar.numbers.js', array(), version_id(), true);
//    }
//    $filepath = $_SERVER['DOCUMENT_ROOT']. '/soluciones-tools/js/front-end.js';
//    if (file_exists($filepath)) {
//        wp_enqueue_script('script-frontend', home_url('/') . 'soluciones-tools/js/front-end.js', array(
//            'jquery'
//        ), version_id(), true);
//    }
//
//
//    wp_enqueue_style('cdn-font-awesome','https://raw.githubusercontent.com/cesar23/cdn_webs/master/libs/font-awesome/5.9.0/css/all.min.css', array(), version_id(), 'all');


}

if (!is_admin()) {
    add_action('wp_enqueue_scripts', 'script_front_end');
}


//--------- Optimizadod e imagenes
function bp_mime_type($mime_types)
{
//    unset($mime_types);
    $mime_types['svg'] = 'image/svg+xml';
    $mime_types['webp'] = 'image/webp';
    return $mime_types;
}

add_filter('upload_mimes', 'bp_mime_type', 1, 1);

function webp_is_displayable($result, $path)
{
    if ($result === false) {
        $displayable_image_types = array(IMAGETYPE_WEBP);
        $info = @getimagesize($path);

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


function remove_default_image_sizes($sizes)
{

    global $config_child_cesar;
    if ($config_child_cesar['delete_images_genereadas']['active'] != 1) return $sizes;

    foreach ($sizes as $mkey => $mval) {
//        $tam_allow=array('medium');
        $tam_allow = $config_child_cesar['delete_images_genereadas']['tam_allow'];
        if (!in_array($mkey, $tam_allow)) {
//			unset($GLOBALS['menu'][$mkey]);
            unset($sizes[$mkey]);
        }
    }


//    /* Default WordPress */
//    unset( $sizes[ 'thumbnail' ]);       // Remove Thumbnail (150 x 150 hard cropped)
//    unset( $sizes[ 'medium' ]);          // Remove Medium resolution (300 x 300 max height 300px)
//    unset( $sizes[ 'medium_large' ]);    // Remove Medium Large (added in WP 4.4) resolution (768 x 0 infinite height)
//    unset( $sizes[ 'large' ]);           // Remove Large resolution (1024 x 1024 max height 1024px)
//
//    /* With WooCommerce */
//    unset( $sizes[ 'woocommerce_gallery_thumbnail' ]);  /* siempre es cuadrado recortado y el valor predeterminado es 100 × 100 píxeles. Esto se usa para navegar por las imágenes en la galería.*/
//    unset( $sizes[ 'woocommerce_thumbnail' ]); /* el valor predeterminado es 600px de ancho, cuadrado recortado para que las cuadrículas del producto se vean ordenadas. El propietario de la tienda puede personalizar la relación de aspecto para el recorte.*/
//    unset( $sizes[ 'woocommerce_single' ]);  /* muestra la imagen completa del producto, tal como se cargó, por lo que siempre está sin recortar de forma predeterminada. Tiene un ancho predeterminado de 600 px.*/
//    unset( $sizes[ 'shop_thumbnail' ]);  // Remove Shop thumbnail (180 x 180 hard cropped)
//    unset( $sizes[ 'shop_catalog' ]);    // Remove Shop catalog (300 x 300 hard cropped)
//    unset( $sizes[ 'shop_single' ]);     // Shop single (600 x 600 hard cropped)

    return $sizes;
}

//Si queremos quitar las  imagenes  generadas

add_filter('intermediate_image_sizes_advanced', 'remove_default_image_sizes');


function check_valid_image_size($file)
{
    global $config_child_cesar;
    if ($config_child_cesar['valid_size_image']['active'] != 1) return $file;


    $allowed_mimetypes = array('image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/webp');

    //Si no validaremos este  tipo de imagenes escapamos
    if (!in_array($file['type'], $allowed_mimetypes)) {
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
    if ($image_width < $minimum['width'] || $image_height < $minimum['height']) {

        //solo si es una  imagen png permitimos que sea pequeña
        if ($file['type'] == 'image/png') {
            return $file;
        }

        $file['error'] = $too_small;
        return $file;
    } elseif ($image_width > $maximum['width'] || $image_height > $maximum['height']) {
        $file['error'] = $too_large;
        return $file;
    } else {
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

add_filter('wp_handle_upload_prefilter', 'check_valid_image_size');

//-----------------nuevos-----------

function debug_admin_menus()
{
    global $submenu, $menu, $pagenow;
    global $config_child_cesar;
    //Haremos el debug si  esta  activo
    if ($config_child_cesar['personalizar_menu']['debug'] != 1) return;

    if ($pagenow == 'index.php') {  // PRINTS ON DASHBOARD


//        echo '----------------------------------------------';
//        echo '----------MENUS---------------------------';
//        echo '----------------------------------------------';
//        echo '<pre>';
//        print_r( $menu );
//        echo '</pre>'; // TOP LEVEL MENUS
//        echo '----------------------------------------------';
//        echo '----------Sub MENUS---------------------------';
//        echo '----------------------------------------------';
//        echo '<pre>';
//        print_r( $submenu );
//        echo '</pre>'; // SUBMENUS
    }
}

add_action('admin_notices', 'debug_admin_menus');


function change_admin_menus()
{
    global $pagenow;
    global $config_child_cesar;
    if ($pagenow == 'index.php') {
        phpConsoleLog($GLOBALS['menu'], 'MENUS');
        phpConsoleLog($GLOBALS['submenu'], 'SUBMENUS');
    }


    if ($config_child_cesar['personalizar_menu']['active'] != 1) return;

    $user = new WP_User(get_current_user_id());
    $rol_first = $user->roles[0];
    $userID = $user->ID;
    $user_email = $user->user_email;



    // si no esta  activado salimos
    //if ($config_child_cesar['usuarios_opciones_limitadas_menu']['active'] != 1) return ;


    $show_menus = $config_child_cesar['personalizar_menu']['show_menus'];

    $sub_menus_del_array = $config_child_cesar['personalizar_menu']['sub_menus_del_array'];

    // si tiene el rol administrator pero no es uno de los admin, se le agregara los filtros
    if ($rol_first === "administrator" and !in_array($user_email, $config_child_cesar['usuarios_opciones_limitadas']['array_users_admin'])) {

        foreach ($GLOBALS['menu'] as $mkey => $mval) {
//		remove_menu_page( 'themes.php' );
            // si el menu no esta  incluido en el array lo borrara
            $slug_menu = $mval[2];
            if (!in_array($slug_menu, $show_menus)) {
                unset($GLOBALS['menu'][$mkey]);
            }
        }


        foreach ($GLOBALS['submenu'] as $mkey => $subMenu) {

            // si no se  encuentra ese sub menu se  saltara
            if (!array_key_exists($mkey, $sub_menus_del_array)) {
//	if (!array_key_exists('users.php', $sub_menus_del_array)) {
                continue;
            }

            $opt_menu_del_array = $sub_menus_del_array[$mkey];


            foreach ($subMenu as $key => $option) {
                $slug_submenu = $option[2];
//					if ( in_array( $slug_submenu, array('plugin-install.php') ) ) {
                if (in_array($slug_submenu, $opt_menu_del_array)) {
                    //echo "{$menu_slug} => {$slug_submenu}" . "\n";
                    //remove_submenu_page( $menu_slug, $slug_submenu );
                    unset($GLOBALS['submenu'][$mkey][$key]);

                }
            }


        }

    }


}


// add_action( 'admin_menu', 'change_media_label' );


// -------------Admin bar
function debug_admin_bar_cesar($all_toolbar_nodes)
{
    global $config_child_cesar;
    if ($config_child_cesar['personalizar_menu']['debug'] != 1) return;
    global $pagenow;
    global $config_child_cesar;

    if ($pagenow == 'index.php') {  // PRINTS ON DASHBOARD
        phpConsoleLog($all_toolbar_nodes, 'ADMINBAR DEBUG');

//        echo '----------------------------------------------';
//        echo '----------ADMINBAR DEBUG---------------------------';
//        echo '----------------------------------------------';
//        echo '<pre>';
//        print_r( $all_toolbar_nodes );
//        echo '</pre>'; // TOP LEVEL MENUS


    }
}


function remove_from_admin_bar($wp_admin_bar)
{

    global $config_child_cesar;

    $all_toolbar_nodes = $wp_admin_bar->get_nodes();
    debug_admin_bar_cesar($all_toolbar_nodes);

    if ($config_child_cesar['personalizar_menu']['active'] != 1) return;

    $user = new WP_User(get_current_user_id());
    $rol_first = $user->roles[0];
    $userID = $user->ID;
    $user_email = $user->user_email;


    //si no es el super administrador
    //si no es el super administrador
    if (!in_array($userID, $config_child_cesar['usuarios_opciones_limitadas_menu'])) {
        return;
    }

    // si no esta  activado salimos
    if ($config_child_cesar['usuarios_opciones_limitadas_menu']['active'] != 1) return;


//	print_r($all_toolbar_nodes);exit;//Debug

    // si tiene el rol administrator pero no es uno de los admin, se le agregara los filtros
    if ($rol_first === "administrator" and !in_array($user_email, $config_child_cesar['usuarios_opciones_limitadas']['array_users_admin'])) {
        $remover_nav_menus = $config_child_cesar['personalizar_menu']['remover_nav_menus'];
//    $remover_nav_menus = array(
//        //--------- seccion:nav cuenta-------------
////		'my-account',
////		'user-info',
//        'edit-profile',
////		'logout',
//        //--------- seccion:nav wordpress-------------
//        'updates',//actualizaciones de wp
//        'comments',//comentarios wp
//        'new-content',//nuevas paginas
//        'wp-logo',//logo wp
//
//        //--------- seccion:nav plugins-------------
//        'wp-rocket',
//        'flatsome_panel',
//        'flatsome-activate',
//        'wpforms-menu',
//
//    );

        $remover_link_nav_menus = $config_child_cesar['personalizar_menu']['remover_link_nav_menus'];
//    $remover_link_nav_menus = array(
//        'user-info',
//    );

        //-----------------------------
        //----------- remover los nav
        //-----------------------------
        foreach ($all_toolbar_nodes as $node) {

//		$wp_admin_bar->remove_node('si_menu');
            if (in_array($node->id, $remover_nav_menus)) {
                $wp_admin_bar->remove_node($node->id);
            }
        }

        //----------------------------------------
        //----------- remover atributos de los nav
        //----------------------------------------
        foreach ($all_toolbar_nodes as $node) {

//		$wp_admin_bar->remove_node('si_menu');
            if (in_array($node->id, $remover_link_nav_menus)) {
                $args = $node;
                // make the node title a blank string
//			$args->title = '';
                $args->href = '';

                // update the Toolbar node
                $wp_admin_bar->add_node($args);
            }
        }
    }


}


function theme_recursos_bloqueados()
{
    global $wp;
    global $config_child_cesar;
    global $pagenow;
    $user = new WP_User(get_current_user_id());
    $rol_first = $user->roles[0];
    $userID = $user->ID;
    $user_email = $user->user_email;
//    if (!in_array($userID, $config_child_cesar['usuarios_opciones_limitadas'])) {
//        return;
//    }

    if ($config_child_cesar['theme_recursos_url_bloqueados']['active'] != 1) {
        return;
    }

    // si tiene el rol administrator pero no es uno de los admin, se le agregara los filtros
    if ($rol_first === "administrator" and !in_array($user_email, $config_child_cesar['usuarios_opciones_limitadas']['array_users_admin'])) {

        $path_url = add_query_arg($wp->query_vars);
        //links   bloqueados
        $urls_array = $config_child_cesar['theme_recursos_url_bloqueados']['recursos_links'];

        //phpConsoleLog($pagenow,'pagenow');
        //phpConsoleLog($path_url,'path_url');


        foreach ($urls_array as $url) {
            ///-si  encontramos la  url no permitida
            if (strpos($path_url, $url) !== false) {
                wp_die('Pagina Error Deshabilitada <br>' . '<a href="/wp-admin/" target="_self">Panel</a>', 'Informacion');
            }

        }

    }



}


//-- para agregar parametro secret - opcional
if (@$config_child_cesar['secret_login']['active'] == 1) {
    add_filter('wp_login_errors', 'my_login_form_lock_down', 90, 2);
}


function my_login_form_lock_down($errors, $redirect_to)
{
    global $config_child_cesar;
    // access the login form like so:  http://example.com/wp-login.php?secretform=yesplease
    $secret_key = "clave";
    $secret_password = $config_child_cesar['secret_login']['secret_password'];

    if (!isset($_GET[$secret_key]) || $_GET[$secret_key] != $secret_password) {
        login_header(__('Log In'), '', $errors);
        echo "</div>";
        do_action('login_footer');
        echo "</body></html>";
        exit;
    }

    return $errors;
}


//add_action('admin_init', 'fn_load_init', 10, 0);
add_action('admin_init', 'theme_recursos_bloqueados');


//add_action('admin_menu', 'change_admin_menus',PHP_INT_MAX );
//add_filter('admin_menu', 'change_admin_menus', 100);//version 2021-04
add_filter('admin_menu', 'change_admin_menus', PHP_INT_MAX);
//add_action( 'plugins_loaded', 'cargarAcciones',PHP_INT_MAX );

add_action('admin_bar_menu', 'remove_from_admin_bar', PHP_INT_MAX);
//add_action( 'admin_head', 'cargarAcciones',PHP_INT_MAX );
