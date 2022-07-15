<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_reportes extends CI_Model{ // Begin class model_mantcateg

   //item.ddlong, item.ddlat,item.speed,item.course,item.nombrenave,item.codigonave,item.fecha

public function ultimatx($idu)
   {
    $hoyf=date("Y-m-d",time());
//$hoy="2013-09-04";
$hoy=time();
$sql="SELECT 
tm_mobil.id_mobil as codigonave, 
  tm_mobil.nombremobil as nombrenave, 
  tm_mobil.placa as placa, 
  tm_mobil.id_empresa as ide,
  tm_mobil.estado as estado ,
   tm_mobil.otros_servicios as os ,
    tm_mobil.computadora as computadora ,
      tm_mobil.tipounidad as tipounidad ,
        tm_mobil.vmax as vmax ,
        tm_mobil.promc as promconsumo,
        tm_mobil.suspencion as suspencion,
  tm_equipo.id_equipo as id_equipo , 
  id_componente.tipoc ,
    tm_lastmsg.lat_dd as ddlat, 
    tm_lastmsg.long_dd as ddlong,
        tm_lastmsg.lat_dms as latstr, 
    tm_lastmsg.long_dms as lonstr,
tm_lastmsg.gps_date - CAST('5 hour' AS INTERVAL) as Fecha,
  (tm_lastmsg.speed*1.852)::int as speed,
  tm_lastmsg.course,
 tm_lastmsg.ubica as ubica, 
 tm_lastmsg.provincia as provincia,
 tm_lastmsg.distrito as distrito,
 tm_lastmsg.departamento as departamento,
 tm_lastmsg.panico as panico,
  tm_lastmsg.punto_control as pc,
  ts_tipotx.tipotx as tipotx,
    ts_tipotx.detalle as memcode
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.tm_lastmsg, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente,
  datos.ts_tipotx
WHERE 
ts_tipotx.tipotx=tm_lastmsg.tipotx and
  tm_mobil.id_mobil = tm_lastmsg.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario = $idu AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_equipo_componente.id_com = id_componente.id_com  and estado=1   and tm_lastmsg.lat_dd is not null order by gps_date desc ; ";


// echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {
          
$fecha_gps=$row->fecha;
$phpdate = strtotime( date($fecha_gps) );
$dif=$hoy-$phpdate;
if (($dif>=86400) and ($dif<172800) ) { $atra=1; } else
if (($dif>=172800) and ($dif<259200) ) { $atra=2; } else 
if (($dif>=259200) ) { $atra=3; } else { $atra=0; }
          $row->atraso=$atra;

// $row->ddlat=-12.06231990382597;
// $row->ddlong=-77.02506065368652;
$data[]=$row;
}
} 

$js=json_encode($data);

return $js;


   }

   public function ultimatxunidad($idu,$im)
   {
    $hoyf=date("Y-m-d",time());
//$hoy="2013-09-04";
$hoy=time();
$sql="SELECT 
tm_mobil.id_mobil as codigonave, 
  tm_mobil.nombremobil as nombrenave, 
  tm_mobil.placa as placa, 
  tm_mobil.id_empresa as ide,
  tm_mobil.estado as estado ,
   tm_mobil.otros_servicios as os ,
    tm_mobil.computadora as computadora ,
        tm_mobil.vmax as vmax ,
        tm_mobil.promc as promconsumo,
        tm_mobil.suspencion as suspencion,
  tm_equipo.id_equipo as id_equipo , 
  id_componente.tipoc ,
    tm_lastmsg.lat_dd as ddlat, 
    tm_lastmsg.long_dd as ddlong,
        tm_lastmsg.lat_dms as latstr, 
    tm_lastmsg.long_dms as lonstr,
tm_lastmsg.gps_date - CAST('5 hour' AS INTERVAL) as Fecha,
  (tm_lastmsg.speed*1.852)::int as speed,
  tm_lastmsg.course,
 tm_lastmsg.ubica as ubica, 
 tm_lastmsg.provincia as provincia,
 tm_lastmsg.distrito as distrito,
 tm_lastmsg.departamento as departamento,
 tm_lastmsg.panico as panico,
  tm_lastmsg.punto_control as pc
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.tm_lastmsg, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente
WHERE 
  tm_mobil.id_mobil = tm_lastmsg.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario = $idu AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_equipo_componente.id_com = id_componente.id_com and tm_mobil.id_mobil=$im and estado=1   and tm_lastmsg.lat_dd is not null order by gps_date desc ; ";


// echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {
          
$fecha_gps=$row->fecha;
$phpdate = strtotime( date($fecha_gps) );
$dif=$hoy-$phpdate;
if (($dif>=86400) and ($dif<172800) ) { $atra=1; } else
if (($dif>=172800) and ($dif<259200) ) { $atra=2; } else 
if (($dif>=259200) ) { $atra=3; } else { $atra=0; }
          $row->atraso=$atra;

// $row->ddlat=-12.06231990382597;
// $row->ddlong=-77.02506065368652;
$data[]=$row;
}
} 

$js=json_encode($data);

return $js;


   }


public function detalletx($idu,$cn)
   {
    $hoyf=date("Y-m-d",time());
//$hoy="2013-09-04";
$hoy=time();

  $sql="SELECT 
  tm_naves.matricula, 
  tm_naves.nombrenave, 
  tm_naves.estadonave, 
  tm_naves.tipoembarcacion, 
  tm_mensajenaves.dnid, 
  tm_mensajenaves.member, 
  tm_mensajenaves.receiveddate, 
  tm_mensajenaves.onboarddate as Fecha, 
  (tm_mensajenaves.speed) as speed, 
  tm_mensajenaves.course, 
  tm_mensajenaves.ddlat, 
  tm_mensajenaves.ddlong, 
 tm_mensajenaves.latgrad, 
 tm_mensajenaves.latmin, 
 tm_mensajenaves.latsec,  
 tm_mensajenaves.longgrad, 
 tm_mensajenaves.longmin, 
 tm_mensajenaves.longsec, 

  tm_mensajenaves.fivemil, 
  tm_mensajenaves.zonacode, 
  tm_mensajenaves.codigonave, 
  tm_mensajenaves.msgrefnumber, 
  tm_asignacion.codigousuario,
    tm_zonadesc.nombrecorto as nombrezona,
    tm_mensajenaves.latstr,
    tm_mensajenaves.lonstr,
    tm_mensajenaves.voltaje,
      tm_mensajenaves.memcode,
      tm_tipotx_idp.detalle as mcd
FROM 
  marine.tm_naves, 
  marine.tm_mensajenaves, 
  marine.tm_asignacion,
  marine.tm_zonadesc,
  marine.tm_tipotx_idp

WHERE 
tm_naves.estadonave not in(6,7,8) AND
tm_mensajenaves.memcode = tm_tipotx_idp.sisesatcomm AND
  tm_naves.codigonave = tm_mensajenaves.codigonave AND
  tm_zonadesc.zonacode= tm_mensajenaves.zonacode AND 
  tm_asignacion.codigonave = tm_naves.codigonave AND tm_naves.codigonave=$cn and  codigousuario=$idu  order by Fecha desc limit 500;";
//echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {



/*$deltatime[]="$horasd"."h "."$minutosd"."m"." $segundosd"."s";  */



$fm=$row->fivemil;

if($fm==1){ $five="5 mil";} else {$five="ZdP";};
$fecha_gps=$row->fecha;
$phpdate = strtotime( date($fecha_gps) );
$dif=$hoy-$phpdate;
if (($dif>=1440) and ($dif<2880) ) { $atra=1; } else
if (($dif>=2880) and ($dif<4320) ) { $atra=2; } else 
if (($dif>=4320) ) { $atra=3; } else { $atra=0; }
          $row->atraso=$atra;
          $row->fm=$five;
$data[]=$row;
}
} 

$js='{"ultimatx":'.json_encode($data).'}';

return $js;


   } // FIn detalletex



public function tracking_nave($idx)
   {


// echo "holas ".$idx;
            $nrofilas=$this->input->post('nrobarcos');
 $nrotx=$this->input->post('nrotx');
 //$nrofilas=100;
 //$nrotx=10;
$m=0;
        for ($z=0;$z<$nrofilas;$z++) {

 if($this->input->post('cn'.$z)){
  $m++;
                $ditem=$this->input->post('cn'.$z);
$sql= "SELECT 
tm_mobil.id_mobil as codigonave, 
  tm_mobil.nombremobil as nombrenave, 
  tm_mobil.placa as placa, 
  tm_mobil.estado as estado ,
  tm_mobil.tipounidad as tipounidad ,
  tm_equipo.id_equipo as id_equipo , 
  id_componente.tipoc ,
  tm_data_hoy.msg_id as msg_id,
  tm_data_hoy.msgref as msgref,
    tm_data_hoy.lat_dd as ddlat, 
    tm_data_hoy.long_dd as ddlong,
            tm_data_hoy.lat_dms as latstr, 
    tm_data_hoy.long_dms as lonstr,
tm_data_hoy.gps_date - CAST('5 hour' AS INTERVAL) as Fecha,
  (tm_data_hoy.speed*1.852)::int as speed,
  tm_data_hoy.course,
 tm_data_hoy.ubica as ubica, 
 tm_data_hoy.provincia as provincia,
 tm_data_hoy.distrito as distrito,
 tm_data_hoy.departamento as departamento,
 tm_data_hoy.panico as panico,
 tm_data_hoy.fuel_level as  fuel_level,
 tm_data_hoy.punto_control as  pc,
   ts_tipotx.tipotx as tipotx,
    ts_tipotx.detalle as memcode
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.tm_data_hoy, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente,
  datos.ts_tipotx
WHERE 
ts_tipotx.tipotx=tm_data_hoy.tipotx and 
  tm_mobil.id_mobil = tm_data_hoy.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario =  $idx  AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_equipo_componente.id_com = id_componente.id_com  and tm_mobil.id_mobil=$ditem and estado=1 order by gps_date desc   limit $nrotx; ";
 // tm_asignacion.codigonave = tm_naves.codigonave AND tm_naves.codigonave =$ditem and codigousuario=$idx order by onboarddate desc ";

//echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {
//$fm=$row->fivemil;

//if($fm==1){ $five="5 mil";} else {$five="ZdP";};
//          $row->fm=$five;
$data[$m][]=$row;

}
} 




                } // End if
        } // End for




$js='{"ultimatx":'.json_encode($data).'}';

return $js;
   }






public function tracking_navef($idx)
   {


// echo "holas ".$idx;
            $nrofilas=$this->input->post('nrobarcos');
 $nrotx=$this->input->post('nrotx');
 //$nrotx=100;

 //$nrotx=10;
$fini=$nrofilas=$this->input->post('fix');
$ffin=$nrofilas=$this->input->post('ffx');
$hini=$nrofilas=$this->input->post('hix');
$hfin=$nrofilas=$this->input->post('hfx');

  $finix=$fini." ".$hini;
    $ffinx=$ffin." ".$hfin;



$m=0;
        for ($z=0;$z<$nrofilas;$z++) {

 if($this->input->post('cn'.$z)){
  $m++;
                $ditem=$this->input->post('cn'.$z);
$sql= "SELECT 
tm_mobil.id_mobil as codigonave, 
  tm_mobil.nombremobil as nombrenave, 
  tm_mobil.placa as placa, 
  tm_mobil.estado as estado ,
  tm_mobil.tipounidad as tipounidad ,
  tm_equipo.id_equipo as id_equipo , 
  id_componente.tipoc ,
  tm_data_hoy.msg_id as msg_id,
  tm_data_hoy.msgref as msgref,
    tm_data_hoy.lat_dd as ddlat, 
    tm_data_hoy.long_dd as ddlong,
            tm_data_hoy.lat_dms as latstr, 
    tm_data_hoy.long_dms as lonstr,
tm_data_hoy.gps_date - CAST('5 hour' AS INTERVAL) as Fecha,
  (tm_data_hoy.speed*1.852)::int as speed,
  tm_data_hoy.course,
 tm_data_hoy.ubica as ubica, 
 tm_data_hoy.provincia as provincia,
 tm_data_hoy.distrito as distrito,
 tm_data_hoy.departamento as departamento,
 tm_data_hoy.panico as panico,
 tm_data_hoy.fuel_level as  fuel_level,
 tm_data_hoy.punto_control as  pc,
   ts_tipotx.tipotx as tipotx,
    ts_tipotx.detalle as memcode
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.tm_data_hoy, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente,
  datos.ts_tipotx
WHERE 
tm_data_hoy.gps_date - CAST('5 hour' AS INTERVAL)>'$finix' AND tm_data_hoy.gps_date - CAST('5 hour' AS INTERVAL) < '$ffinx' AND
ts_tipotx.tipotx=tm_data_hoy.tipotx and 
  tm_mobil.id_mobil = tm_data_hoy.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario =  $idx  AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_equipo_componente.id_com = id_componente.id_com  and tm_mobil.id_mobil=$ditem and estado=1 order by gps_date desc   ";
 // tm_asignacion.codigonave = tm_naves.codigonave AND tm_naves.codigonave =$ditem and codigousuario=$idx order by onboarddate desc ";

//echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {
//$fm=$row->fivemil;

//if($fm==1){ $five="5 mil";} else {$five="ZdP";};
//          $row->fm=$five;
$data[$m][]=$row;

}
} 




                } // End if
        } // End for




$js='{"ultimatx":'.json_encode($data).'}';

return $js;
   }



public function ultimatxcanbus($idu)
   {
    $hoyf=date("Y-m-d",time());
//$hoy="2013-09-04";
$hoy=time();
$sql="SELECT 
tm_mobil.id_mobil as codigonave, 
  tm_mobil.nombremobil as nombrenave, 
  tm_mobil.placa as placa, 
  tm_mobil.id_empresa as ide,
  tm_mobil.estado as estado ,
   tm_mobil.tipounidad as tipounidad ,
   tm_mobil.otros_servicios as os ,
    tm_mobil.computadora as computadora ,
        tm_mobil.vmax as vmax ,
        tm_mobil.promc as promconsumo,
        tm_mobil.suspencion as suspencion,
  tm_equipo.id_equipo as id_equipo , 
  id_componente.tipoc ,
    tm_lastmsg_canbus.lat as ddlat, 
    tm_lastmsg_canbus.lng as ddlong,
        tm_lastmsg_canbus.latstr, 
    tm_lastmsg_canbus.lngstr as lonstr,
tm_lastmsg_canbus.evttime - CAST('5 hour' AS INTERVAL) as Fecha,
  (tm_lastmsg_canbus.speed*1.852)::int as speed,
  tm_lastmsg_canbus.heading,
    tm_lastmsg_canbus.rpm, 
    tm_lastmsg_canbus.odometer, 
  tm_lastmsg_canbus.carga_motor, 
  tm_lastmsg_canbus.nivel_comb, 
  tm_lastmsg_canbus.temp_motor, 
  tm_lastmsg_canbus.sensor1, 
  tm_lastmsg_canbus.sensor2, 
  tm_lastmsg_canbus.sensor3, 
  tm_lastmsg_canbus.sensor4, 
  tm_lastmsg_canbus.sensor5, 
  tm_lastmsg_canbus.sensor6
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.tm_lastmsg_canbus, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente
WHERE 
tm_mobil.computadora =1 AND
  tm_mobil.id_mobil = tm_lastmsg_canbus.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario = $idu AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND

  tm_equipo_componente.id_com = id_componente.id_com  and estado=1    order by evttime desc ; ";


// echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {
          
$fecha_gps=$row->fecha;
$phpdate = strtotime( date($fecha_gps) );
$dif=$hoy-$phpdate;
if (($dif>=86400) and ($dif<172800) ) { $atra=1; } else
if (($dif>=172800) and ($dif<259200) ) { $atra=2; } else 
if (($dif>=259200) ) { $atra=3; } else { $atra=0; }
          $row->atraso=$atra;

// $row->ddlat=-12.06231990382597;
// $row->ddlong=-77.02506065368652;
$data[]=$row;
}
} 

$js=json_encode($data);

return $js;


   }



public function ultimatxcanbusuna ($idu,$idunidad)
   {
    $hoyf=date("Y-m-d",time());
//$hoy="2013-09-04";
$hoy=time();
$sql="SELECT 
tm_mobil.id_mobil as codigonave, 
  tm_mobil.nombremobil as nombrenave, 
  tm_mobil.placa as placa, 
  tm_mobil.id_empresa as ide,
  tm_mobil.estado as estado ,
   tm_mobil.otros_servicios as os ,
    tm_mobil.computadora as computadora ,
        tm_mobil.vmax as vmax ,
        tm_mobil.promc as promconsumo,
        tm_mobil.suspencion as suspencion,
  tm_equipo.id_equipo as id_equipo , 
  id_componente.tipoc ,
    tm_lastmsg_canbus.lat as ddlat, 
    tm_lastmsg_canbus.lng as ddlong,
        tm_lastmsg_canbus.latstr, 
    tm_lastmsg_canbus.lngstr as lonstr,
tm_lastmsg_canbus.evttime - CAST('5 hour' AS INTERVAL) as Fecha,
  (tm_lastmsg_canbus.speed*1.852)::int as speed,
  tm_lastmsg_canbus.heading,
    tm_lastmsg_canbus.rpm, 
  tm_lastmsg_canbus.carga_motor, 
   tm_lastmsg_canbus.odometer,
  tm_lastmsg_canbus.nivel_comb, 
  tm_lastmsg_canbus.temp_motor, 
  tm_lastmsg_canbus.sensor1, 
  tm_lastmsg_canbus.sensor2, 
  tm_lastmsg_canbus.sensor3, 
  tm_lastmsg_canbus.sensor4, 
  tm_lastmsg_canbus.sensor5, 
  tm_lastmsg_canbus.sensor6
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.tm_lastmsg_canbus, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente
WHERE 
tm_mobil.computadora =1 AND
  tm_mobil.id_mobil = tm_lastmsg_canbus.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario = $idu AND tm_mobil.id_mobil=$idunidad AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_equipo_componente.id_com = id_componente.id_com  and estado=1    order by evttime desc ; ";


// echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {
          
$fecha_gps=$row->fecha;
$phpdate = strtotime( date($fecha_gps) );
$dif=$hoy-$phpdate;
if (($dif>=86400) and ($dif<172800) ) { $atra=1; } else
if (($dif>=172800) and ($dif<259200) ) { $atra=2; } else 
if (($dif>=259200) ) { $atra=3; } else { $atra=0; }
          $row->atraso=$atra;

// $row->ddlat=-12.06231990382597;
// $row->ddlong=-77.02506065368652;
$data[]=$row;
}
} 

$js=json_encode($data);

return $js;


   }



public function detalletxcanbus($idu,$im,$limite)
   {
$filtrofecha="";
$daterange=$this->input->post('daterange');
$servicios=$this->input->post('seleps');
$tipo=$this->input->post('tipo');
if($tipo) {
// echo "si viene tipo";
} else 
{
  //echo "no viene tipo";
}
if ($daterange) {
$fechas = explode("-", $daterange);
$fechai=trim($fechas[0]);
$fechaf=trim($fechas[1]);
//echo $tipo; echo $fechai; echo $fechaf;
}

if($tipo==2 ) {

  $filtrolimite= "limit $limite";
} else {

  $filtrolimite= " limit 60 ";
}

if ($tipo==1) {
$filtrolimite= "";

$filtrofecha = "and tm_data_canbus_hoy.evttime- CAST('5 hour' AS INTERVAL)>=to_timestamp('$fechai','DD/MM/YYYY HH24:MI') and tm_data_canbus_hoy.evttime- CAST('5 hour' AS INTERVAL)<=to_timestamp('$fechaf','DD/MM/YYYY HH24:MI')";
}

    $hoyf=date("Y-m-d",time());
//$hoy="2013-09-04";
$hoy=time();
$sql="SELECT 
tm_mobil.id_mobil as codigonave, 
  tm_mobil.nombremobil as nombrenave, 
  tm_mobil.placa as placa, 
  tm_mobil.id_empresa as ide,
  tm_mobil.estado as estado ,
   tm_mobil.otros_servicios as os ,
    tm_mobil.computadora as computadora ,
        tm_mobil.vmax as vmax ,
        tm_mobil.promc as promconsumo,
        tm_mobil.suspencion as suspencion,
  tm_equipo.id_equipo as id_equipo , 
  id_componente.tipoc ,
    tm_data_canbus_hoy.lat as ddlat, 
    tm_data_canbus_hoy.lng as ddlong,
        tm_data_canbus_hoy.latstr, 
    tm_data_canbus_hoy.lngstr as lonstr,
tm_data_canbus_hoy.evttime - CAST('5 hour' AS INTERVAL) as Fecha,
  (tm_data_canbus_hoy.speed*1.852)::int as speed,
  tm_data_canbus_hoy.heading,
    tm_data_canbus_hoy.rpm, 
  tm_data_canbus_hoy.carga_motor, 
  tm_data_canbus_hoy.nivel_comb, 
  tm_data_canbus_hoy.temp_motor, 
    tm_data_canbus_hoy.odometer,
  tm_data_canbus_hoy.sensor1, 
  tm_data_canbus_hoy.sensor2, 
  tm_data_canbus_hoy.sensor3, 
  tm_data_canbus_hoy.sensor4, 
  tm_data_canbus_hoy.sensor5, 
  tm_data_canbus_hoy.sensor6,
  tm_data_canbus_hoy.fuel_level, 
  tm_data_canbus_hoy.total_fuel_used, 
  tm_data_canbus_hoy.total_engine_hours
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.tm_data_canbus_hoy, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente
WHERE 
tm_mobil.computadora =1 AND
  tm_mobil.id_mobil = tm_data_canbus_hoy.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario = $idu AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND   tm_mobil.id_mobil=$im and 
  tm_equipo_componente.id_com = id_componente.id_com  and estado=1 $filtrofecha   order by evttime desc  $filtrolimite; ";
/* Variables que cuentan */

$min_engine_hours=0;
$max_engine_hours=0;
$min_total_fuel_used=0;
$max_total_fuel_used=0;
$max_odometro=0;
$min_odometro=0;


/* Fin de variables que cuentan */

// echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {

$odo=$row->odometer;
if($min_odometro>0) {
  if($min_odometro>$odo) {
    $min_odometro=$odo;
  }
} else {
$min_odometro=$odo;
}
if($max_odometro>0) {
  if($max_odometro<$odo) {
    $max_odometro=$odo;
  }
} else {
$max_odometro=$odo;
}


$teh=$row->total_engine_hours;
if($min_engine_hours>0) {
  if($min_engine_hours>$teh) {
    $min_engine_hours=$teh;
  }
} else {
$min_engine_hours=$teh;
}
if($max_engine_hours>0) {
  if($max_engine_hours<$teh) {
    $max_engine_hours=$teh;
  }
} else {
$max_engine_hours=$teh;
}

$tfu=$row->total_fuel_used;

if ($min_total_fuel_used>0) {
  if($min_total_fuel_used>$tfu) {
    $min_total_fuel_used=$tfu;
  }
} else {
$min_total_fuel_used=$tfu;
}

if($max_total_fuel_used>0) {
  if($max_total_fuel_used<$tfu) {
    $max_total_fuel_used=$tfu;
  }
} else {
$max_total_fuel_used=$tfu;
}

          
$fecha_gps=$row->fecha;
$phpdate = strtotime( date($fecha_gps) );
$dif=$hoy-$phpdate;
if (($dif>=86400) and ($dif<172800) ) { $atra=1; } else
if (($dif>=172800) and ($dif<259200) ) { $atra=2; } else 
if (($dif>=259200) ) { $atra=3; } else { $atra=0; }
          $row->atraso=$atra;

// $row->ddlat=-12.06231990382597;
// $row->ddlong=-77.02506065368652;
$data[]=$row;
} // Fin de foreach

//$row->total_teh=$max_engine_hours-$min_engine_hours;
//$row->total_tfu=$max_total_fuel_used-$min_total_fuel_used;

//     $datap[] = array(
// "total_teh" => ($max_engine_hours-$min_engine_hours);,
// "total_tfu" => ($max_total_fuel_used-$min_total_fuel_used);
// );

    $datap[] = array(
"total_teh" => number_format(($max_engine_hours-$min_engine_hours),2),
"total_tfu" => number_format(($max_total_fuel_used-$min_total_fuel_used)/3.78541,2),
"total_odo" => ($max_odometro-$min_odometro)
);

} 

//$js=json_encode($data);
$js='{"ultimatx":'.json_encode($data).',"periodos":'.json_encode($datap).'}';
return $js;


   }




public function detalletxcanbusep($idu,$im,$limite,$motor)
   {
$filtrofecha="";
$daterange=$this->input->post('daterange');
$servicios=$this->input->post('seleps');
$tipo=$this->input->post('tipo');
if($tipo) {
// echo "si viene tipo";
} else 
{
  //echo "no viene tipo";
}
if ($daterange) {
$fechas = explode("-", $daterange);
$fechai=trim($fechas[0]);
$fechaf=trim($fechas[1]);
//echo $tipo; echo $fechai; echo $fechaf;
}

if($tipo==2 ) {

  $filtrolimite= "limit $limite";
} else {

  $filtrolimite= " limit 60 ";
}

if ($tipo==1) {
$filtrolimite= "";

$filtrofecha = "and tm_data_canbus_hoy.evttime- CAST('5 hour' AS INTERVAL)>=to_timestamp('$fechai','DD/MM/YYYY HH24:MI') and tm_data_canbus_hoy.evttime- CAST('5 hour' AS INTERVAL)<=to_timestamp('$fechaf','DD/MM/YYYY HH24:MI')";
}

    $hoyf=date("Y-m-d",time());
//$hoy="2013-09-04";
$hoy=time();
$sql="SELECT 
tm_mobil.id_mobil as codigonave, 
  tm_mobil.nombremobil as nombrenave, 
  tm_mobil.placa as placa, 
  tm_mobil.id_empresa as ide,
  tm_mobil.estado as estado ,
   tm_mobil.otros_servicios as os ,
    tm_mobil.computadora as computadora ,
        tm_mobil.vmax as vmax ,
        tm_mobil.promc as promconsumo,
        tm_mobil.suspencion as suspencion,
  tm_equipo.id_equipo as id_equipo , 
  id_componente.tipoc ,
    tm_data_canbus_hoy.lat as ddlat, 
    tm_data_canbus_hoy.lng as ddlong,
        tm_data_canbus_hoy.latstr, 
    tm_data_canbus_hoy.lngstr as lonstr,
tm_data_canbus_hoy.evttime - CAST('5 hour' AS INTERVAL) as Fecha,
  (tm_data_canbus_hoy.speed*1.852)::int as speed,
  tm_data_canbus_hoy.heading,
    tm_data_canbus_hoy.rpm, 
  tm_data_canbus_hoy.carga_motor, 
  tm_data_canbus_hoy.nivel_comb, 
  tm_data_canbus_hoy.temp_motor, 
    tm_data_canbus_hoy.odometer,
  tm_data_canbus_hoy.sensor1, 
  tm_data_canbus_hoy.sensor2, 
  tm_data_canbus_hoy.sensor3, 
  tm_data_canbus_hoy.sensor4, 
  tm_data_canbus_hoy.sensor5, 
  tm_data_canbus_hoy.sensor6,
  tm_data_canbus_hoy.fuel_level, 
  tm_data_canbus_hoy.total_fuel_used, 
  tm_data_canbus_hoy.total_engine_hours
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.tm_data_canbus_hoy, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente
WHERE 
tm_data_canbus_hoy.sensor2=$motor AND
tm_mobil.computadora =1 AND
  tm_mobil.id_mobil = tm_data_canbus_hoy.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario = $idu AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND   tm_mobil.id_mobil=$im and 
  tm_equipo_componente.id_com = id_componente.id_com  and estado=1 $filtrofecha   order by evttime desc  $filtrolimite; ";


$min_engine_hours=0;
$max_engine_hours=0;
$min_total_fuel_used=0;
$max_total_fuel_used=0;
$max_odometro=0;
$min_odometro=0;


// echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {

    /* Contadores */

$odo=$row->odometer;
if($min_odometro>0) {
  if($min_odometro>$odo) {
    $min_odometro=$odo;
  }
} else {
$min_odometro=$odo;
}
if($max_odometro>0) {
  if($max_odometro<$odo) {
    $max_odometro=$odo;
  }
} else {
$max_odometro=$odo;
}


$teh=$row->total_engine_hours;
if($min_engine_hours>0) {
  if($min_engine_hours>$teh) {
    $min_engine_hours=$teh;
  }
} else {
$min_engine_hours=$teh;
}
if($max_engine_hours>0) {
  if($max_engine_hours<$teh) {
    $max_engine_hours=$teh;
  }
} else {
$max_engine_hours=$teh;
}

$tfu=$row->total_fuel_used;

if ($min_total_fuel_used>0) {
  if($min_total_fuel_used>$tfu) {
    $min_total_fuel_used=$tfu;
  }
} else {
$min_total_fuel_used=$tfu;
}

if($max_total_fuel_used>0) {
  if($max_total_fuel_used<$tfu) {
    $max_total_fuel_used=$tfu;
  }
} else {
$max_total_fuel_used=$tfu;
}

    /* Fin de COntadores */
          
$data[]=$row;
}
    $datap[] = array(
"total_teh" => number_format(($max_engine_hours-$min_engine_hours),2),
"total_tfu" => number_format(($max_total_fuel_used-$min_total_fuel_used)/3.78541,2),
"total_odo" => ($max_odometro-$min_odometro)
);


} 

//$js=json_encode($data);

//return $js;

$js='{"ultimatx":'.json_encode($data).',"periodos":'.json_encode($datap).'}';
return $js;



   }

public function fultimoreporte($idm) {

$sql="SELECT msg_id, msgref, ns_hem, ew_hem, lat_dd, long_dd, lat_dms, long_dms, 
       speed, course, gps_date, rec_date, zona_code, id_mobil, ubica, 
       distrito, provincia, departamento, panico, id_equipo
  FROM datos.tm_lastmsg where id_mobil=$idm;
";
$query = $this->db->query($sql);


    if($query -> num_rows() > 0)
    {
         foreach ($query->result() as $row)
        {
          $rec_date=$row->rec_date;
        $data[] = $row;
        }
      return $rec_date;
    }
    else
    {
      return false;
    }

} // Fin de Funcion

public function reporteflota($idu)
   {

$daterange=$this->input->post('daterange');
$servicios=$this->input->post('seleps');
$tabla=$this->input->post('tabladata');


$fechas = explode("-", $daterange);
$fechai=trim($fechas[0]);
$fechaf=trim($fechas[1]);

$filtro2="";
if($this->input->post('seleps')) {

  //echo "orlando";

$prefix = '';
$serviciosList='';
foreach ($servicios as $servicio)
{
    $serviciosList .= $prefix.$servicio;
    $prefix = ',';
}
$filtro2= "AND tm_naves.codigonave in(".$serviciosList.") ";
//echo $filtro2;
//echo $daterange;
}


$hoyf=date("Y-m-d",time());
//$hoy="2013-09-04";
$hoy=time();



  $sql= "SELECT 
tm_mobil.id_mobil as id_mobil, 
  tm_mobil.nombremobil as nombremobil, 
  tm_mobil.placa as placa, 
  tm_mobil.estado as estado ,
  tm_equipo.id_equipo as id_equipo , 
  id_componente.tipoc ,
    a.lat_dd as latitud, 
    a.long_dd as longitud,
a.gps_date - CAST('5 hour' AS INTERVAL) as Fecha, 
  (a.speed*1.852)::int as speed,
  a.course,
 a.ubica as ubica, a.provincia as provincia,a
.distrito as distrito,
a.departamento as departamento,
a.panico as panico,
a.fuel_level as  fuel_level,
   ts_tipotx.tipotx as tipotx,
    ts_tipotx.detalle as memcode,
    a.panico as panico,
    a.punto_control as punto_control

FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.$tabla a, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente,
  datos.ts_tipotx
WHERE 
ts_tipotx.tipotx=a.tipotx and   tm_mobil.id_mobil = a.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario =  $idu  AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_equipo_componente.id_com = id_componente.id_com  and tm_mobil.id_mobil in ($serviciosList) and estado=1 and a.gps_date - CAST('5 hour' AS INTERVAL) >to_timestamp('$fechai','DD/MM/YYYY HH24:MI') and  a.gps_date - CAST('5 hour' AS INTERVAL) <to_timestamp('$fechaf','DD/MM/YYYY HH24:MI')  order by nombremobil, gps_date desc    ";

//echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
  $cont=0;
   foreach ($query->result() as $row)
   {

  $lt[$cont]=$row->latitud;
$lg[$cont]=$row->longitud;
$idmob[$cont]=$row->id_mobil;
  if ($cont>0){  
    if ($idmob[$cont]==$idmob[$cont-1]) {
$distanciapunto=sqrt(pow(($lt[$cont]-$lt[$cont-1]),2)+pow(($lg[$cont]-$lg[$cont-1]),2))*115;
$row->distancia=number_format($distanciapunto,2);
} else { $row->distancia=0; }
} else 
{
  $row->distancia=0;
}
/*$deltatime[]="$horasd"."h "."$minutosd"."m"." $segundosd"."s";  */
/*
$fm=$row->fivemil;

$fecha_gps=$row->fecha;
$phpdate = strtotime( date($fecha_gps) );
$dif=$hoy-$phpdate;
if ($dif>=1260) { $atra=1; } else { $atra=0; }
$row->atraso=$atra;
if($fm==1){ $five="5 mil";} else {$five="ZdP";};
$row->fm=$five;
*/
$data[]=$row;
$cont++;
}
$js='{"ultimatx":'.json_encode($data).'}';
return $js;
} else 
{

//$row[] = NULL;
$row = new StdClass;
  $row->nombremobil="no hay data";
    $row->placa="no hay data";
   $row->fecha="no hay data";
    $row->ddlat="no hay data";
     $row->ddlong="no hay data";
          $row->speed="no hay data";
               $row->course="no hay data";
                    $row->voltaje="no hay data";
  $data[]=$row;
  $js='{"ultimatx":'.json_encode($data).'}';
//$js='{"ultimatx":[{"respuesta":"nohaydata"}] }';
return $js;

} 







   }



 public function tracking_flotacsv($idu,$fi,$ff,$tabla,$movs){
$fidia=substr($fi,0,2);
$fimes=substr($fi,3, 2);
$fiyear=substr($fi,6, 4);
$fihora=substr($fi,13);

$ffdia=substr($ff,0,2);
$ffmes=substr($ff,3, 2);
$ffyear=substr($ff,6, 4);
$ffhora=substr($ff,13);

$fis="$fiyear-$fimes-$fidia $fihora";
$ff= "$ffyear-$ffmes-$ffdia $ffhora";
$movs=str_replace("-", ",",$movs);

        
        date_default_timezone_set('America/Lima');
              $hoy=date("Y-m-d",time());
            $ayer=date('Y-m-d', strtotime('-1 day'));
           
$filtro= " and a.gps_date >'$fis' and  a.gps_date <'$ff' ";
//echo $filtro;


  $sql= "SELECT 
tm_mobil.id_mobil as id_mobil, 
  tm_mobil.nombremobil as nombremobil, 
  tm_mobil.placa as placa, 
  tm_mobil.estado as estado ,
  tm_equipo.id_equipo as id_equipo , 
  id_componente.tipoc ,
    a.lat_dd as latitud, 
    a.long_dd as longitud,
a.gps_date - CAST('5 hour' AS INTERVAL) as Fecha, 
  (a.speed*1.852)::int as speed,
  a.course,
 a.ubica as ubica, a.provincia as provincia,a
.distrito as distrito,a.departamento as departamento,a.panico as panico,
a.fuel_level as  fuel_level,
   ts_tipotx.tipotx as tipotx,
    ts_tipotx.detalle as memcode
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.$tabla a, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente,
  datos.ts_tipotx
WHERE 
ts_tipotx.tipotx=a.tipotx and 
  tm_mobil.id_mobil = a.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario =  $idu  AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_equipo_componente.id_com = id_componente.id_com  and tm_mobil.id_mobil in ($movs) and estado=1 $filtro order by nombremobil, gps_date desc    ";
//echo $hoy;
//echo $ayer;
  echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {
$data[]=$row;
}
} 

  $js='{"ultimatx":'.json_encode($data).'}';
  //$js='{"ultimatx":'.json_encode($datap).'}';
  return $js;  

        /** Fin ***/
        
      }
        


}