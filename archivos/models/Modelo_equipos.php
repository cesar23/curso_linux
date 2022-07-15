<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_equipos extends CI_Model{ // Begin class model_mantcateg

  /*          $id_eqx=$fila->id_equipo;

$sqlx=" SELECT tm_mobil.id_mobil, tm_mobil.nombremobil, tm_mobil.placa, tm_mobil_equipo.id_equipo, tm_mobil_equipo.id_mobil,   tm_mobil.id_empresa
FROM   datos.tm_mobil,   datos.tm_mobil_equipo WHERE   tm_mobil.id_mobil = tm_mobil_equipo.id_mobil and tm_mobil_equipo.id_equipo=$id_eqx ;"

echo $sqlx;
    $queryx = $this->db->query($sqlx);
 if ($queryx->num_rows() > 0){
        
        foreach($queryx->result() as $filax){

        }
      }

*/


public function listar() {

$sql ="SELECT 
  tm_equipo.id_equipo, 
  tm_equipo.tipo_equipo, 
  tm_equipo.id_com, 
  tm_equipo.fecha_equipo, 
  tm_equipo.estado_equipo,
  ts_estadoequipo.detalle,
  id_componente.imei, 
  id_componente.inmarsatmobilnumber, 
  id_componente.adc, 
  id_componente.telefono, 
  id_componente.tipoc, 
  id_componente.nextel, 
  id_componente.tiposim, 
  id_componente.fechasistema, 
  ts_tipoequipo.descripcion
FROM 
  datos.tm_equipo, 
  datos.id_componente, 
  datos.tm_equipo_componente, 
  datos.ts_tipoequipo,
  datos.ts_estadoequipo
WHERE 
  tm_equipo.estado_equipo=ts_estadoequipo.estado_equipo AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  id_componente.id_com = tm_equipo_componente.id_com AND
  id_componente.tipoc = ts_tipoequipo.tipoequipo;";

    $query = $this->db->query($sql);
    if ($query->num_rows() > 0){
        foreach($query->result() as $fila){
         $data[] = $fila;
       }
       return json_encode($data);
     }
     else{
       return False;
     }
}

public function listarasignados() {

$sql ="SELECT 
  tm_equipo.id_equipo, 
  tm_equipo.tipo_equipo, 
  tm_equipo.id_com, 
  tm_equipo.fecha_equipo, 
  tm_equipo.estado_equipo,
  ts_estadoequipo.detalle,
  id_componente.imei, 
  id_componente.inmarsatmobilnumber, 
  id_componente.adc, 
  id_componente.telefono, 
  id_componente.tipoc, 
  id_componente.nextel, 
  id_componente.tiposim, 
  id_componente.fechasistema, 
  ts_tipoequipo.descripcion
FROM 
  datos.tm_equipo, 
  datos.id_componente, 
  datos.tm_equipo_componente, 
  datos.ts_tipoequipo,
  datos.ts_estadoequipo
WHERE 
  tm_equipo.estado_equipo=ts_estadoequipo.estado_equipo AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  id_componente.id_com = tm_equipo_componente.id_com AND
  id_componente.tipoc = ts_tipoequipo.tipoequipo;";

    $query = $this->db->query($sql);
    if ($query->num_rows() > 0){
        foreach($query->result() as $fila){
/***/
$id_eqx=$fila->id_equipo;

$sqlx=" SELECT tm_mobil.id_mobil, tm_mobil.nombremobil, tm_mobil.placa, tm_mobil_equipo.id_equipo, tm_mobil_equipo.id_mobil,   tm_mobil.id_empresa
FROM   datos.tm_mobil,   datos.tm_mobil_equipo WHERE   tm_mobil.id_mobil = tm_mobil_equipo.id_mobil and tm_mobil_equipo.id_equipo=$id_eqx ;";

//echo $sqlx;
    $queryx = $this->db->query($sqlx);
 if ($queryx->num_rows() > 0){
        
        foreach($queryx->result() as $filax){
          $fila->id_mobil=$filax->id_mobil;
  $fila->unidadmobil=$filax->nombremobil;
    $fila->placamobil=$filax->placa;
        }
      } else {
          $fila->id_mobil=null;
          $fila->unidadmobil=null;
          $fila->placamobil=null;
      }



/***/


         $data[] = $fila;
       }
       return json_encode($data);
     }
     else{
       return False;
     }
}

  public function nuevo($idu)
   {
        if($this->input->post('apellidoc')){
$adcx=$this->input->post('apellidoc');
    } else 
    {
      $adcx="null";
    }

    $sql="INSERT INTO datos.id_componente(
            imei,adc,telefono,tipoc,observaciones,id_usuario,tiposim)
    VALUES ('".$this->input->post('nombrec')."',".$adcx.",'".$this->input->post('telefonoc')."','".$this->input->post('listaempresas')."','".$this->input->post('comment')."','".$idu."','".$this->input->post('listasims')."');
";


    $query = $this->db->query($sql);
    if($query)
      {
        return true;
      }
      else
      {
        return false;
      }
   }

  public function edita()
   {
    if($this->input->post('apellidoc')){
$adcx=$this->input->post('apellidoc');
    } else 
    {
      $adcx="null";
    }
    $sql="update datos.id_componente set  imei='".$this->input->post('nombrec')."', adc=".$adcx.", telefono='".$this->input->post('telefonoc')."',tipoc='".$this->input->post('listaempresas')."',observaciones='".$this->input->post('comment')."',tiposim='".$this->input->post('listasims')."' where id_com='".$this->input->post('idcontacto')."'  ";
  

echo $sql;


    $query = $this->db->query($sql);
    if($query)
      {
        return true;
      }
      else
      {
        return false;
      }
   }
  public function detalle($ic)
  {

    if ($ic) {

      $filtro = " and tm_equipo.id_equipo=$ic ";
    } else {
      $filtro = " ";
    }

    $hoy=date("Y-m-d");

    $sql=" SELECT 
  tm_equipo.id_equipo, 
  tm_equipo.tipo_equipo, 
  tm_equipo.id_com, 
  tm_equipo.fecha_equipo, 
  tm_equipo.estado_equipo,
  ts_estadoequipo.detalle,
  id_componente.imei, 
  id_componente.inmarsatmobilnumber, 
  id_componente.adc, 
  id_componente.telefono, 
  id_componente.tipoc, 
  id_componente.nextel, 
  id_componente.tiposim, 
  id_componente.fechasistema, 
  ts_tipoequipo.descripcion,
  id_componente.observaciones
FROM 
  datos.tm_equipo, 
  datos.id_componente, 
  datos.tm_equipo_componente, 
  datos.ts_tipoequipo,
  datos.ts_estadoequipo
WHERE 
  tm_equipo.estado_equipo=ts_estadoequipo.estado_equipo AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  id_componente.id_com = tm_equipo_componente.id_com AND
  id_componente.tipoc = ts_tipoequipo.tipoequipo $filtro;
    ";


    $query = $this->db->query($sql);



    if ($query->num_rows() > 0)



      if($query->num_rows()!=0){
        
        foreach($query->result() as $fila){

         $data[] = $fila;
       }
       
       return json_encode($data);
     }
     else{
       return False;
     }

   }

public function equipos_sinasignar() {
  $sql="select b.id_equipo as id_equipo,b.fecha_equipo as fechains,c.imei as imei,e.descripcion as teq
from datos.tm_equipo b, datos.id_componente c,datos.tm_equipo_componente d, datos.ts_tipoequipo e
where c.tipoc=e.tipoequipo and b.id_equipo  not in(SELECT id_equipo FROM datos.tm_mobil_equipo) and 
 d.id_com=c.id_com and d.id_equipo=b.id_equipo order by b.id_equipo desc";

     $query = $this->db->query($sql);
    if ($query->num_rows() > 0){
        foreach($query->result() as $fila){
         $data[] = $fila;
       }
       return json_encode($data);
     }
     else{
       return False;
     }

 }

 public function equipos_asignados() {
  $sql="select b.id_equipo as id_equipo,b.fecha_equipo as fechains,c.imei as imei,e.descripcion as teq
from datos.tm_equipo b, datos.id_componente c,datos.tm_equipo_componente d, datos.ts_tipoequipo e
where c.tipoc=e.tipoequipo and b.id_equipo  in(SELECT id_equipo FROM datos.tm_mobil_equipo) and 
 d.id_com=c.id_com and d.id_equipo=b.id_equipo order by b.id_equipo desc";

     $query = $this->db->query($sql);
    if ($query->num_rows() > 0){
        foreach($query->result() as $fila){
         $data[] = $fila;
       }
       return json_encode($data);
     }
     else{
       return False;
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