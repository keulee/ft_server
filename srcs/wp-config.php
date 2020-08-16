<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '@iY6330Y`ba%g`46~U>-;F7l[)8wbU>b8?Ro9MK-{8#x-,12MxN[/X[A2W++LAk*');
define('SECURE_AUTH_KEY',  'qKR`5.C6=Fxi[A*oz#UkXWO<%$NkU-=|ZVi>*GAg<@hj~7Q9yer~{#g%eOX*X+++');
define('LOGGED_IN_KEY',    'E{T%: 6F-UJ~3-%|X8jR +p&W<kH-o<DS&:|vI${Z%e(h(h.n7t@mrk5/FQ=h@y.');
define('NONCE_KEY',        '/ExN0(D]Ww+}`nI~Da(1pOLx<Tsp:>Up8964iVZfK>l)VroI{yyB_erGd6{Nf]lo');
define('AUTH_SALT',        'bvE<&s@($E5FTyy@1y!-?HA-Yhevx01_Fut?9?i:%uz+vm(@42_hB#BZ9&@`_5bp');
define('SECURE_AUTH_SALT', '@w+_D;XS41JQ~!0JQXXL28c_NsvV=075O:z/t&*1%#P96KDk5V+_JIE3j[g]]1aT');
define('LOGGED_IN_SALT',   'yqW:dQ)-mDG0Ij_RYtw-V9yn7Q.MtG&zt:/j SjO*g)Gz52M+}Pp:4^&%BZwo0&*');
define('NONCE_SALT',       '_-b]mTX@`kgPHNSZ!1O5YG#zS,d8]+0PQ4-+?KrYQ*DC.M+c3/( Ym0:taGU+eK+');

/**#@-*/

/**
 * WordPress Database Table prefix.
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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
