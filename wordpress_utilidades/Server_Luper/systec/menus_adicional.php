<?php
//-------------------------------------------------
///::-----crear menu y opciones
//-------------------------------------------------
add_action('admin_menu', 'register_menu_v1');
function register_menu_v1()
{
    global $config_child_cesar;

    $user = new WP_User(get_current_user_id());
    $rol_first = $user->roles[0];
    $userID = $user->ID;

    if (in_array($userID, $config_child_cesar['usuarios_opciones_menu_adicionales'])) {

        add_menu_page('Administracion de Paginas', // titulo de la pagina a mostrar
            'Administracion', // titulo del menu
            'manage_options', // permisos
            'menu_v1_root', // url unica
            'adminPaginas', // funcion que contiene el codigo que queremos pintar
            'dashicons-book', // icono que queramos poner ver dashicons
            null, 9
        );

        add_submenu_page('menu_v1_root',
            'Administrar Paginas', 'Administrar Paginas',
            'manage_options', 'menu_v1_submenu_1',
            'adminPaginas', 9);

        add_submenu_page('menu_v1_root',
            'Vaciar Cache', 'Vaciar Cache',
            'manage_options', 'menu_v1_submenu_2',
            'vaciarCacheWpRocket', 9);
    }


}


function adminPaginas()
{
    $paginas = array(
        "Portada" => home_url() . "/wp-admin/post.php?post=1122&action=edit",
        "SERVICIOS DE ESPACIOS CONFINADOS ESPECIALES" => home_url() . "/wp-admin/post.php?post=1506&action=edit",
        "SERVICIO DE DESINFECCIÓN Y DESINSECTACIÓN" => home_url() . "/wp-admin/post.php?post=1880&action=edit",
        "LIMPIEZA Y MANTENIMIENTO DE REDES Y ALCANTARILLADO" => home_url() . "/wp-admin/post.php?post=1919&action=edit",
        "LIMPIEZA DE TANQUES Y CISTERNAS DE AGUA" => home_url() . "/wp-admin/post.php?post=1869&action=edit",
        "Quienes Somos" => home_url() . "/wp-admin/post.php?post=1620&action=edit",

    )
    ?>
    <div class="wrap">
        <h2>Lista de paginas para Editar</h2>
        <p> Desde esta pagina podras editar el contenido de las paginas </p>
        <ul>
            <?php
            foreach ($paginas as $key => $value) {
                ?>
                <li><a href="<?php echo $value; ?>" target="_self"><?php echo $key; ?></a></li>

            <?php } ?>
        </ul>
    </div>
    <?php
}

function vaciarCacheWpRocket()
{
    if ( function_exists( 'rocket_clean_domain' ) ) {
        rocket_clean_domain();
    }

// Preload cache.
    if ( function_exists( 'run_rocket_sitemap_preload' ) ) {
        run_rocket_sitemap_preload();
    }

    ?>
    <div class="wrap">
        <h2>Cache</h2>
        <p> Desde esta pagina podras editar el contenido de las paginas </p>
        <br>

        <p>
            <?php
            //$url_qp_rocket= wp_nonce_url( admin_url( 'admin-post.php?action=purge_cache&type=all&_wp_http_referer=%2Fwp-admin%2Findex.php' ));
            $activado = search_plugin_active('wp-rocket');
            if ($activado == true){
                ?>
                <a href="#"
                   target="_self">Se Vacio La Cache</a>
                <br>


            <?php }else{ ?>
        <h4>No esta activo la cache</h4>
        <?php } ?>
        </p>
    </div>
    <?php
}

