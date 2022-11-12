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
    public function isJson($string) {
        json_decode($string);
        return json_last_error() === JSON_ERROR_NONE;
    }
    public function curl($url, $method = 'get', $header = null, $postdata = null, $timeout = 60)
    {

        $result = array();
        $result["status"] = true;
        $result["statusCode"] = null;
        $result["error"] = "";
        $result["message"] = "";
        $result["data"] = "";


        $s = curl_init();
        // initialize curl handler

        curl_setopt($s, CURLOPT_URL, $url);
        //set option  URL of the location
        if ($header)
            curl_setopt($s, CURLOPT_HTTPHEADER, $header);
        //set headers if presents
        curl_setopt($s, CURLOPT_TIMEOUT, $timeout);
        //time out of the curl handler
        curl_setopt($s, CURLOPT_CONNECTTIMEOUT, $timeout);
        //time out of the curl socket connection closing
        curl_setopt($s, CURLOPT_MAXREDIRS, 3);
        //set maximum URL redirections to 3
        curl_setopt($s, CURLOPT_RETURNTRANSFER, true);//OJO cesar probar (true,false)

        // set option curl to return as string ,don't output directly
        curl_setopt($s, CURLOPT_FOLLOWLOCATION, 1);
        // curl_setopt($s,CURLOPT_COOKIEJAR, 'cookie.txt');
        // curl_setopt($s,CURLOPT_COOKIEFILE, 'cookie.txt');
        //set a cookie text file, make sure it is writable chmod 777 permission to cookie.txt

        if (strtolower($method) == 'post') {
            curl_setopt($s, CURLOPT_POST, true);
            //set curl option to post method
            curl_setopt($s, CURLOPT_POSTFIELDS, $postdata);
            //if post data present send them.
        } else if (strtolower($method) == 'delete') {
            curl_setopt($s, CURLOPT_CUSTOMREQUEST, 'DELETE');
            //file transfer time delete
        } else if (strtolower($method) == 'put') {
            curl_setopt($s, CURLOPT_CUSTOMREQUEST, 'PUT');
            curl_setopt($s, CURLOPT_POSTFIELDS, $postdata);
            //file transfer to post ,put method and set data
        }

        curl_setopt($s, CURLOPT_HEADER, 0);
        // curl send header
        curl_setopt($s, CURLOPT_USERAGENT, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1');
        //proxy as Mozilla browser
        curl_setopt($s, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($s, CURLOPT_SSL_VERIFYPEER, false);
        // don't need to SSL verify ,if present it need openSSL PHP extension



        $response = curl_exec($s);

        $body = null;
        // error
        if (!$response) {
            $body = curl_error($s);
            $result["status"] = false;
            $result["statusCode"] = 500;
            $result["error"] = "CURL Error: = " . $body;
            $result["message"] = "CURL Error: = " . $body;
            $result["data"] = "CURL Error: = " . $body;
        } else {
            //parsing http status code
            $http_status = curl_getinfo($s, CURLINFO_HTTP_CODE);


            $result["statusCode"] = $http_status;
            $result["status"] = true;

            if (!is_null($header)) {
                // $header_size = curl_getinfo($s, CURLINFO_HEADER_SIZE);

                // $header = substr($response, 0, $header_size);
                // $body = substr($response, $header_size);
                $body = $response;
                //comprobamos si es un json la respuesta para decodearla
                if($this->isJson($body)){
                    $result["data"] = json_decode($body);
                }else{
                    $result["data"] = $body;
                }

            } else {
                $body = $response;
                //comprobamos si es un json la respuesta para decodearla
                if($this->isJson($body)){
                    $result["data"] = json_decode($body);
                }else{
                    $result["data"] = $body;
                }
            }
        }

        curl_close($s);

        return json_encode($result);
    }

    function sendRequest($cuenta,$ip){
        $data=array();
        $data["error"]=true;
        $data["message"]="No se encontr url";
        $data["country_code"]="";
        $data["country_name"]="";
        // 104=>limite  exedido,106=> ip invalida, 101 => api key es  invalida
        $data["code"]=0;

        switch ($cuenta->url){
            case "http://api.ipstack.com":
                $_request = file_get_contents("http://api.ipstack.com/{$ip}?access_key={$cuenta->key}");
                $_res_data = json_decode($_request);
                if ($_res_data->country_code) {
                    $data["error"]=false;
                    $data["code"]=0;
                    $data["country_code"]=$_res_data->country_code;
                    $data["country_name"]=$_res_data->country_name;
                    $data["message"]="request desde {$cuenta->url}";
                }else{


                    if ($_res_data->error->code === 104) {
                        $data["error"]=true;
                        $data["code"]=104;
                        $data["message"]="Error limite exedido para la key:[{$cuenta->key}], provider: {$cuenta->provider}";
                    } // ip invalida
                    elseif ($_res_data->error->code === 106) {
                        $data["error"]=true;
                        $data["code"]=106;
                        $data["message"]="Ip invalida:[{$ip}], api.ipstack.com";

                    } // error de la ip key: cuando la  api key es  inavlida
                    elseif ($_res_data->error->code === 101) {
                        $data["error"]=true;
                        $data["code"]=106;
                        $data["message"]="No ha proporcionado una clave de acceso API, provider: {$cuenta->provider}";
                    } else {
                        $data["error"]=true;
                        $data["code"]=$_res_data->error->code;
                        $data["message"]="Otros errores, api.ipstack.com";
                    }

                }

                return $data;
            case "https://ipapi.co":
                $url = "https://ipapi.co/{$ip}/json";

                $headers = array();
                $headers[] = 'User-Agent: PostmanRuntime/7.28.4';
                $headers[] = 'Accept: */*';
                $headers[] = 'Content-Type:application/json';
                $headers[] = 'Cache-Control: no-cache';

                $_request = $this->curl($url, 'get', $headers, null, 70);
                $_res_json =json_decode($_request);
                if($_res_json->statusCode ===200){
                    $resData=$_res_json->data;
                    if ($resData->country_code) {
                        $data["error"]=false;
                        $data["code"]=0;
                        $data["country_code"]=$resData->country_code;
                        $data["country_name"]=$resData->country_name;
                        $data["message"]="ipapi.co";
                    }else{
                        $msg="";
                        if($resData->reason){
                            $msg=$resData->reason;
                        }else{
                            $msg=$resData;
                        };

                        $data["error"]=true;
                        $data["code"]=0;
                        $data["message"]="{$msg}, para la key:[{$cuenta->key}], ipapi.co";
                    }

                } elseif ($_res_json->statusCode ===403) { //si se exedio de la  cuota
                    $data["error"]=true;
                    $data["code"]=104;
                    $data["message"]="Quota exceeded 403, para la key:[{$cuenta->key}], provider: {$cuenta->provider}";
                }else{
                    $data["error"]=true;
                    $data["code"]=0;
                    $data["message"]="Error: {$_res_json->data} , provider: {$cuenta->provider}";
                }


                return $data;

            case "https://api.ipdata.co":
                $url = "https://api.ipdata.co/{$ip}?api-key={$cuenta->key}";

                $headers = array();
                $headers[] = 'User-Agent: PostmanRuntime/7.28.4';
                $headers[] = 'Accept: */*';
                $headers[] = 'Content-Type:application/json';
                $headers[] = 'Cache-Control: no-cache';

                $_request = $this->curl($url, 'get', $headers, null, 70);
                $_res_json =json_decode($_request);
                if($_res_json->statusCode ===200){
                    $resData=$_res_json->data;
                    if ($resData->country_code) {
                        $data["error"]=false;
                        $data["code"]=0;
                        $data["country_code"]=$resData->country_code;
                        $data["country_name"]=$resData->country_name;
                        $data["message"]="ok, provider: {$cuenta->provider}";
                    }else{
                        $msg="";
                        if($resData->reason){
                            $msg=$resData->reason;
                        }else{
                            $msg=$resData;
                        };

                        $data["error"]=true;
                        $data["code"]=0;
                        $data["message"]="{$msg}, para la key:[{$cuenta->key}], provider: {$cuenta->provider}";
                    }

                } elseif ($_res_json->statusCode ===422) { //si se exedio de la  cuota
                    $data["error"]=true;
                    $data["code"]=104;
                    $data["message"]="Quota exceeded, para la key:[{$cuenta->key}], provider: {$cuenta->provider}";
                }else{
                    $data["error"]=true;
                    $data["code"]=0;
                    $data["message"]="Error: {$_res_json->data} , provider: {$cuenta->provider}";
                }


                return $data;
        }
        return $data;
    }



    private function getKeyApi(){
        $CUR_DIR = dirname(__FILE__);
        $path_file = $CUR_DIR . "/data_geo_keys.json";
        $path_file=str_replace("\\", "/", $path_file);
        $obj = new JsonDb($path_file);
        $keys=array();


        $rows = $obj->getTableFilter('access_keys', 'active', true);//obtenemos la  tabla
        $current_date=date("Y-m-d");
        foreach ($rows as $row) {
            //sololos que que estan activos
            $current_time=strtotime($current_date);
            $active_date_desde=strtotime($row['active_date_desde']);

            if($current_time>$active_date_desde){
                array_push($keys,$row);
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
            "debug" => [], //para  mostrarlo por console
            "country_code" => "",
            "country_name" => ""
        );
        try {
            $_cuenta = $this->getKeyApi();
            $_cuenta = (object) $_cuenta;
            ///-------validar ips lista  blanca si asi solo debolvemos
            if (in_array($ip, $ips_allows)) {
                $_resOutput->success = true;
                $_resOutput->messages[] = "La ip: [${ip}] se encuentra en la lista blanca";
                $_resOutput->debug[] = "La ip: [${ip}] se encuentra en la lista blanca.";
                return $_resOutput;
            }


            // --- aqui comenzara la  validacion
            $_res_data=$this->sendRequest($_cuenta,$ip);

//            $_request = file_get_contents("http://api.ipstack.com/{$ip}?access_key={$_key}");
//            $_res_data = json_decode($_request);

            // si devolbio un error
            if ($_res_data['error']===true) {

//                $_resOutput->error_code = $_res_data->error->code;
//                $_resOutput->messages[] = "Error limite exedido para la key:[{$_cuenta->key}]";



                // error: usage_limit_reached : exedio la cuota la key de la cuenta
                if ($_res_data['code']===104) {
                    $_resOutput->error_code =$_res_data['code'];
                    $_resOutput->messages[] = $_res_data['message'];
                    $_resOutput->debug[] = "{$_res_data['message']} - Supero el limite de request. 104";
                    //-----aqui desbilitaremos la key
                    $CUR_DIR = dirname(__FILE__);
                    $path_file = $CUR_DIR . "/data_geo_keys.json";
                    $obj = new JsonDb($path_file);
                    $date_new_active= date('Y-m-d', strtotime(date("Y-m-d"). ' + 30 days'));
                    $obj->rowUpdate('access_keys', 'active_date_desde',$date_new_active, 'key', $_cuenta->key);


                } else {
                    $_resOutput->error_code =$_res_data['code'];
                    $_resOutput->messages[] = $_res_data['message'];
                    $_resOutput->debug[] = "{$_res_data['message']} - Sucedio Otro errro :{$_res_data['code']}";
                }


            } else {
                $_resOutput->success = true;
                $_resOutput->country_code =$_res_data['country_code'];
                $_resOutput->country_name =$_res_data['country_name'];
                $_resOutput->messages[] = $_res_data['message'];
                $_resOutput->debug[] = "{$_res_data['message']}";
            }

            //var_dump($country_allows);exit;
            if (in_array($_resOutput->country_code, $country_allows)) {
                $_resOutput->success = true;
                return $_resOutput;
            }else{
                $__country_allows=@implode(',', $country_allows);
                $_resOutput->success = false;
                $_resOutput->messages[] = "El el pais [{$_resOutput->country_name}] no esta permitido, {$_res_data['message']}";
                $_resOutput->debug[] = "El el pais [{$_resOutput->country_name}] | 
                 cod pais actual:{$_resOutput->country_code},
                 codigos paises permitidos :{$__country_allows}
                 no esta permitido, {$_res_data['message']}";
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
