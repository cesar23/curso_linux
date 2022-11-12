<?php
$array_users_admin=["perucaos@gmail.com"];
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
            "cdn-font-awesome-sol"=>"https://raw.githubusercontent.com/cesar23/cdn_webs/master/libs/font-awesome/5.9.0/css/all.min.css",
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
        'active' => 1,//si queremso que este activo
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
        'maximum_width' => '1000',
        'maximum_height' => '1000',
        ///minimo de imagen
        'minimum_width' => '200',
        'minimum_height' => '200',

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
            // '/wp-admin/users.php',
            // '/wp-admin/user-new.php',
            //'/wp-admin/profile.php',
            //----- Plugins
            '/wp-admin/plugins.php',
            '/wp-admin/plugin-install.php',
            '/wp-admin/plugin-editor.php'

        )
    ),
];
$userID=1;
$rol_first = "administrator";
$user_email="perucaos@gmail.com";
$array_users_admin=["perucaos@gmail.com"];
if($rol_first === "administrator" and !in_array($user_email,$array_users_admin)){

   echo "usuario bloqueado ";
}
//$rol_first = $user->roles[0];
//$userID = $user->ID;
//$user_email = $user->user_email;
//var_dump($user_email,$rol_first);
