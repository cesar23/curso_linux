<?php
require("./classSoluciones/filterGeoIp.php");

function plantilla_bloqueo($ip, $capaSeguridad = 'CAPA SEGURIDAD NUMERO 01', $extra = '',$country_code='',$country_name='')
{


    $platillaHtml = '<!DOCTYPE html>
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
     <h3 class="h5 mb-3 font-weight-normal"><strong>%EXTRA%</strong></h5>
     <h3 class="h5 mb-3 font-weight-normal">%BANERA%</h5>
    <button type="button" class="btn btn-warning">%CAPA_SEGURITY%</button>
    <p>Contacta  con el webmaster www.solucionessystem.com</p>
    <a class="btn btn-lg btn-primary btn-block" href="https://www.solucionessystem.com?type=bloqueado-por-ip">click aqui</a>
    <p class="mt-5 mb-3 text-muted">&copy; 2009-2021 - version 01</p>
</form>
</body>
</html>';
    $platillaHtml = str_replace('%IP_DENIED%', $ip, $platillaHtml);
    //$platillaHtml=str_replace('%IP_DENIED%',$ip_3,$platillaHtml);
//    $platillaHtml=str_replace('%CAPA_SEGURITY%','CAPA SEGURIDAD NUMERO 01',$platillaHtml);
    $platillaHtml = str_replace('%CAPA_SEGURITY%', $capaSeguridad, $platillaHtml);
    $platillaHtml = str_replace('%EXTRA%', $extra, $platillaHtml);
    if($country_code!=""){
        $platillaHtml = str_replace('%BANERA%',
            "<img
  alt=\"{$country_name}\"
  src=\"//cesar23.github.io/cdn_webs/assets/country-flag-icons-gh-pages/1x1//{$country_code}.svg\"/>", $platillaHtml);

    }
    header('HTTP/1.0 403 Forbidden');
    exit($platillaHtml);
}









function action_login_init(){
    try {

        $ip='2001:67c:2660:425:4::8f';

        $CountryIpAllowClass = new FilterGeoIp();
        //$ip=getUserIP();
        if(isset($_COOKIE['cook_ip'])){
            $cook = json_decode($_COOKIE['cook_ip']);
            if($cook->ip==$ip && $cook->valid==0){

                plantilla_bloqueo(
                    $ip,
                    'CAPA SEGURIDAD NUMERO 02',
                    @implode(",",$cook->messages),
                    $cook->country_code,
                    $cook->country_name

                );
            }
            if($cook->ip==$ip && $cook->valid==1){
               return true;
            }
        }


        $country_allows = array("PE");
//    $country_allows = $config_child_cesar['valid_ip_country_capa_2']['country_allows'];
        $ips_allows = [];
        // si la ip no es valida por pais
        $objRes = $CountryIpAllowClass->validIpCountry($ip, $country_allows, $ips_allows);//


        if ($objRes->success === false) {


            setcookie('cook_ip',json_encode(array(
                "ip"=>$ip,
                "valid"=>0,
                "messages"=>'',
                "country_code"=>$objRes->country_code,
                "country_name"=>$objRes->country_name
            )),  time() +3600);//dos  horas

            plantilla_bloqueo(
                $ip,
                'CAPA SEGURIDAD NUMERO 02',
                implode(",",$objRes->messages),
                    $objRes->country_code,
                    $objRes->country_name

            );


        } else {
            setcookie('cook_ip',json_encode(array(
                "ip"=>$ip,
                "valid"=>1,
                "messages"=>"ip valida [{$ip}]",
                "country_code"=>$objRes->country_code,
                "country_name"=>$objRes->country_name
            )),  time() +3600);//dos  horas

        }


    } catch (Exception $e) {
        echo  $e->getMessage();

    }
}

action_login_init();
echo  'Bienvenido a nuestra página web';
//require("./classSoluciones/json_db.php");
//function getKeyApi()
//{
//    $CUR_DIR = dirname(__FILE__);
//    $path_file = $CUR_DIR . "/classSoluciones/data_geo_keys.json";
//    $obj = new JsonDb($path_file);
//    $keys=array();
//
//
//    $rows = $obj->getTableFilter('access_keys', 'active', true);//obtenemos la  tabla
//    $current_date=date("Y-m-d");
//    foreach ($rows as $row) {
//        //sololos que que estan activos
//        $current_time=strtotime($current_date);
//        $active_date_desde=strtotime($row['active_date_desde']);
//
//        if($current_time>$active_date_desde){
//            array_push($keys,$row['key']);
//        }
//
//    }
//
//    if(count($keys)<=0){
//        throw new Exception('No hay api Keys activar para validar ips');
//    }
//    shuffle($keys);
//    return $keys[0];
//}
//
//
//function validIpCountry($ip, $country_allows = array(), $ips_allows = array())
//{
//
//
//    $_resOutput = (object)array(
//        "success" => false,
//        "error_code" => null,
//        "messages" => [], //esto es un array
//        "country_code" => "",
//        "country_name" => ""
//    );
//    try {
//        $_key = getKeyApi();
//        ///-------validar ips lista  blanca si asi solo debolvemos
//        if (in_array($ip, $ips_allows)) {
//            $_resOutput->success = true;
//            $_resOutput->messages[] = "La ip: [${ip}] se encuentra en la lista blanca";
//            return $_resOutput;
//        }
//
//
//        // --- aqui comenzara la  validacion
//
//        $_request = file_get_contents("http://api.ipstack.com/{$ip}?access_key={$_key}");
//        $_res_data = json_decode($_request);
//
//        // si devolbio un error
//        if (!$_res_data->country_code) {
//
//            // error: usage_limit_reached : exedio la cuota la key de la cuenta
//            if ($_res_data->error->code === 104) {
//                $_resOutput->error_code = $_res_data->error->code;
//                $_resOutput->messages[] = "Error limite exedido para la key:[{$_key}]";
//                //-----aqui desbilitaremos la key
//                $CUR_DIR = dirname(__FILE__);
//                $path_file = $CUR_DIR . "/classSoluciones/data_geo_keys.json";
//                $obj = new JsonDb($path_file);
//                $date_new_active= date('Y-m-d', strtotime(date("Y-m-d"). ' + 30 days'));
//                $obj->rowUpdate('access_keys', 'active_date_desde',$date_new_active, 'key', $_key);
//
//
//
//            } // ip invalida
//            elseif ($_res_data->error->code === 106) {
//                $_resOutput->error_code = $_res_data->error->code;
//                $_resOutput->messages[] = "Ip invalida:[{$ip}]";
//            } // error de la ip key: cuando la  api key es  inavlida
//            elseif ($_res_data->error->code === 101) {
//                $_resOutput->error_code = $_res_data->error->code;
//                $_resOutput->messages[] = "No ha proporcionado una clave de acceso API";
//            } else {
//                //registramos otros errores
//                $_resOutput->error_code = $_res_data->error->code;
//                $_resOutput->messages[] = $_res_data->error->info;
//            }
//
//
//        } else {
//            $_resOutput->success = true;
//            $_resOutput->country_code = $_res_data->country_code;
//            $_resOutput->country_name = $_res_data->country_name;
//
//        }
//
//        //var_dump($country_allows);exit;
//        if (in_array($_resOutput->country_code, $country_allows)) {
//            $_resOutput->success = true;
//            return $_resOutput;
//        }
//    } catch (Exception $e) {
//        $messages = $e->getMessage();
//        $_resOutput->success = false;
//        $_resOutput->messages[] = $messages;
//        return $_resOutput;
//        // echo 'Excepcion capturada: ', $e->getMessage(), "\n";
//    }
//    return $_resOutput;
//    //-----Uso
//    // $data=validIpCountry();// devovera un object
//    // var_dump(data)
//
//}
//
//
//var_dump(validIpCountry('161.132.234.178', ["PE"], []));
