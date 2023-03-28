<?php
/*
 * Proteger url y hacer el redirect o hacer otras cosas
 */
function my_redirect_login() {
    // si ya se  logeo salir
    if ( is_user_logged_in() ) {
        return true;
    }

    // Update this array.
    $not_allowed = array(
        "/mi-cuenta/",
        "/my-account/",
        "/about/",
        "/groups/create/"
    );
    // Get the current URI.
    $uri = $_SERVER['REQUEST_URI'];
    // If we're on one of those URLs, redirect away.
    foreach( $not_allowed as $check ) {
        if( strpos( strtolower( $uri ), strtolower( $check ) ) !== false ) {
            wp_redirect( home_url(), 301 );
            exit;
        }
    }
}
add_action( 'template_redirect', 'my_redirect_login' );
