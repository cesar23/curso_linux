<?php


//$request_uri   = parse_url( $_SERVER['REQUEST_URI'], PHP_URL_PATH );
$request_uri   = $_SERVER['REQUEST_URI'];
//rutas-login
$is_admin= (strlen(strstr($request_uri,'/wp-login.php'))>0)==true
    ||  (strlen(strstr($request_uri,'/wp-login.php'))>0)==true
    ||  (strlen(strstr($request_uri,'/admin.php'))>0)==true
    || preg_match('/author=?/i', $request_uri) == true
    || preg_match('/xmlrpc.php/i', $request_uri) == true
    ||  (strlen(strstr($request_uri,'/wp-login.php'))>0)==true;



//phpConsoleLog($request_uri,"request_uri");
//phpConsoleLog($is_admin,"is_admin");
if ( $is_admin===true ) {
    require_once(dirname(__FILE__) . '/classSoluciones/CheckRangeIpCountry.php');
    require_once(dirname(__FILE__) . '/classSoluciones/helpers/util_helpers.php');
    $platillaHtml='<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Informativo</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
<style>
    .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    @media (min-width: 768px) {
        .bd-placeholder-img-lg {
            font-size: 3.5rem;
        }
    }
</style>
<!-- Custom styles for this template -->
<link href="https://getbootstrap.com/docs/4.3/examples/sign-in/signin.css" rel="stylesheet">
</head>
<body class="text-center">
<form class="form-signin">
    <img class="mb-4" src="https://1.bp.blogspot.com/-aahfC3fLFXU/YFkuaFCCrQI/AAAAAAAAcs0/LJV9Ir2YIMwZSGVmoDTn2-JmjrR2YsIqgCLcBGAsYHQ/s16000/logo%2Bfacebook.png" alt="" width="50%" height="">
    <h1 class="h3 mb-12 font-weight-normal">No tienes acceso desde tu Ip.</h1>
    <h3 class="h3 mb-3 font-weight-normal"><strong>%IP_DENIED%</strong></h3>
    <button type="button" class="btn btn-warning">%CAPA_SEGURITY%</button>
    <p>Contacta  con el webmaster www.solucionessystem.com</p>
    <a class="btn btn-lg btn-primary btn-block" href="https://www.solucionessystem.com?type=bloqueado-por-ip">click aqui</a>
    <p class="mt-5 mb-3 text-muted">&copy; 2009-2021</p>
</form>
</body>
</html>';

    ///------------primera capa con archivo
    $ip = getClientIp_onlyIpv4();
    $isTrueIpRange= CheckRangeIpCountry::validIpCountry($ip,"PE");
    if ($isTrueIpRange!==true){
        $platillaHtml=str_replace('%IP_DENIED%',$ip,$platillaHtml);
        $platillaHtml=str_replace('%CAPA_SEGURITY%','CAPA SEGURIDAD NUMERO 01',$platillaHtml);
        header('HTTP/1.0 403 Forbidden');
        exit($platillaHtml);
    }

    //----segunda  capa con api geoIp

    require_once(dirname(__FILE__) . '/classSoluciones/filterGeoIp.php');
    try {
        $CountryIpAllowClass = new FilterGeoIp();
        $ip = $_SERVER['REMOTE_ADDR'];

//        $country_allows = array("PE");
        $country_allows = array("PE");
        $ips_allows = array();
        // si la ip no es valida por pais
        if (!$CountryIpAllowClass->validIpCountry($ip,$country_allows,$ips_allows)) {
            //wp_die("Tu Ip: {$ip}  No es valida", 'Error', array('back_link' => true));
            $platillaHtml=str_replace('%IP_DENIED%',$ip,$platillaHtml);
            $platillaHtml=str_replace('%CAPA_SEGURITY%','CAPA SEGURIDAD NUMERO 02',$platillaHtml);
            header('HTTP/1.0 403 Forbidden');
            exit($platillaHtml);
        } else {
            //guardamos la  ip en la  lista blanca
            //$CountryIpAllowClass->query_save_json($ip);
        }


    } catch (Exception $e) {
        wp_die('Error: ' . $e->getMessage(), 'Error', array('back_link' => true));

    }

}

function plantilla_bloqueo($ip,$capaSeguridad='CAPA SEGURIDAD NUMERO 01'){
    $platillaHtml='<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Informativo</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
<style>
    .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    @media (min-width: 768px) {
        .bd-placeholder-img-lg {
            font-size: 3.5rem;
        }
    }
</style>
<!-- Custom styles for this template -->
<link href="https://getbootstrap.com/docs/4.3/examples/sign-in/signin.css" rel="stylesheet">
</head>
<body class="text-center">
<form class="form-signin">
    <img class="mb-4" src="https://1.bp.blogspot.com/-aahfC3fLFXU/YFkuaFCCrQI/AAAAAAAAcs0/LJV9Ir2YIMwZSGVmoDTn2-JmjrR2YsIqgCLcBGAsYHQ/s16000/logo%2Bfacebook.png" alt="" width="50%" height="">
    <h1 class="h3 mb-12 font-weight-normal">No tienes acceso desde tu Ip.</h1>
    <h3 class="h3 mb-3 font-weight-normal"><strong>%IP_DENIED%</strong></h3>
    <button type="button" class="btn btn-warning">%CAPA_SEGURITY%</button>
    <p>Contacta  con el webmaster www.solucionessystem.com</p>
    <a class="btn btn-lg btn-primary btn-block" href="https://www.solucionessystem.com?type=bloqueado-por-ip">click aqui</a>
    <p class="mt-5 mb-3 text-muted">&copy; 2009-2021</p>
</form>
</body>
</html>';
    $platillaHtml=str_replace('%IP_DENIED%',$ip,$platillaHtml);
//    $platillaHtml=str_replace('%CAPA_SEGURITY%','CAPA SEGURIDAD NUMERO 01',$platillaHtml);
    $platillaHtml=str_replace('%CAPA_SEGURITY%',$capaSeguridad,$platillaHtml);
    header('HTTP/1.0 403 Forbidden');
    exit($platillaHtml);
}
