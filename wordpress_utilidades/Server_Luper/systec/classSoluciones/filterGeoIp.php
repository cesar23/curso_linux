<?php

class FilterGeoIp
{

    // variables
    public $x, $y, $z;
    private $tipoMotor;
    public $matricula;
    private $estado;
    private $path_json = '';

    // constructor de la clase
    function __construct()
    {

    }




    public function validIpCountry($ip,$allows=array(),$ips_allows=array())
    {
        $key='e4f389f39500201e6b596cbe6725facf';
        $funk = 0;
        try {
            ///validar ips lista  blanca
            if (in_array($ip, $ips_allows)) {
                $funk = 1;
                return $funk;
            }





            // $funk = 1;
//            $country_allows = array("PE");
            $country_allows = $allows;
            $informacionSolicitud = file_get_contents("http://api.ipstack.com/{$ip}?access_key={$key}");
            $dataSolicitud = json_decode($informacionSolicitud);
            $countryCode = $dataSolicitud->country_code;
            if (in_array($countryCode, $country_allows)) {
                $funk = 1;
            }
        } catch (Exception $e) {
            //echo 'Excepci車n capturada: ', $e->getMessage(), "\n";
        }

        return $funk;

    }


    // destructor de la clase
    function __destruct()
    {

    }

}