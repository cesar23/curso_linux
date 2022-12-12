<?php
/*Este archivo es parte de buddyboss-theme-child, buddyboss-theme child theme.

Todas las funciones de este archivo se cargarán antes que las funciones del tema padre.
Aprende más en https://codex.wordpress.org/Child_Themes.

Nota: esta función carga antes la hoja de estilos padre, después la hoja de estilos del tema hijo
(déjalo en su lugar, salvo que sepas lo que estás haciendo).
*/

$url_amigable = 'www.' . preg_replace('/(http|https):\/\/(www.)?(\S+)(\/)?/i', '${2}', home_url('/'));//www.example.com


define('VERSION', '2021-09-01.3');

function version_id()
{
    if (WP_DEBUG)
        return time();
    return VERSION;
}


if ( ! function_exists( 'suffice_child_enqueue_child_styles' ) ) {
    function buddyboss_theme_child_enqueue_child_styles() {
        // loading parent style
        wp_register_style(
            'parente2-style',
            get_template_directory_uri() . '/style.css'
        );

        wp_enqueue_style( 'parente2-style' );
        // loading child style
        wp_register_style(
            'childe2-style',
            get_stylesheet_directory_uri() . '/style.css'
        );
        wp_enqueue_style( 'childe2-style');
    }
}
add_action( 'wp_enqueue_scripts', 'buddyboss_theme_child_enqueue_child_styles' );

/*Escribe aquí tus propias funciones */



//Checkear El rol del usuario
function check_user_role( $roles, $user_id = null ) {
    if ( $user_id ) {
        $user = get_userdata( $user_id );
    } else {
        $user = wp_get_current_user();
    }
    if ( empty( $user ) ) {
        return false;
    }

    foreach ( $user->roles as $role ) {
        if ( in_array( $role, $roles ) ) {
            return true;
        }
    }

    return false;
}


//-----------------Para que los usuarios que no sean administrador ni editor - No podran acceder al panel Dashboard
add_action( 'init', 'blockusers_init' );

function blockusers_init() {
    if ( is_admin() && ! current_user_can( 'administrator' ) && ! current_user_can( 'editor' ) && ! ( defined( 'DOING_AJAX' ) && DOING_AJAX ) ) {
        wp_redirect( home_url() );
        exit;
    }
}




function remove_admin_bar_style_frontend() { // css override for the frontend
    global $config_child_cesar;

    // si no es Administrador ni editor Quitamos adminbar del front end
    if ( ! check_user_role( array( 'administrator', 'editor' ) ) ) {
        add_filter('show_admin_bar', '__return_false');
        echo '<style type="text/css" media="screen" data-info="remove_admin_bar_style_frontend">
   			#wpadminbar{
				display:none;
			}
			.wp-toolbar {
				padding-top:0px!important;
			}
			html{
				margin-top:0px !important;
			}
      </style>';
    }

    //en esta   parte es  paar  quitarle navs menus del frontend a gestor
    $user      = new WP_User(get_current_user_id());
    $userID = $user->ID;
    if(in_array($userID,$config_child_cesar['usuarios_opciones_limitadas_menu'])){
        echo '<style type="text/css" media="screen" data-info="remobernav-divi">
   			#wp-admin-bar-edit,#wp-admin-bar-popup-maker,#wp-admin-bar-et-use-visual-builder{
				display:none;
			}
      </style>';
    }



}

add_filter( 'wp_head', 'remove_admin_bar_style_frontend', PHP_INT_MAX );


//------------------------agrega un stylo al admin panel


$config_child_cesar = [
    'id' => 11,
    //Aqui  cargaran los script que  querremos en el frontend
    'load_script_front_end' =>  [
        'active' => 1,//si queremso que este activo
        'js_add' => array(
            "script-func-cesar-numbers-sol"=>"soluciones-tools/js/func.cesar.numbers.js",
            "script-frontend-sol"=>"soluciones-tools/js/front-end.js",
        ),
        'css_add' => array(
            "css-style-front-sol"=>"soluciones-tools/css/front-end.css",
            //"cdn-font-awesome-sol"=>"https://raw.githubusercontent.com/cesar23/cdn_webs/master/libs/font-awesome/5.9.0/css/all.min.css",
        ),


    ],
    //deshabilitar las imagenes que nos genera wordpres tumbail,mediano,large
    'delete_images_genereadas' =>  [
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
        'maximum_height' => '1900',
        ///minimo de imagen
        'minimum_width' => '100',
        'minimum_height' => '100',

    ],

    //Validamos Acceso al Admin por ip
    'valid_ip_country_capa_1' => [
        'active' => 0,
        'modal_info'=>1

    ],
    'valid_ip_country_capa_2' => [
        'active' => 1,//si queremso que este activo
        ///codigo de paises validos
        'country_allows' => array('PE'),
        'modal_info'=>1,
        ///ips  validas
        'ips_allows' => array('77.111.246.39'),

    ],
    //------------------Aqui ingresa los ids de usuarios  limitados

    //los ids del usuario que tendran la opcion limitada con js y css (back-end-gestor.js,back-end-gestor.css)
    'usuarios_opciones_limitadas' => [3],
    //Aque usuarios le quitaremos los menus
    'usuarios_opciones_limitadas_menu' => [3],
    //Aque usuarios le agregaremos menus  adicionales
    'usuarios_opciones_menu_adicionales' => [3],

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
///-- paar learndash
            'learndash-lms',
            'users.php',
            'edit.php?post_type=popup',
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
        ///ips  validas
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


            'learndash-lms' => array('learndash_lms_settings','admin.php?page=learndash_lms_settings','admin.php?page=learndash_lms_overview','admin.php?page=learndash_lms_overview','admin.php?page=learndash_lms_addons'),

            //poopup
            'edit.php?post_type=popup' => array("pum-tools","pum-support","pum-extensions","pum-settings","pum-subscribers","edit.php?post_type=popup_theme","edit.php?post_type=popup_theme"),

            //----- Otros plugins
            'woocommerce' => array('https://pcbyte.com.pe/wp-admin/admin.php?page=wc-settings&tab=qlwcdc', 'wc-settings','wc-addons','pcfme_plugin_options'),

        ),
        //--------------------MENU NAV---------------------------
        'remover_nav_menus' => array(
            //--------- seccion:nav cuenta-------------
//		'my-account',
//		'user-info',pr
            'edit-bash.bashrc.sh',
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
            'elementor_edit_page',

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
            // '/wp-admin/users.php',
            // '/wp-admin/user-new.php',
            //'/wp-admin/bash.bashrc.sh.php',
            //----- Plugins
            '/wp-admin/plugins.php',
            '/wp-admin/plugin-install.php',
            '/wp-admin/plugin-editor.php'

        )
    ),
];


//------------------------agrega un stylo al admin panel

// add_filter('show_admin_bar', '__return_false',PHP_INT_MAX);
require(dirname(__FILE__) . '/classSoluciones/template_backend.php');



function solu_menu_header_buddyboss() {
    ?>
    <header id="masthead" class="<?php echo apply_filters( 'buddyboss_site_header_class', 'site-header site-header--bb' ); ?>">
        <?php do_action( THEME_HOOK_PREFIX . 'header' ); ?>
    </header>
    <?php
}
add_shortcode('shortcode_solu_menu_header_buddyboss', 'solu_menu_header_buddyboss');



add_action( 'wp_body_open', 'add_custom_body_open_code' );

function add_custom_body_open_code() {
    global $url_amigable;
    ?>
    <div class="float-whatsapp zoom">
        <a href="https://wa.me/51920203774?text=Quisiera%20mas%20informacion" target="_blank"  class="btn-wsp">
            <img src="https://cesar23.github.io/cdn_webs/camicv/assets/wsp-logo.png"/>
            <div class="description">Escribenos ahora!</div>
        </a>
    </div>
    <!-- Load Facebook SDK for JavaScript -->



    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-M3529BR"
                      height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v12.0&appId=274436560331375&autoLogAppEvents=1" nonce="cVGHIgb8"></script>

    <!-- Boton hacia arriba -->
    <a class="ir-arriba" href="javascript:void(0);" title="Volver arriba">
      <span class="fa-stack">
        <i class="fa fa-circle fa-stack-2x"></i>
        <i class="fa fa-arrow-up fa-stack-1x fa-inverse"></i>
      </span>
    </a>


    <?php
}


