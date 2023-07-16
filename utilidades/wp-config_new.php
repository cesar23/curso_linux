<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
#define( 'DB_NAME', 'pluging_wp' );
define( 'DB_NAME

/** Database username */
define( 'DB_USER', 'root' );

/** Database password */
define( 'DB_PASSWORD', 'cesar203' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'VjW&m`ia2-<?FRjv</=-O78hKsDA$5/EViaNY;(K/J%Hm8kG&R1>KeaDYoWB^i>1' );
define( 'SECURE_AUTH_KEY',  'n2X>ru,L])&>W^>RMQ%z`-E LW=U+9yh4EYq!=Mc,sL6LOltmEzq33_cVeQxkm%X' );
define( 'LOGGED_IN_KEY',    '@LH0z82CE<ac.mER6k]=y!rZ{`)P~(E{Oym9.t`UoXRtpAEv6gGShCqkb FCWI,r' );
define( 'NONCE_KEY',        'xov{ |q0xbVbF~N6~S[L<1lvx!;]t,*`S5p_4G$Cv8U[=7U;]7Fhz[)H?X8iUz>N' );
define( 'AUTH_SALT',        '!6iHc;uW <%0|*m`v#=30n9R`k*@?ZrBgX-2VOz4CGi:k/yc$w%){E}D9S9(h~5m' );
define( 'SECURE_AUTH_SALT', 'X,kG]RY^{#oM/y5##+]gD4RXN*C0N0k][6mZg@Lv71-hN39mh*qe4pFMFO`L4$4;' );
define( 'LOGGED_IN_SALT',   'q)Dd]f`;g(.MtONa?5}*n|Y`@dYjI}Y;G0B._+}8aPFiY&Q~(-sNP4zx*12as]s ' );
define( 'NONCE_SALT',       '&?c,rmH&Zh-k]=|50ol8B-&rCV0*Tku!KTA>pZ8CZfiRQp`73p6aC%H.i!{O^N]v' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
