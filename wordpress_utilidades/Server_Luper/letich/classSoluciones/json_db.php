<?php

class JsonDb
{

    // variables


    // -OJO importantes
    // esta es la  estructura  requerida para a単adir data al json
    private $json_estructure = [
        "access_keys" => array(
            "cuenta",
            "url",
            "key",
            "active",
            "active_date_desde",
        )
    ];
    //- aqui definmos la columna unique key de las colecciones
    private $key_uniq = [
        "access_keys" => "key",//paa la  coleccion seriales
//        "paises"=> "name"
    ];
    private $path_json_db;

    // constructor de la clase
    function __construct($path_json_db)
    {
        // el archivo se creara en
//        $CUR_DIR = dirname(__FILE__);

        //---------creara  el archivo si no existe
        $this->createArchive($path_json_db);
        $this->path_json_db = $path_json_db;

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
    public function getTable($table)
    {
        $_tableResult = [];
        try {

            $items = file_get_contents($this->path_json_db);
            $items = json_decode($items, true);

            foreach ($items as $k => $v) {
                if ($k === $table) {
                    $_tableResult = $v;
                }
            }
        } catch (Exception $err) {
            throw $err;

        }

        return $_tableResult;

    }

    public function getTableFilter($table, $campo, $value)
    {
        $_tableResult = [];
        try {
            $rows = $this->getTable($table);
            foreach ($rows as $row) {
                if ($row["{$campo}"] === $value) {
                    array_push($_tableResult, $row);
                }

            }
            return $_tableResult;
        } catch (Exception $err) {
            throw $err;

        }


    }

    public function getRow($rows)
    {
        $_row = null;
        try {
            $_row = $rows[0];

        } catch (Exception $err) {
            throw $err;

        }

        return $_row;

    }

    /*
     * description:para  validar si un keys existe en un array
     * example:
      $data = array('first' => 1, 'second' => 4,'peru'=>555555);
            $keys_search=array(
            "first"
            );

    if(validKeyArray($keys_search,$data)){
        echo "ok";
     }else{
            echo "No ok";
     }

     * */
    private function validKeyArray($keys_search, $data_array)
    {
        foreach ($keys_search as $v) {
            if (!array_key_exists($v, $data_array)) {
                return false;
            }
        }
        return true;
    }


    public function addRow($table, $row)
    {

//    $ip_base=base64_encode($ip);
        try {
            //----1 validamo sque  contenga estructura
            if (!$this->validKeyArray($this->json_estructure["{$table}"], $row)) {
                throw new Exception('el valor del array no contiene la estructura');
            }


            //-=---2 obtenemos datos de la tabla
            $_table = $this->getTable($table);

            //---- 3 obteenmos todo el json
            $_items = file_get_contents($this->path_json_db);
            $_DB = json_decode($_items, true);
            //---- 4 si la tabla esta en el json
            if (array_key_exists($table, $_DB)) {
                //-aqui agregamos a la tabla el row

                $found = count($this->getTableFilter($table, $this->key_uniq["{$table}"], $row["{$this->key_uniq["{$table}"]}"]));
                if ($found >= 1) {
                    throw new Exception("La columna [{$this->key_uniq["{$table}"]}] con el valor:[{$row["{$this->key_uniq["{$table}"]}"]}]  es duplicado ");
                } else {
                    array_push($_table, $row);
                    //actualizamos la  deb para  guardarlo depues
                    $_DB["{$table}"] = $_table;
                }

            } else {
                throw new Exception('No se encontro la  tabla.');
            }

            $_DB = json_encode($_DB);
            file_put_contents($this->path_json_db, $_DB);

            return true;
        } catch (Exception $err) {
            throw $err;
        }


    }

    public function rowDelete($table, $where_campo, $where_value)
    {

//    $ip_base=base64_encode($ip);
        try {


            //-=---2 obtenemos datos de la tabla
            $_table = $this->getTable($table);

            //---- 3 obteenmos todo el json
            $_items = file_get_contents($this->path_json_db);
            $_DB = json_decode($_items, true);
            //---- 4 si la tabla esta en el json
            if (array_key_exists($table, $_DB)) {

                if (count($_table) > 0) {
                    $_newTable = [];
                    foreach ($_table as $row) {
                        if ($row["{$where_campo}"] !== $where_value) {
                            array_push($_newTable, $row);
                        }

                    }
                    //actualizamos la  deb para  guardarlo depues
                    $_DB["{$table}"] = $_newTable;
                }


            } else {
                throw new Exception('No se encontro la  tabla.');
            }

            $_DB = json_encode($_DB);
            file_put_contents($this->path_json_db, $_DB);

            return true;
        } catch (Exception $err) {
            throw $err;
        }


    }


    public function rowUpdate($table, $update_campo, $update_value, $where_campo, $where_value)
    {
//    $ip_base=base64_encode($ip);
        try {


            //-=---2 obtenemos datos de la tabla
            $_table = $this->getTable($table);

            //---- 3 obteenmos todo el json
            $_items = file_get_contents($this->path_json_db);
            $_DB = json_decode($_items, true);
            //---- 4 si la tabla esta en el json
            if (array_key_exists($table, $_DB)) {

                if (count($_table) > 0) {
                    $_newTableUpdate = [];
                    $_newTable = [];
                    foreach ($_table as $row) {
                        //cuando encuentra la columna y el valor
                        if ($row["{$where_campo}"] === $where_value) {
                            $row["{$update_campo}"] = $update_value;
                            array_push($_newTableUpdate, $row);

                        } else {
                            array_push($_newTable, $row);
                        }

                    }
                    //actualizamos la  deb para  guardarlo depues
                    $_DB["{$table}"] = array_merge($_newTableUpdate, $_newTable);
                }


            } else {
                throw new Exception('No se encontro la  tabla.');
            }

            $_DB = json_encode($_DB);
            file_put_contents($this->path_json_db, $_DB);

            return true;
        } catch (Exception $err) {
            throw $err;
        }


    }


    private function currentTime()
    {
        return date("Y-m-d H:i:s");
    }


    // destructor de la clase
    function __destruct()
    {

    }

}

