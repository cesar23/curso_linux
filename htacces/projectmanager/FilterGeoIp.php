<?php
if (!defined('SOLUCIONES_SYSTEM'))
    exit('No direct script access allowed');

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
        // el archivo se creara en
        $CUR_DIR = dirname(__FILE__);

//        $path_file=$CUR_DIR."/ipsAllow/".date("Y")."_ip_allow.json";
        $path_file = $CUR_DIR . "/" . date("Y") . "_ip_allow.json";
        $this->createArchive($path_file);
        $this->path_json = $path_file;
    }

    private function createArchive($path_file)
    {


        if (!file_exists($path_file)) {
            $file_create = fopen($path_file, "w+");
            if ($file_create == false) {
                die("No se ha podido crear el archivo. en el directorio $path_file");
            }
            fwrite($file_create, "[]");
            fclose($file_create);
            chmod($path_file, 0644);
        }

    }


    //---------------------------------- [start] validacion de IP
    public function query_consulta_json($ip)
    {
        $funk = 0;
        $ip = (string)$ip;
//    $ip=base64_encode($ip);
        try {

            $items = file_get_contents($this->path_json);
            $items = json_decode($items, true);
            foreach ($items as $k => $v) {
                if (isset($v[$ip])) {
                    $funk = 1;
                }
            }
        } catch (Exception $e) {
            $funk = 0;
            echo 'Excepci車n capturada: ', $e->getMessage(), "\n";
        }

        return $funk;

    }

    public function query_save_json($ip)
    {
        $funk = 0;
        $ip = (string)$ip;
//    $ip_base=base64_encode($ip);
        try {
            $items = file_get_contents($this->path_json);
            $items = json_decode($items, true);
            if (empty($items)) {
                $items = [];
            }//si no existe creamos  una array vacio
            //buscar si existe
            $existIp = 0;
            foreach ($items as $k => $v) {
                if (isset($v[$ip])) {
                    $existIp = 1;
                }
            }
            // sino existe lo agregamos
            if ($existIp == 0) {
                array_push($items, array($ip => 1));
            }

            $items = json_encode($items);
            file_put_contents($this->path_json, $items);
            $funk = 1;
        } catch (Exception $e) {
            $funk = 0;
            echo 'Excepci車n capturada: ', $e->getMessage(), "\n";
        }

        return $funk;


    }

    public function validIpCountry($ip)
    {
        $funk = 0;
        try {
            // $funk = 1;
            $country_allows = array("PE");
            $informacionSolicitud = file_get_contents("http://www.geoplugin.net/json.gp?ip=" . $ip);
            $dataSolicitud = json_decode($informacionSolicitud);
            $countryCode = $dataSolicitud->geoplugin_countryCode;
            if (in_array($countryCode, $country_allows)) {
                $funk = 1;
            }
        } catch (Exception $e) {
            echo 'Excepci車n capturada: ', $e->getMessage(), "\n";
        }

        return $funk;

    }


    // destructor de la clase
    function __destruct()
    {

    }

}
///----------- Uso -----------
// define('SULUCIONES_SYSTEM', 'cesar');
//$CountryIpAllowClass = new CountryIpAllowClass();

//$ip = $_SERVER['REMOTE_ADDR'];
//$ip = '1205.23.23.55';
//// si la ip no esta en la lista blanca
//if (!$CountryIpAllowClass->query_consulta_json($ip) == 1) {
//    // si la ip no es valida por pais
//    if (!$CountryIpAllowClass->validIpCountry($ip)) {
//        exit('Ip no valida');
//    } else {
//        //guardamos la  ip en la  lista blanca
//        $CountryIpAllowClass->query_save_json($ip);
//    }
//
//}
//---------------------------------- [start] validacion de IP