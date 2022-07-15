<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_auxiliares extends CI_Model{ // Begin class model_mantcateg

   

public function ultimatx($idu)
   {
    $hoyf=date("Y-m-d",mktime());
//$hoy="2013-09-04";
$hoy=mktime();


$sql="SELECT 
  tm_naves.matricula, 
  tm_naves.nombrenave, 
  tm_naves.estadonave, 
  tm_naves.tipoembarcacion, 
  tm_lastmsg.dnid, 
  tm_lastmsg.member, 
  tm_lastmsg.receiveddate, 
  tm_lastmsg.onboarddate as Fecha, 
  (tm_lastmsg.speed) as speed, 
  tm_lastmsg.course, 
  tm_lastmsg.ddlat, 
  tm_lastmsg.ddlong, 
 tm_lastmsg.latgrad, 
 tm_lastmsg.latmin, 
 tm_lastmsg.latsec,  
 tm_lastmsg.longgrad, 
 tm_lastmsg.longmin, 
 tm_lastmsg.longsec, 
tm_lastmsg.deltatime,
  tm_lastmsg.fivemil, 
  tm_lastmsg.zonacode, 
  tm_lastmsg.codigonave, 
  tm_lastmsg.msgrefnumber,
    tm_zonadesc.nombrecorto as nombrezona,
    (tm_zonadesc.hourstolerance +  tm_zonadesc.hoursinterval) as intervalplustolerance,
    tm_lastmsg.latstr,
    tm_lastmsg.lonstr,
    tm_lastmsg.voltaje,
      tm_lastmsg.memcode,
      tm_tipotx_idp.detalle as mcd
FROM 
  marine.tm_naves, 
  marine.tm_lastmsg, 
  marine.tm_zonadesc,
  marine.tm_tipotx_idp,
  marine.tm_asignacion

WHERE 
tm_naves.estadonave not in(6,7,8) AND
tm_lastmsg.memcode = tm_tipotx_idp.sisesatcomm AND
  tm_naves.codigonave = tm_lastmsg.codigonave AND 
  tm_zonadesc.zonacode= tm_lastmsg.zonacode  AND tm_asignacion.codigonave = tm_naves.codigonave AND codigousuario=$idu  order by tm_lastmsg.onboarddate desc  ";

$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {

$dt=$row->deltatime;
$ipt=$row->intervalplustolerance;
$horasd=(int)$dt;
$minutosd=(int)(($dt-$horasd)*60);
$segundosd=(int)(((($dt-$horasd)*60)-$minutosd)*60);
if($dt > $ipt){
 $row->atrasox="si";
  } else {
     $row->atrasox="no";
  }
/*$deltatime[]="$horasd"."h "."$minutosd"."m"." $segundosd"."s";  */



$fm=$row->fivemil;


$fecha_gps=$row->fecha;
$phpdate = strtotime( date($fecha_gps) );
$dif=(int)(($hoy-$phpdate)/60);


$row->deltatime=$dif;
//$row->hs=$hoyf;


if ($dif>= $ipt ) { $atra=1; } else { $atra=0; }

$row->atraso=$atra;

if($fm==1){ $five="5 mil";} else {$five="ZdP";};

$row->fm=$five;
$data[]=$row;
}
}

$js='{"ultimatx":'.json_encode($data).'}';

return $js;




   }

    

    function listar_empresa($iu,$ni)
  {
    if($ni<=1) 
      {
        $filtrou='';
      } else {
        $filtrou=" and id_usuario=$iu";
      }


      $sql="SELECT 
  tm_armador.armador, 
  tm_armador.razonsocial, 
  tm_armador.ruc, 
  tm_armador.direccion, 
  tm_armador.representante, 
  tm_armador.telefono, 
  tm_armador.estado, 
  tm_armador.codigoarmador, 
  tm_usuarios.codigousuario
FROM 
  marine.tm_asignacion, 
  marine.tm_usuarios, 
  marine.tm_naves, 
  marine.tm_armador, 
  marine.tm_nave_armador
WHERE 
  tm_asignacion.codigonave = tm_naves.codigonave AND
  tm_usuarios.codigousuario = tm_asignacion.codigousuario AND
  tm_naves.codigonave = tm_nave_armador.codigonave AND
  tm_nave_armador.codigoarmador = tm_armador.codigoarmador and tm_usuarios.codigousuario=$iu
  group by   tm_armador.armador, 
  tm_armador.razonsocial, 
  tm_armador.ruc, 
  tm_armador.direccion, 
  tm_armador.representante, 
  tm_armador.telefono, 
  tm_armador.estado, 
  tm_armador.codigoarmador, 
  tm_usuarios.codigousuario;
 ";
      $query = $this->db->query($sql);


    if($query -> num_rows() > 0)
    {
         foreach ($query->result() as $row)
        {
        $data[] = $row;
        }
      return json_encode($data);
    }
    else
    {
      return false;
    }


  }
###### Listar tipos de Puertos #####

  
}