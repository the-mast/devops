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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

define('WP_FAIL2BAN_PROXIES','41.79.78.227');
# BEGIN ANSIBLE MANAGED BLOCK
define('FORCE_SSL_ADMIN', true);
if (strpos($_SERVER['HTTP_X_FORWARDED_PROTO'], 'https') !== false)
$_SERVER['HTTPS']='on';
# END ANSIBLE MANAGED BLOCK
// ** MySQL settings ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '--dbname--' );

/** MySQL database username */
define( 'DB_USER', '--db_user--' );

/** MySQL database password */
define( 'DB_PASSWORD', '--db_password--' );

/** MySQL hostname */
define( 'DB_HOST', '--db_host--' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ']hjZ^GG&|`9Z)}!};jR9HK Z|+$)ajB|T6@g,-8j+zA0QILog`:PuNBD-Y{H=%R)');
define('SECURE_AUTH_KEY',  'Kx=RA2`Z$3|}y;+Dg|Rw(;ybEz[a_.m8|4+~]iR|(w[)$y&S%cbn==&<pmSHDC@I');
define('LOGGED_IN_KEY',    'rr0}h=U@}NI%MU863[ZF{yp~`]26[c6IC6QH$991Z9uwDJ$i-PBNj>yQ{2W;ncX=');
define('NONCE_KEY',        '5t3x4w6;09KNFh+zYgGK]|>4)ox*hoEiRj|l<o>$#[q-/1v<tbMRY,Tl.Y-Kv_g@');
define('AUTH_SALT',        '@tPL~mso*8=Q#?)P`m,sIR0fN+5P06@a#xB^.zK?KViBy.Hb(v:8q|}UH4gYFMO3');
define('SECURE_AUTH_SALT', 'N0It=5{l+|I6/hNzlf^^RaO}@:sW#uu+V-}Hx0=37}UnM@N}-+=1qcv2r~+Jz~Qo');
define('LOGGED_IN_SALT',   ':6gDSs;=/<+z`^I ogSXDB~aY0az,WKX+^Z^^rm&rtnL#dU8n$>]K&hczcq(a.c.');
define('NONCE_SALT',       'L?-l`w=A{M9%,2*l^:ehke!t(T|PT!WwH$$VzrE;1gH>KtHPFLHt~B7q`.%$u+j7');


/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';




/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
