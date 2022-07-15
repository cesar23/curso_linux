<?php
require("json_db.php");
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





    private function getKeyApi(){
        $CUR_DIR = dirname(__FILE__);
        $path_file = $CUR_DIR . "/data_geo_keys.json";
        $obj = new JsonDb($path_file);
        $keys=array();


        $rows = $obj->getTableFilter('access_keys', 'active', true);//obtenemos la  tabla
        $current_date=date("Y-m-d");
        foreach ($rows as $row) {
            //sololos que que estan activos
            $current_time=strtotime($current_date);
            $active_date_desde=strtotime($row['active_date_desde']);

            if($current_time>$active_date_desde){
                array_push($keys,$row['key']);
            }

        }

        if(count($keys)<=0){
            throw new Exception('No hay api Keys activar para validar ips');
        }
        shuffle($keys);
        return $keys[0];
    }



    function validIpCountry($ip, $country_allows = array(), $ips_allows = array())
    {


        $_resOutput = (object)array(
            "success" => false,
            "error_code" => null,
            "messages" => [], //esto es un array
            "country_code" => "",
            "country_name" => ""
        );
        try {
            $_key = $this->getKeyApi();
            ///-------validar ips lista  blanca si asi solo debolvemos
            if (in_array($ip, $ips_allows)) {
                $_resOutput->success = true;
                $_resOutput->messages[] = "La ip: [${ip}] se encuentra en la lista blanca";
                return $_resOutput;
            }


            // --- aqui comenzara la  validacion

            $_request = file_get_contents("http://api.ipstack.com/{$ip}?access_key={$_key}");
            $_res_data = json_decode($_request);

            // si devolbio un error
            if (!$_res_data->country_code) {

                // error: usage_limit_reached : exedio la cuota la key de la cuenta
                if ($_res_data->error->code === 104) {
                    $_resOutput->error_code = $_res_data->error->code;
                    $_resOutput->messages[] = "Error limite exedido para la key:[{$_key}]";
                    //-----aqui desbilitaremos la key
                    $CUR_DIR = dirname(__FILE__);
                    $path_file = $CUR_DIR . "/data_geo_keys.json";
                    $obj = new JsonDb($path_file);
                    $date_new_active= date('Y-m-d', strtotime(date("Y-m-d"). ' + 30 days'));
                    $obj->rowUpdate('access_keys', 'active_date_desde',$date_new_active, 'key', $_key);



                } // ip invalida
                elseif ($_res_data->error->code === 106) {
                    $_resOutput->error_code = $_res_data->error->code;
                    $_resOutput->messages[] = "Ip invalida:[{$ip}]";
                } // error de la ip key: cuando la  api key es  inavlida
                elseif ($_res_data->error->code === 101) {
                    $_resOutput->error_code = $_res_data->error->code;
                    $_resOutput->messages[] = "No ha proporcionado una clave de acceso API";
                } else {
                    //registramos otros errores
                    $_resOutput->error_code = $_res_data->error->code;
                    $_resOutput->messages[] = $_res_data->error->info;
                }


            } else {
                $_resOutput->success = true;
                $_resOutput->country_code = $_res_data->country_code;
                $_resOutput->country_name = $_res_data->country_name;
            }

            //var_dump($country_allows);exit;
            if (in_array($_resOutput->country_code, $country_allows)) {
                $_resOutput->success = true;
                return $_resOutput;
            }else{
                $_resOutput->success = false;
                $_resOutput->messages[] = "El el pais [{$_resOutput->country_name}] no esta permitido";
            }
        } catch (Exception $e) {
            $messages = $e->getMessage();
            $_resOutput->success = false;
            $_resOutput->messages[] = $messages;
            return $_resOutput;
            // echo 'Excepcion capturada: ', $e->getMessage(), "\n";
        }
        return $_resOutput;
        //-----Uso
        // $data=validIpCountry();// devovera un object
        // var_dump(data)

    }




    public function validIpCountryAll($ip,$allows=array())
    {
        $key=$this->getKeyApi();

        try {
            ///validar ips lista  blanca



            // $funk = 1;
//            $country_allows = array("PE");
            $country_allows = $allows;
            $informacionSolicitud = file_get_contents("http://api.ipstack.com/{$ip}?access_key={$key}");
            $dataSolicitud = json_decode($informacionSolicitud);
            return $dataSolicitud;
        } catch (Exception $e) {
            return null;
        }



    }

    // destructor de la clase
    function __destruct()
    {

    }

}
