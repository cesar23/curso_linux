fuentes:
(Modo debug y entrar modo prueba de fallos)
https://www.youtube.com/watch?v=eRjgG6xWBHE




## 1. Activar Debug y Errores y log

editar el fichero: `wp-config.php`

```javascript 

//----------- modo debug (generar un file en /wp-content/debug_log)
define('WP_DEBUG', true); // activar debug
define('WP_DEBUG_LOG', true); // que se guarde en un archivo log
define('WP_DEBUG_DISPLAY', false); // que no aparesca el error en la pagina solo  lo guarde en un log

```

<img src="https://i.imgur.com/WvGJ8U4.png" >
-- --------------------------


#### ✅ recuerda que el archivo log esta en:  `/wp-content/debug_log`


## 2. Generar logs  propios
recordar activar el modo `debug` de wordpress como esta en `Activar Debug y Errores y log` 👆

editar: `function.php`

```javascript
if (!function_exists('write_log')) {

    function write_log($log) {
        if (true === WP_DEBUG) {
            if (is_array($log) || is_object($log)) {
                error_log(print_r($log, true));
            } else {
                error_log($log);
            }
        }
    }

}

write_log('THIS IS THE START OF MY CUSTOM DEBUG');
//i can log data like objects
write_log($config_child_cesar);

```

<img src="https://i.imgur.com/MleAbwd.png" >
-- --------------------------
