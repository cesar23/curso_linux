<?php
define('SOLUCIONES_SYSTEM', 'cesar');
require_once 'FilterGeoIp.php';

try {
    $CountryIpAllowClass = new FilterGeoIp();
    $ip = $_SERVER['REMOTE_ADDR'];
// si la ip no esta en la lista blanca
    if (!$CountryIpAllowClass->query_consulta_json($ip) == 1) {
        // si la ip no es valida por pais
        if (!$CountryIpAllowClass->validIpCountry($ip)) {
            exit('Ip no valida');
        } else {
            //guardamos la  ip en la  lista blanca
            $CountryIpAllowClass->query_save_json($ip);
        }

    }
} catch (Exception $e) {
    echo 'Excepción capturada: ', $e->getMessage(), "\n";
}


/**
 * CodeIgniter
 *
 */