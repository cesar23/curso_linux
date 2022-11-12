<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_puertos extends CI_Model{ // Begin class model_mantcateg
     



   public function listar()
   {
                $session_data = $this->session->userdata('logged_in');
            $id = $session_data['id'];
            $ni = $session_data['nivel'];
            $ie = $session_data['ie'];

    $sql="SELECT nombre,ddlat,ddlong from marine.ts_puertos order by nombre asc;"; 
//echo $sql;
   $query = $this->db->query($sql);

    if($query->num_rows()!=0){
  
        foreach($query->result() as $fila){
//echo "holas";
           $data[] = $fila;
        }
        
        return $data;
        //return 1;
    }
    else{
     return False;
    }



   }









}