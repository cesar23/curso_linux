

<?php
add_action( 'admin_head', function(){
    if( !isset( $_GET['borrar_customers_sin_pedido'] ) || empty( $_GET['borrar_customers_sin_pedido'] ) ) {

        echo 'hola script';
    }else{

        $args = array(
            'role'    => 'customer',
            'number'  => -1,
            'fields'  => 'ID',
            'orderby' => 'user_nicename', // parámetros de ordenación para que siempre se ejecute en el mismo orden
            'order'   => 'ASC',
            'offset'  => 1000 * 0, // empezando con $paso = 0, irá paso a paso borrando
        );
        $users = get_users( $args );
        echo '--------------borrado----------';
        echo "<ul>";
        foreach ($users as $user_id) {
            $order_count = wc_get_customer_order_count($user_id);
            if ($order_count === 0) {
                echo "<li>Borrando " . $user_id . "</li>";
                // wp_delete_user( $user_id, $id_usuario_contenido_destino ); // $id_usuario_contenido_destino guardará el user_id del usuario al que se le copiará todo el contenido del usuario que se está borrando, solo por si acaso alguno tiene contenido de valor
            } else {
                echo "<li>No borro " . $user_id . "</li>";
            }
            echo "</ul>";

        }
        }
    }
);
