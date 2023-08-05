<?php
//letich
$url_amigable='www.'.preg_replace('/(http|https):\/\/(www.)?(\S+)(\/)?/i', '${2}', home_url('/') );//www.example.com

global $config_child_cesar;
define ('VERSION', '2020-09-04.5');

function version_id() {

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
}
// ---------------------------- end Crear ROl Gestor-------------------------------------------------





//--------------------------------------------------------------
//----- agregar contenido al la apertura del body---------------------------
//-----------------------------------------------------------------

// Add Google Tag code which is supposed to be placed after opening body tag.
add_action( 'wp_body_open', 'add_custom_body_open_code' );

function add_custom_body_open_code() {
    global $url_amigable;

    ?>

    <a href="https://www.messenger.com/t/100002530733588" id="botn_facebook" class="float2" target="_blank">
        <img style="max-width: 37px;" src="https://cesar23.github.io/cdn_webs/iconos_svg/facebook-messenger-brands.svg"
             class="my-float"></img>
    </a>

    <div style="display: none" class="contenedor_wapsa apertura_what">
        <div style="width: 100%;text-align: center">
            <h4 style="color: #009237">Con quien quieres hablar?</h4>
        </div>

        <div class="contenedor_inferior" style="">



            <div style="width: 100%;height: 50px;margin-bottom: 3px;">
                <a target="_blank"
                   href="https://api.whatsapp.com/send?phone=51990002905&text=Hola Inversiones Letich, tengo una consulta">
                    <i class="btn-icon fa-brands fa-whatsapp" style="float: left; margin-right: 5px;"> </i>
                    <div style="float: left">
                        <strong>VENTAS</strong><br>990-002905
                    </div>
                </a>
            </div>

        </div>
    </div>
    <span id="botn_whapsa" style="cursor: pointer" class="float" target="_blank">
        <i class="fa-brands fa-whatsapp fa-lg  my-float"></i>

    </span>
    <style>
        :root {
            /*( cantidad de numeros , alto que tiene cada fila)*/
            --cant_items_phone:calc(3 * 53px);
            /*Aqui seteamos el alto dependiendo del numero de arriba*/
            --contenedor_wapsa_height: calc(90px + var(--cant_items_phone));
            --contenedor_inferior_height:  calc(33px + var(--cant_items_phone));

        }
        .float {
            padding-top: 7px;
            position: fixed;
            width: 60px;
            height: 60px;
            bottom: 40px;
            right: 42px;
            background-color: #25d366;
            color: #FFF;
            border-radius: 50px;
            text-align: center;
            font-size: 30px;
            box-shadow: 2px 2px 3px #999;
            z-index: 100;
        }

        .contenedor_wapsa {
            width: 320px;
            height: var(--contenedor_wapsa_height);
            background-color: #ffffff;
            padding-top: 7px;
            position: fixed;
            bottom: 108px;
            right: 52px;
            color: #FFF;
            border-radius: 5px;
            z-index: 100;
            border: 1px solid green;
            overflow: hidden;
            -webkit-box-shadow: 12px 13px 16px -8px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 12px 13px 16px -8px rgba(0, 0, 0, 0.75);
            box-shadow: 12px 13px 16px -8px rgba(0, 0, 0, 0.75);
        }

        .apertura_what {
            animation-name: animacion_whapBox;
            animation-duration: 0.7s;
        }

        @keyframes animacion_whapBox {
            0% {
                width: 0px;
                height: 0px;
            }

            100% {
                width: 275px;
                /*height: 400px;*/
                height: var(--contenedor_wapsa_height);
            }
        }

        .contenedor_inferior {
            padding: 15px;
            margin: 10px;
            background-color: #f3f3f3;
            height: var(--contenedor_inferior_height);
            border-radius: 5px;
            overflow: auto;
        }

        .float:hover {
            cursor: pointer;
        }


        .btn-icon {
            padding: 10px;
            background-color: #1bc159;
            color: white;
            border-radius: 50%;
        }

        .float2 {
            padding-top: 4px;
            position: fixed;
            width: 60px;
            height: 60px;
            bottom: 40px;
            right: 120px;
            background-color: #1094f4;
            color: #FFF;
            border-radius: 50px;
            text-align: center;
            font-size: 30px;
            box-shadow: 2px 2px 3px #999;
            z-index: 100;
        }

        /*Para dispositivos mobiles*/
        @media screen and (max-width: 600px) {
            .float {
                right: 21px;
            }

            .float2 {
                right: 110px;
            }

            .contenedor_wapsa {
                bottom: 107px;
                right: 28px;
            }
        }
    </style>

    <script>
        (function ($) {
            var valConst = false;
            $(document).ready(function () {

                $("#botn_whapsa").hover(
                    function () {
                        $(".contenedor_wapsa").attr("style", "display: block")
                    }, function () {
                        setTimeout(function () {
                            if (!valConst) {
                                $(".contenedor_wapsa").attr("style", "display: none")
                            }
                        }, 100)

                    }
                );
                $(".contenedor_wapsa").hover(
                    function () {
                        valConst = true;
                    }, function () {
                        valConst = false;
                        $(".contenedor_wapsa").attr("style", "display: none")
                    }
                );
                $("#botn_telegram").hover(
                    function () {
                        $(".contenedor_telegram").attr("style", "display: block")
                    }, function () {
                        setTimeout(function () {
                            if (!valConst) {
                                $(".contenedor_telegram").attr("style", "display: none")
                            }
                        }, 100)

                    }
                );
                $(".contenedor_telegram").hover(
                    function () {
                        valConst = true;
                    }, function () {
                        valConst = false;
                        $(".contenedor_telegram").attr("style", "display: none")
                    }
                );


            });

        })(jQuery);

    </script>

    <?php
}





$array_users_admin=array("perucaos@gmail.com");
$config_child_cesar = [
    'id' => 11,
    //Aqui  cargaran los script que  querremos en el frontend
    'load_script_front_end' =>  [
        'active' => 1,//si queremso que este activo
        'js_add' => array(
            "script-func-cesar-numbers-sol"=>"/soluciones-tools/js/func.cesar.numbers.js",
            "script-frontend-sol"=>"/soluciones-tools/js/front-end.js",
        ),
        'css_add' => array(
            "css-style-front-sol"=>"/soluciones-tools/css/front-end.css",
            "cdn-font-awesome-sol"=>"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css",
        ),


    ],
    //deshabilitar las imagenes que nos genera wordpres tumbail,mediano,large
    'delete_images_genereadas' =>  [
        'active' => 1,//si queremso que este activo
        ///tama単os valido
        // 'tam_allow' => array('medium'),
        'tam_allow' => array(),


    ],
    'secret_login' =>  [
        'active' => 0,//si queremso que este activo
        ///tama単os valido
        // 'tam_allow' => array('medium'),
        'secret_key' =>'clave',
        'secret_password' =>'peru203',


    ],
    'my_style_login' =>  [
        'active' => 1,//si queremso que este activo
        ///tama単os valido
        // 'tam_allow' => array('medium'),
        'tam_allow' => array(),


    ],
    //Validamos ancho y alto maximo de  imagenes
    'valid_size_image' => [
        'active' => 1,//si queremso que este activo
        ///maximo de imagen
        'maximum_width' => '2000',
        'maximum_height' => '2000',
        ///minimo de imagen
        'minimum_width' => '100',
        'minimum_height' => '100',

    ],
    //Validamos ancho y alto maximo de  imagenes
    'valid_ip_country_capa_1' => [
        'active' => 0

    ],
    'valid_ip_country_capa_2' => [
        'active' => 1,//si queremso que este activo
        ///codigo de paises validos
        'country_allows' => array('PE'),
        ///ips  validas
        'ips_allows' => array('77.111.246.39'),

    ],
    'restrict_paths_url' => [
        //si queremso que este activo
        'active' => 1,
        /*
         * estos path seran restringidos por el filtrado de las ips
         * (valid_ip_country_capa_1 , valid_ip_country_capa_2)
         */
        'not_allowed' => array( "/mi-cuenta/", "/my-account/")

    ],
    //------------------Aqui ingresa los ids de usuarios  limitados

    //los usuario que tendran la opcion limitada con js y css (back-end-gestor.js,back-end-gestor.css)
    'usuarios_opciones_limitadas' => [
        'active' => 1,//si queremso que este activo
        // usuarios admin con privilegios
        'array_users_admin' => $array_users_admin // ['perucaos@gmail.com']
    ],

    //Aque usuarios No le quitaremos los menus
    'usuarios_opciones_limitadas_menu' => [
        'active' => 1,//si queremso que este activo
        // usuarios admin con privilegios
        'array_users_admin' => $array_users_admin // ['perucaos@gmail.com']
    ],

    //Aque usuarios le agregaremos menus  adicionales
    'usuarios_opciones_menu_adicionales' => [2,3],

    //Validamos ancho y alto maximo de  imagenes
    'personalizar_menu' => [
        'debug' => 1,//si queremso que este activo
        'active' => 1,//si queremso que este activo

        //--------------------MENU---------------------------
        ///codigo de paises validos
        'show_menus' => array(
            //-----Escritorio
            'index.php',
            //--Medios
            'upload.php',
            //-Woocomerce
            'woocommerce',
            'edit.php?post_type=product',
            'menu_v1_root',
//
//            //--------Ajustes
//            'options-general.php',
//            //----- Apariencia
//            'themes.php',
//            //----- Herramientas
//            'tools.php',
//            //----- Usuarios
//            'users.php',
//            //----- Comentarios
//            'edit-comments.php',
//            //----- Plugins
//            'plugins.php',
//            'elementor',
//
//
//            'flatsome-panel',
//            'edit.php',//post
//            'edit.php?post_type=featured_item',//portafolio
//            'edit.php?post_type=page',//paginas
//            'edit.php?post_type=blocks',//Ublock Flatsome
//            'edit.php?post_type=blocks',//Ublock Flatsome
//            'edit.php?post_type=elementor_library',//Plantillas  elementor
//            'wpforms-overview',//Wp forms
//            'wp-mail-smtp',//Wp Mail SMP
//            'wpseo_dashboard',//Yoast Seo
//            'aiowpsec',//Seguridad Wp
//            'WP-Optimize',//WP Optimize (Database)
//            'smush',//Smush (Optimizador de imagenes)


        ),

        'sub_menus_del_array' => array(
            //---------Inicio
            'index.php' => array('update-core.php','wpforms-getting-started'),

            //--------Ajustes
            'options-general.php' => array('options-writing.php'),
            //----- Apariencia
            'themes.php' => array(),
            //----- Herramientas
            'tools.php' => array('import.php', 'export.php'),
            //----- Usuarios
            'users.php' => array(),
            //----- Plugins
            'plugins.php' => array('plugin-editor.php', 'plugin-install.php'),

            //----- Otros plugins
            'woocommerce' => array('https://pcbyte.com.pe/wp-admin/admin.php?page=wc-settings&tab=qlwcdc', 'wc-settings','wc-addons','pcfme_plugin_options'),


        ),
        //--------------------MENU NAV---------------------------
        //------- removera los nav_menus
        'remover_nav_menus' => array(
            //--------- seccion:nav cuenta-------------
//		'my-account',
//		'user-info',pr
            'edit-profile',
//		'logout',
            //--------- seccion:nav wordpress-------------
            'updates',//actualizaciones de wp
            'comments',//comentarios wp
            'new-content',//nuevas paginas
            'wp-logo',//logo wp
            'customize',
            'themes',
            'widgets',
            'menus',

            //--------- seccion:nav plugins-------------
            // 'wp-rocket',
            'archive',
            'flatsome_panel',
            'flatsome-activate',
            'wpforms-menu',
            'wpseo-menu',//yoast
            'wpforms-menu',
            //wp-rocket -items
            'rocket-settings',
            'preload-cache',
            'docs',
            'faq',
            'support',
            'regenerate-critical-path',



        ),
        //------- removera los links nav_menus
        'remover_link_nav_menus' => array(
            'user-info',
        ),

    ],

    'theme_recursos_url_bloqueados' => array(
        'active' => 1,//si queremso que este activo
        'recursos_links'=>array(
            //deshabilito  el panel de paginas
            '/wp-admin/edit.php?post_type=page',
            //--------Ajustes
            '/wp-admin/options-general.php',
            '/wp-admin/options-writing.php',
            '/wp-admin/options-reading.php',
            '/wp-admin/options-discussion.php',
            '/wp-admin/options-media.php',
            '/wp-admin/options-permalink.php',
            '/wp-admin/options-privacy.php',
            //----- Apariencia
            '/wp-admin/themes.php',
            '/wp-admin/customize.php',
            '/wp-admin/widgets.php',
            '/wp-admin/nav-menus.php',
            '/wp-admin/theme-editor.php',
            //----- Herramientas
            '/wp-admin/tools.php',
            '/wp-admin/import.php',
            '/wp-admin/export.php',
            '/wp-admin/site-health.php',
            '/wp-admin/export-personal-data.php',
            '/wp-admin/erase-personal-data.php',
            //----- Usuarios
            '/wp-admin/users.php',
            '/wp-admin/user-new.php',
            '/wp-admin/profile.php',
            //----- Plugins
            '/wp-admin/plugins.php',
            '/wp-admin/plugin-install.php',
            '/wp-admin/plugin-editor.php'

        )
    ),
];

// Disblae update (plugin and themes) cesar
add_filter( 'auto_update_plugin', '__return_false' );
add_filter( 'auto_update_theme', '__return_false' );

require(dirname(__FILE__) . '/classSoluciones/template_backend.php');

//--para  limitar subida  archivos y productos
define('LIMIT_FILTER_POST',1);
define('LIMIT_FILTER_MEDIA',250);
define('LIMIT_FILTER_PRODUCT',20);
define('LIMIT_FILTER_PAGE',12);
require(dirname(__FILE__) . '/classSoluciones/PostLimitWeb.php');
