<?php
$url_amigable = 'www.' . preg_replace('/(http|https):\/\/(www.)?(\S+)(\/)?/i', '${2}', home_url('/'));//www.example.com


define('VERSION', '2021-01-28.3');

function version_id()
{
    if (WP_DEBUG)
        return time();
    return VERSION;
}

// Add custom Theme Functions here
// ---------------------------- start Crear ROl Gestor-------------------------------------------------
add_action('init', 'cloneRole');

function cloneRole()
{
    global $wp_roles;
    global $version;
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
add_action('wp_body_open', 'add_custom_body_open_code');

function add_custom_body_open_code()
{
    global $url_amigable;
    ?>
    <style>
        .float-whatsapp {
            bottom: 2%;
            right: 5%;

        }
    </style>
    <div class="float-whatsapp zoom">
        <a href="https://wa.me/51933306046?text=Quisiera%20mas%20informacion%20de%20<?php echo $url_amigable ?>" target="_blank"  class="btn-wsp">
            <img src="<?php echo home_url('/');?>soluciones-tools/images/wsp-logo.png"/>
            <div class="description">En que te ayudamos !</div>
        </a>
    </div>


    <!-- Load Facebook SDK for JavaScript -->
    <div id="fb-root"></div>
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                xfbml: true,
                version: 'v7.0'
            });
        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s);
            js.id = id;
            js.src = 'https://connect.facebook.net/es_LA/sdk/xfbml.customerchat.js';
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>

    <!-- Your customer chat code -->
    <div class="fb-customerchat"
         attribution=setup_tool
         page_id="109780637407802"
         logged_in_greeting="Hola! Bienvenido a <?php echo $url_amigable ?> en que podemos ayudarle?"
         logged_out_greeting="Hola! Bienvenido a <?php echo $url_amigable ?> en que podemos ayudarle?">
    </div>
    <?php
}


$config_child_cesar = [
    'id' => 11,
    //deshabilitar las imagenes que nos genera wordpres tumbail,mediano,large
    'delete_images_genereadas' => 1,
    //Validamos ancho y alto maximo de  imagenes
    'valid_size_image' => [
        'active' => 1,//si queremso que este activo
        ///maximo de imagen
        'maximum_width' => '1920',
        'maximum_height' => '1920',
        ///minimo de imagen
        'minimum_width' => '200',
        'minimum_height' => '200',

    ],
    //Validamos ancho y alto maximo de  imagenes
    'valid_ip_country' => [
        'active' => 1,//si queremso que este activo
        ///codigo de paises validos
        'country_allows' => array('PE'),
        ///ips  validas
        'ips_allows' => array('77.111.246.39'),

    ],
    //------------------Aqui ingresa los ids de usuarios  limitados

    //los ids del usuario que tendran la opcion limitada con js y css (back-end-gestor.js,back-end-gestor.css)
    'usuarios_opciones_limitadas' => [1,2, 3],
    //Aque usuarios le quitaremos los menus
    'usuarios_opciones_limitadas_menu' => [1,2, 3],
    //Aque usuarios le agregaremos menus  adicionales
    'usuarios_opciones_menu_adicionales' => [1, 2, 3],

    //Validamos ancho y alto maximo de  imagenes
    'personalizar_menu' => [
        'debug' => 1,//si queremso que este activo
        'active' => 1,//si queremso que este activo
        //--------------------MENU---------------------------
        ///codigo de paises validos
        'menus_del_array' => array(

            //--------Ajustes
            'options-general.php',
            //----- Apariencia
            'themes.php',
            //----- Herramientas
            'tools.php',
            //----- Usuarios
            'users.php',
            //----- Comentarios
            'edit-comments.php',
            //----- Plugins
            'plugins.php',
            'elementor',


            'flatsome-panel',
            'edit.php',//post
            'edit.php?post_type=featured_item',//portafolio
            'edit.php?post_type=page',//paginas
            'edit.php?post_type=blocks',//Ublock Flatsome
            'edit.php?post_type=blocks',//Ublock Flatsome
            'edit.php?post_type=elementor_library',//Plantillas  elementor
            'wpforms-overview',//Wp forms
            'wp-mail-smtp',//Wp Mail SMP
            'wpseo_dashboard',//Yoast Seo
            'aiowpsec',//Seguridad Wp
            'WP-Optimize',//WP Optimize (Database)
            'smush',//Smush (Optimizador de imagenes)


        ),
        ///ips  validas
        'sub_menus_del_array' => array(
            //---------Inicio
            'index.php' => array('update-core.php'),

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

        ),
        //--------------------MENU NAV---------------------------
        'remover_nav_menus' => array(
            //--------- seccion:nav cuenta-------------
//		'my-account',
//		'user-info',
            'edit-bash.bashrc.sh',
//		'logout',
            //--------- seccion:nav wordpress-------------
            'updates',//actualizaciones de wp
            'comments',//comentarios wp
            'new-content',//nuevas paginas
            'wp-logo',//logo wp

            //--------- seccion:nav plugins-------------
            'wp-rocket',
            'flatsome_panel',
            'flatsome-activate',
            'wpforms-menu',


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
            '/wp-admin/users.php',
            '/wp-admin/user-new.php',
            '/wp-admin/bash.bashrc.sh.php',
            //----- Plugins
            '/wp-admin/plugins.php',
            '/wp-admin/plugin-install.php',
            '/wp-admin/plugin-editor.php'

        )
    ),
];


//------------------------agrega un stylo al admin panel


require(dirname(__FILE__) . '/classSoluciones/template_backend.php');

require(dirname(__FILE__) . '/menus_adicional.php');
