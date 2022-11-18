<?php
////------------------------------------------------Para solo tener Imagenes Webp

//-----------------------------------------------
//-------------------tag manager-----------------
//-----------------------------------------------

// Add Google Tag Manager code in <head>
add_action( 'wp_head', 'google_tag_manager_head' );
function google_tag_manager_head() { ?>

    <!-- Google Tag Manager -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
            'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','GTM-NK7THJJ');</script>
    <!-- End Google Tag Manager -->

<?php }


// Add Google Tag Manager code immediately below opening <body> tag
add_action( 'wp_body_open', 'google_tag_manager_body' );
function google_tag_manager_body() { ?>

    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NK7THJJ"
                      height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
<?php }


$config_child_cesar = [
    'id' => 11,
    //Validamos ancho y alto maximo de  iamagenes
    'valid_size_image' => [
        'active' =>1,
        ///maximo de imagen
        'maximum_width' =>'1920',
        'maximum_height' =>'1920',
        ///minimo de imagen
        'minimum_width' =>'200',
        'minimum_height' =>'200',

    ],
];


require(dirname(__FILE__) . '/classSoluciones/template_backend.php');