<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_alertasjson extends CI_Model{ // Begin class model_mantcateg

   public function alertaporconsumox()
   {

echo "pachaaaa";

   }

public function alertaporconsumo()
   {
    $hoyf=date("Y-m-d",time());
//$hoy="2013-09-04";
$hoy=time();


$sql="SELECT nombremobil as nombrenave, nrotx as nro  FROM datos.vis_traficoidp limit 20;";

$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {

$data[]=$row;
}
}

$js='{"ultimatx":'.json_encode($data).'}';

return $js;




   }



}