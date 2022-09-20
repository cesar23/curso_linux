
## 1. deshabilitar actualizacion del core de wordpress
editar el archivo `wp-config.php`
```javascript
// Disbale Update Wordpress (cesar 2022-09)
define( 'WP_AUTO_UPDATE_CORE', false );
```

## 2. deshabilitar actualizacion del Plugins y themes
editar el archivo `functions.php`
```javascript
// Disblae update (plugin and themes) cesar
add_filter( 'auto_update_plugin', '__return_false' );
add_filter( 'auto_update_theme', '__return_false' );
```