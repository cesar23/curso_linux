### Cómo desactivar la edición de archivos con un perfil de administrador de WordPress
para evitar que editen desde el panel de admisnitracion el archivo `function.php` o el `theme.php` o `styles.php` desde  el wordpress
.editar el archivo `wp-config.php`
```javascript
// deshabilitar la edicion de themas desde wordpress
define('DISALLOW_FILE_EDIT', true);
```
### Quitar revisiones y deshabilitar el cron de wp
.editar el archivo `wp-config.php`
```javascript
//maximo de   revisiones
if (!defined('WP_POST_REVISIONS')) define('WP_POST_REVISIONS', 5);
/* cesar:deshabilita el cron que se llama cada rato */
define('DISABLE_WP_CRON', true);
```

### deshabilitar actualizacion del core de wordpress
editar el archivo `wp-config.php`
```javascript
// Disbale Update Wordpress (cesar 2022-09)
define( 'WP_AUTO_UPDATE_CORE', false );
```

### deshabilitar actualizacion del Plugins y themes
editar el archivo `functions.php`
```javascript
// Disblae update (plugin and themes) cesar
add_filter( 'auto_update_plugin', '__return_false' );
add_filter( 'auto_update_theme', '__return_false' );
```