<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_equipos extends CI_Model{ // Begin class model_mantcateg

public function listar() {

$sql ="SELECT armador, codigonave, nombrenave, estadonave, matricula, id_equipo, 
       inmarsatmn, terminalid, estado_equipo, fecha_sistema, obs, fecha_programacion, 
       fecha_instalacion, tipo
  FROM marine.equipos_naves; ";
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{

  $di = array();


   foreach ($query->result() as $row)
   {
    $data[] = $row;
   }
   return $data;
 }
}


public function listar_eq_sa() {

$sql ="SELECT tm_equipo.id_equipo, tm_equipo.terminalid, tm_equipo.estado_equipo 
  FROM marine.tm_equipo  where  tm_equipo.estado_equipo in (0) and tm_equipo.id_equipo not in (SELECT id_equipo
  FROM marine.tm_nave_equipo) order by id_equipo desc  ";
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{

  $di = array();


   foreach ($query->result() as $row)
   {
    $data[] = $row;
   }
   return $data;
 }
}

public function listar_ep_sa() {

$sql ="SELECT tm_naves.codigonave, tm_naves.matricula, tm_naves.nombrenave, tm_naves.estadonave
  FROM marine.tm_naves  where   tm_naves.estadonave in (0) and tm_naves.codigonave not in (SELECT codigonave
  FROM marine.tm_nave_equipo) ";
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{

  $di = array();


   foreach ($query->result() as $row)
   {
    $data[] = $row;
   }
   return $data;
 }
}


      


public function desasigna() 
   {
$ide=$this->input->post('codigo_eqx');
$epx=$this->input->post('codigo_epx');

  $sql="DELETE FROM marine.tm_nave_equipo WHERE codigonave='".$epx."' and  id_equipo='".$ide."'";
    $this->db->query($sql);

  $sql1="UPDATE marine.tm_naves set estadonave=0 WHERE codigonave='".$epx."'";
    $this->db->query($sql1);

   $sql2="UPDATE marine.tm_equipo set estado_equipo=0 WHERE id_equipo='".$ide."'";
    $this->db->query($sql2);

return true;
  

   }
  public function asigna() 
   {
$ide=$this->input->post('codigo_eqn');
$epx=$this->input->post('codigo_epn');
$otx=$this->input->post('otx');
$sql="INSERT INTO marine.tm_nave_equipo(
            codigonave,  id_equipo,  
            codigoot)
    VALUES ($epx, $ide, $otx)";
    $this->db->query($sql);

      $sql1="UPDATE marine.tm_naves set estadonave=1 WHERE codigonave='".$epx."'";
    $this->db->query($sql1);

   $sql2="UPDATE marine.tm_equipo set estado_equipo=1 WHERE id_equipo='".$ide."'";
    $this->db->query($sql2);

/*
  $sql="DELETE FROM marine.tm_nave_equipo WHERE codigonave='".$epx."' and  id_equipo='".$ide."'";
    $this->db->query($sql);

  $sql1="UPDATE marine.tm_naves set estadonave=0 WHERE codigonave='".$epx."'";
    $this->db->query($sql1);

   $sql2="UPDATE marine.tm_equipo set estado_equipo=0 WHERE id_equipo='".$ide."'";
    $this->db->query($sql2);
*/

  

   }
  

public function recupera($ie,$cn) {

$sql ="SELECT 
  tm_naves.codigonave, 
  tm_naves.nombrenave, 
  tm_nave_equipo.codigonave, 
  tm_nave_equipo.id_equipo, 
  tm_equipo.terminalid
FROM 
  marine.tm_naves, 
  marine.tm_nave_equipo, 
  marine.tm_equipo
WHERE 
  tm_naves.codigonave = tm_nave_equipo.codigonave AND
  tm_equipo.id_equipo = tm_nave_equipo.id_equipo and tm_nave_equipo.id_equipo=$ie and tm_nave_equipo.codigonave=$cn ;
;
 ";
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{

  $di = array();


   foreach ($query->result() as $row)
   {
    $data[] = $row;
   }
   return $data;
 }
}


}