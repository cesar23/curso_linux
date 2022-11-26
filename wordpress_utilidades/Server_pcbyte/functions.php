<?php
//pcbyte

$url_amigable='www.'.preg_replace('/(http|https):\/\/(\S+)(\/)/i', '${2}', home_url('/') );//www.example.com

define ('VERSION', '2022-08-07-7');


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
}
// ---------------------------- end Crear ROl Gestor-------------------------------------------------













//---------------------------------------------------- script para poner input de origin de producto contact form---------
add_action("wp_enqueue_scripts", "mis_scripts_js");
function mis_scripts_js()
{


    //Cargar s贸lo en las entradas
    // if (is_single()){
    wp_enqueue_script('contact-form-woo', home_url('/') . 'soluciones-tools/js/formulario.js', array(
        'jquery'
    ),  version_id(), true);
    wp_enqueue_script('contact-form-woo');
    //}

}



//------------------------------------------------
//----- agregar contenido al footer y head---------------------------
//------------------------------------------------




//--------------------------------------------------------------
//----- agregar contenido al la apertura del body---------------------------
//-----------------------------------------------------------------

// Add Google Tag code which is supposed to be placed after opening body tag.
add_action( 'wp_body_open', 'add_custom_body_open_code' );

function add_custom_body_open_code() {
    global $url_amigable;

    /*  Botton whapssap Version 001

        $numeroRandom =rand(0, 3);
        $number_Whatsapp= array( '998197574','973989641','916603298','946480897');
        $names_Whatsapp= array('Janet Garcia','Eva Ruiz','Sharon Carbajal','PcByte Ventas');
        $saludo="Buenos días {$names_Whatsapp[$numeroRandom]}, estoy interesado en un producto de la página web ".$url_amigable;
        $url_whapssap= 'https://wa.me/51'.$number_Whatsapp[$numeroRandom].'?text='. urlencode($saludo);
    */


    ?>


    <!--Botton whapssap Version 001-->
    <!--<div class="appWhatssap">-->
    <!--    <a  href="<?php //echo utf8_encode($url_whapssap);?>" target="_blank">-->

    <!--        <img src="<?php //echo home_url('/')?>soluciones-tools/images/whatsapp.png" alt="Whatssap Mensaje">-->


    <!--    </a>-->
    <!--</div>-->


    <a href="https://m.me/pcbyteperu" id="botn_facebook" class="float2" target="_blank">
        <img style="max-width: 37px;" src="https://cesar23.github.io/cdn_webs/iconos_svg/facebook-messenger-brands.svg"
             class="my-float"></img>
    </a>

    <div style="display: none" class="contenedor_wapsa apertura_what">
        <div style="width: 100%;text-align: center">
            <h4 style="color: #009237">¿Con quien quieres hablar?</h4>
        </div>

        <div class="contenedor_inferior" style="">

            <div style="width: 100%;height: 50px;margin-bottom: 3px;">
                <a target="_blank"
                   href="https://api.whatsapp.com/send?phone=51946480897&text=Hola PCBYTE, tengo una consulta">
                    <i class="btn-icon fa-brands fa-whatsapp" style="float: left; margin-right: 5px;"> </i>
                    <div style="float: left">
                        <strong>KATE VILLASANTE</strong><br>946-480897
                    </div>
                </a>
            </div>
            <div style="width: 100%;height: 50px;margin-bottom: 3px;">
                <a target="_blank"
                   href="https://api.whatsapp.com/send?phone=51934822375&text=Hola PCBYTE, tengo una consulta">
                    <i class="btn-icon fa-brands fa-whatsapp" style="float: left; margin-right: 5px;"> </i>
                    <div style="float: left">
                        <strong>JOZZY TUESTA</strong><br>934 822 375
                    </div>
                </a>
            </div>
            <div style="width: 100%;height: 50px;margin-bottom: 3px;">
                <a target="_blank"
                   href="https://api.whatsapp.com/send?phone=51998197574&text=Hola PCBYTE, tengo una consulta">
                    <i class="btn-icon fa-brands fa-whatsapp" style="float: left; margin-right: 5px;"> </i>
                    <div style="float: left">
                        <strong>JANET GARCIA</strong><br>998-197574
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

//---------------------------------------------------------------------------------------
//--------------------------- hooks para pagina producto  woocomerce----------------------------------
//---------------------------------------------------------------------------------------

add_action('woocommerce_after_add_to_cart_button','cmk_additional_button');
function cmk_additional_button() {
    global $product;
    $productID = get_the_ID();
    $product->get_meta( '_customization_id' );
    $yourCustomLinkValue =  get_post_meta($productID,'custom_link_meta',true);
    // echo '<a href="'.$yourCustomLinkValue.'" target="_blank">Buy on Kindle</a>';
    $finalizeCompra=home_url('/') . 'checkout/';
    echo' <a href="'.$finalizeCompra.'" data-url-product="'.$yourCustomLinkValue.'"  data-id-product="'.$productID.'" class="single_add_to_cart_button button alt">Comprar Ahora</a>';
}

/*
add_filter( 'the_title', 'shorten_woo_product_title', 10, 2 );
function shorten_woo_product_title( $title, $id ) {
    if ( get_post_type( $id ) === 'product' ) {
        return substr( $title, 0, 55 )."..."; // change last number to the number of characters you want
    } else {
        return $title;
    }
}
*/

//--------------------------quitar ligbox en woocomerce producto

//------------------------------------------------
//----- ADD CUSTO FILES campos del plugin ya  agregados ---------------------------
//------------------------------------------------


function del_button_specific_product($purchaseable_product_wpblog, $product) {
    //return ($product->id == specific_product_id (512) ? false : $purchaseable_product_wpblog);
    return false;
}


//-----::custom files woocomerce
//add_action( 'woocommerce_single_product_summary', "dcms_caracteristicas_producto", 20 );

function dcms_caracteristicas_producto(){


    if (function_exists('get_field')){

        $disponible = get_field( 'disponible' );
        ?>
        <div class="extras-woocomerce-content">
            <?php
            if($disponible==='si'){
                ?>
                <a class="button success" style="border-radius:12px;"> <span>Disponible xd</span> </a>
                <?php
            }elseif ($disponible==='no'){
                echo '<div id="consultar_producto"><hr></div>';
                echo do_shortcode('[wpforms id="8728" title="false" description="false"]');

                ?>

                <?php
            }

            ?>

        </div>
        <?php



    }

}
//-----::custom files woocomerce


function CamposPersonalizados_GrupoAdicionalSeo(){


    if (function_exists('get_field')){

        if(get_field( 'meta_keyworks' )){
            $meta_keyworks=get_field( 'meta_keyworks' );
            ?>
            <meta name="keywords" content="<?php echo $meta_keyworks?>">
            <?php


        }

    }
}
add_action( 'wp_head', "CamposPersonalizados_GrupoAdicionalSeo",1);


//-----------------------------------------------------------------
//----------------- end Admin Menu------------------------
//-----------------------------------------------------------------



//---------------------Aqui lo nuevo


$array_users_admin=array("perucaos@gmail.com");

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
            "cdn-font-awesome-sol"=>"https://raw.githubusercontent.com/cesar23/cdn_webs/master/libs/font-awesome/5.9.0/css/all.min.css",
        ),


    ],
    //deshabilitar las imagenes que nos genera wordpres tumbail,mediano,large
    'delete_images_genereadas' =>  [
        'active' => 1,//si queremso que este activo
        ///tamaños valido
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
        'maximum_width' => '1380',
        'maximum_height' => '900',
        ///minimo de imagen
        'minimum_width' => '200',
        'minimum_height' => '200',

    ],


    //Validamos ancho y alto maximo de  imagenes
    'valid_ip_country_capa_1' => [
        'active' => 0,
        'modal_info'=>1,
        ///ips  validas
        'ips_allows' => array('38.25.12.72'),

    ],
    'valid_ip_country_capa_2' => [
        'active' => 1,//si queremso que este activo
        'modal_info'=>1,
        ///codigo de paises validos
        'country_allows' => array('PE'),
        ///ips  validas
        'ips_allows' => array('38.25.12.72','209.45.91.36','209.45.91.39'),

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
        'debug' => 0,//si queremso que este activo
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
            'edit.php?post_type=blocks',
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

            //----- Otros plugins
            'woocommerce' => array('https://pcbyte.com.pe/wp-admin/admin.php?page=wc-settings&tab=qlwcdc', 'wc-settings','wc-addons','pcfme_plugin_options'),

        ),
        //--------------------MENU NAV---------------------------
        'remover_nav_menus' => array(
            //--------- seccion:nav cuenta-------------
//		'my-account',
//		'user-info',
            'edit-profile',
//		'logout',
            //--------- seccion:nav wordpress-------------
            'updates',//actualizaciones de wp
            'comments',//comentarios wp
            'new-content',//nuevas paginas
            'wp-logo',//logo wp
            'customize',
            'edit',
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
            'query-monitor'


        ),
        'remover_link_nav_menus' => array(
            'user-info',
        ),

    ],

    'theme_recursos_url_bloqueados' => array(
        'active' => 0,//si queremso que este activo
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

require(dirname(__FILE__) . '/classSoluciones/template_backend.php');
//--para  limitar subida  archivos y productos
define('LIMIT_FILTER_POST',1);
define('LIMIT_FILTER_MEDIA',40852);
define('LIMIT_FILTER_PRODUCT',6500);
define('LIMIT_FILTER_PAGE',12);
require(dirname(__FILE__) . '/classSoluciones/PostLimitWeb.php');


//----------Eliminar imagenes al eliminar  producto

function deleteFilemedia( $path_file ) {
    $uploads_dir = wp_upload_dir();
    $search      = $uploads_dir['basedir'];
    $replace     = $uploads_dir['baseurl'];
    $pathh_final = $search . "/" . $path_file;
    if ( file_exists( $pathh_final ) ) {
        //unlink($pathh_final)
        $final = 111;
    }


}


add_action( 'before_delete_post', function ( $id ) {


    $product = wc_get_product( $id );

    if ( ! $product ) {
        return;
    }

    //guardar los productos
    $all_product_ids         = [];
    $product_thum_id_holder  = [];
    $gallery_image_id_holder = [];
    //imagen portada del producto obtenemos el id  de el media  de la  portada
    $attachment_post_id         = get_post_thumbnail_id( $product->get_id() );
    $attachment_post_ids_galery = $product->get_gallery_image_ids();


    //$log = new Solulog( "log", ( dirname( __FILE__ ) . '/logs/' ) );


    if ( $attachment_post_id >= 0 ) {

        $res = wp_delete_attachment( $attachment_post_id, true );
//		if ( $res !== false ) {
//
//			$query = "select meta_value from wp_postmeta where meta_key='_wp_attached_file' and post_id=" . $attachment_post_id;
//			global $wpdb;
//			$matches = $wpdb->get_results( $query );
//			foreach ( $matches as $result ) {
//				deleteFilemedia( $result->meta_value );
//			}
//		}
        wp_reset_query();
        sleep(1);
    }


    foreach ( $attachment_post_ids_galery as $post_id ) {

        $res = wp_delete_attachment( $post_id, true );
        wp_reset_query();
        sleep(2);
//		if ( $res !== false ) {
//
//
//			$query = "select meta_value from wp_postmeta where meta_key='_wp_attachment_metadata' and post_id=" . $post_id;
//			global $wpdb;
//			$matches = $wpdb->get_results( $query );
//
//			$imagen_portada  = null;
//			$imagen_galerias = array();
//			$dir_base_upload = null;
//
//			$dataSeriales = [];
//			foreach ( $matches as $result ) {
//				$dataSeriales[] = unserialize( $result->meta_value );
//			}
//
//
//			$log->insert( $dataSeriales, false, true, true );
//			foreach ( $dataSeriales as $row ) {
//				$imagen_portada  = $row['file'];
//				$dir_base_upload = dirname( $imagen_portada );
//				$sizes_media     = $row['sizes'];
//
//
//				foreach ( $sizes_media as $k_media => $val_media ) {
//					$del_media = $sizes_media[ $k_media ]['file'];
//					deleteFilemedia( $dir_base_upload . "/" . $del_media );
//					//$data_save['file']['child'][]=$del_media;
//					array_push( $imagen_galerias, $del_media );
//					$dd = 1;
//				}
//
//
//			}
//
//
//		}


    }


} );



//---------------------------------------------------------------------
add_action( 'woocommerce_after_shop_loop_item_title', 'dcms_show_stock_list_products' );
function dcms_show_stock_list_products() {
    global $product;

    if ( $product->is_in_stock() ) {
        if( $product->get_stock_quantity()>=10){
            echo '<div class="list-prod-sku" ><strong>SKU:</strong> '.$product->get_sku().'</div>';
            echo '<div class="list-prod-stock" ><strong>STOCK:</strong> +10</div>';
        }else{
            echo '<div class="list-prod-sku" ><strong>SKU:</strong> '.$product->get_sku().'</div>';
            echo '<div class="list-prod-stock" ><strong>STOCK:</strong> '.$product->get_stock_quantity().'</div>';

        }

    } else {
        echo '<div class="list-prod-sku" ><strong>SKU:</strong> '.$product->get_sku().'</div>';
        echo '<div class="list-prod-stock" ><strong>STOCK:</strong> 0</div>';

    }
}

//--------------- busqueda por  sku
function search_by_sku( $search, &$query_vars ) {
    global $wpdb;
    if(isset($query_vars->query['s']) && !empty($query_vars->query['s'])){
        $args = array(
            'posts_per_page'  => -1,
            'post_type'       => 'product',
            'meta_query' => array(
                array(
                    'key' => '_sku',
                    'value' => $query_vars->query['s'],
                    'compare' => 'LIKE'
                )
            )
        );
        $posts = get_posts($args);
        if(empty($posts)) return $search;
        $get_post_ids = array();
        foreach($posts as $post){
            $get_post_ids[] = $post->ID;
        }
        if(sizeof( $get_post_ids ) > 0 ) {
            $search = str_replace( 'AND (((', "AND ((({$wpdb->posts}.ID IN (" . implode( ',', $get_post_ids ) . ")) OR (", $search);
        }
    }
    return $search;

}
add_filter( 'posts_search', 'search_by_sku', 999, 2 );




//--------------- agregar en el admins el filtrado por destacados y no destacados

function wpa104537_filter_products_by_featured_status() {

    global $typenow, $wp_query;

    if ($typenow=='product') :


        // Featured/ Not Featured
        $output = "<select name='featured_status' id='dropdown_featured_status'>";
        $output .= '<option value="">'.__( 'Mostrar Destacados y no Destacados', 'woocommerce' ).'</option>';

        $output .="<option value='featured' ";
        if ( isset( $_GET['featured_status'] ) ) $output .= selected('featured', $_GET['featured_status'], false);
        $output .=">".__( 'Featured', 'woocommerce' )."</option>";

        $output .="<option value='normal' ";
        if ( isset( $_GET['featured_status'] ) ) $output .= selected('normal', $_GET['featured_status'], false);
        $output .=">".__( 'Not Featured', 'woocommerce' )."</option>";

        $output .="</select>";

        echo $output;
    endif;
}

add_action('restrict_manage_posts', 'wpa104537_filter_products_by_featured_status');
function wpa104537_featured_products_admin_filter_query( $query ) {
    global $typenow;

    if ( $typenow == 'product' ) {

        // Subtypes
        if ( ! empty( $_GET['featured_status'] ) ) {
            if ( $_GET['featured_status'] == 'featured' ) {
                $query->query_vars['tax_query'][] = array(
                    'taxonomy' => 'product_visibility',
                    'field'    => 'slug',
                    'terms'    => 'featured',
                );
            } elseif ( $_GET['featured_status'] == 'normal' ) {
                $query->query_vars['tax_query'][] = array(
                    'taxonomy' => 'product_visibility',
                    'field'    => 'slug',
                    'terms'    => 'featured',
                    'operator' => 'NOT IN',
                );
            }
        }

    }

}
add_filter( 'parse_query', 'wpa104537_featured_products_admin_filter_query' );
