<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_menu extends CI_Model{ // Begin class model_mantcateg
	   
public function listar_menuhijo($id)
   {
   $this->db->select('a.id_menu, a.nombremenu, a.ruta, a.id_padre');
    $this->db->from('datos.tp_menu a'); 
        $this->db->where('a.id_padre ='.$id);
  
        $this->db->order_by('a.id_menu');   
        $query = $this->db->get();
    if($query->num_rows()!=0){
  
        foreach($query->result() as $fila){

           $data[] = $fila;
        }
        
        return $data;
    }
    else{
     return False;
    }

   }

   function listar_menu($id)
   {
   $this->db->select('a.id_menu as id_menu, a.nombremenu, a.ruta, a.id_padre,a.tiposubmenu');
    $this->db->from('datos.tp_menu a'); 
        $this->db->where('a.id_padre ='.$id);

        $this->db->order_by('a.id_menu');   
        $query = $this->db->get();
    if($query->num_rows()!=0){
  
        foreach($query->result() as $fila){
        	//echo $fila;

//echo $a->tipo_foto;  
//$fila2=2;
 //$fila2->listar_menuhijo($fila->id_menu);
           $data[] = $fila;
        /*  echo $fila->id_menu;  
 $this-> listar_menu($fila->id_menu);
           //$data[] = 
        echo '<pre>';
   print_r($data);
echo '</pre>'; */

       
        }
   
        return $data;
    }
    else{
     return False;
    }

   }

}