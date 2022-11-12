<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_datosmarinos extends CI_Model{ // Begin class model_mantcateg
	   
public function ultimatx($id)
   {

 $sql= "SELECT 
  tm_naves.codigonave, 
  tm_naves.nombrenave, 
  tm_lastmsg.dnid, 
  tm_lastmsg.member, 
  tm_lastmsg.ddlat, 
  tm_lastmsg.ddlong, 
  tm_lastmsg.speed, 
  tm_lastmsg.course, 
  tm_lastmsg.onboarddate, 
  tm_lastmsg.storetime
FROM 
  public.tm_lastmsg, 
  public.tm_naves
WHERE 
  tm_lastmsg.codigonave = tm_naves.codigonave;  ";

$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {
$data[]=$row;
}
} 

print_r($data);
return $data;


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