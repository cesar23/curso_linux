<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_ultimatx extends CI_Model{ // Begin class model_mantcateg

 public function distancia($lat1,$lon1,$lat2,$lon2)
{


$dis= sqrt(pow($lat1-$lat2, 2)+pow($lon1-$lon2,2));
  
$dis=number_format($dis*111,2);
    return $dis;
}

  public function resumen_semana()
   {


      //return '({"totalTiposMant":"0","rootTipoMant":[]})';
    $varxxx='{"fundogeneral":{"fundos":{"fundo1x":[{"dia":"2013-09-02","horas":15},{"dia":"2013-09-03","horas":20},{"dia":"2013-09-04","horas":8},{"dia":"2013-09-05","horas":8},{"dia":"2013-09-06","horas":8}],';
    $varxxx.='"fundo2x":[{"dia":"2013-09-02","horas":17},{"dia":"2013-09-03","horas":13},{"dia":"2013-09-04","horas":18},{"dia":"2013-09-05","horas":10},{"dia":"2013-09-06","horas":9}],';
    $varxxx.='"fundo3x":[{"dia":"2013-09-02","horas":30},{"dia":"2013-09-03","horas":13},{"dia":"2013-09-04","horas":21},{"dia":"2013-09-05","horas":18},{"dia":"2013-09-06","horas":11}]';
    $varxxx.='}}}';

    return $varxxx;

   }
     public function resumen_semana2($dia1,$dia2)
   {



$sql="select a.id_fundo,b.nombrefundo,(extract(EPOCH from age(a.final,a.inicio))/60) as riegomin,extract(year from a.inicio) as anio 
,extract(month from a.inicio) as mes,extract(day from a.inicio) as dia
from tm_timer a,tp_fundos b where a.id_fundo=b.id_fundo  
group by a.id_fundo,b.nombrefundo,a.inicio,a.final,anio,mes,dia order by id_fundo,anio,mes,dia";
//echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{

//  $diariego = array();
  $di = array();

      //$data[]=array("id_prod_serv"=>$id_fundo,"nombre_ps"=>$nombrefundo);
$cuenta=0;
$acumula=0;
$nda='';
$nfn='';
   foreach ($query->result() as $row)
   {
      $diax=$row->dia;
      $mesx=$row->mes;
      $aniox=$row->anio;
      $originalDate = $aniox."-".$mesx."-".$diax;
      $newDate = date("d-m-Y", strtotime($originalDate));
      $nf=$row->nombrefundo;
      if($nf<>$nfn){ $j=0; };
      $rm=$row->riegomin;
      if(($newDate==$nda) or ($nda=='')) { 
                  if($nda==''){
                  $acumula=$rm+$acumula;
                  } else {
                  $acumula=$rm+$acumula;
                  }
        $j++;
      } 
      else 
      {
        $acumula=0;
        $acumula=$rm+$acumula;
      }


$nn["$nf"]["$newDate"]= $acumula;

      $nda=$newDate;
      $nfn=$nf;
}
$js='{"fundogeneral":{"fundos":'.json_encode($nn).'}}';


return $js;


} else {

  echo "no";
}

   }







        public function consumounidadsemana($unidad,$dia1,$dia2)
   {


if(!$dia1) {
      $primer_dia = mktime();
while(date("w",$primer_dia)!=1){
$primer_dia -= 3600;
}
} else
{
$primer_dia=$dia1;

}
if(!$dia2) {

$ultimo_dia = mktime();

while(date("w",$ultimo_dia)!=0){
$ultimo_dia += 3600;
}
} else {
$ultimo_dia=$dia2;

}
$h_dia=date("d-m-Y",mktime());
$p_dia=strtotime(date("d-m-Y",$primer_dia));
$u_dia=strtotime(date("d-m-Y",$ultimo_dia));


 
for($i=$p_dia; $i<=$u_dia; $i+=86400){ // Inicio del For de Fechas
    //echo date("Y-m-d", $i);
    $fechita=date("Y-m-d", $i);
/****/

$sql="SELECT 
tm_mobil.id_mobil, 
  tm_mobil.nombremobil, 
  tm_mobil.placa, 
  tm_mobil.estado,
  id_componente.adc as adc, 
  id_componente.tipoc
FROM 
  datos.tm_mobil, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente
WHERE 
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_equipo_componente.id_com = id_componente.id_com AND tm_mobil.id_mobil=$unidad AND tipoc=1 and estado=1;";

//echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{

//  $diariego = array();
  
      //$data[]=array("id_prod_serv"=>$id_fundo,"nombre_ps"=>$nombrefundo);
   foreach ($query->result() as $row)
   {
      $if=$row->id_mobil;
      $nf=$row->nombremobil;
      $adc=$row->adc;

$sqlx="SELECT  adc, date_trunc('DAY',sequencetime) as fecha 
        ,sum(horometer) as hm
  FROM datos.tm_horometro 
where adc='$adc' and date_trunc('DAY',sequencetime)='$fechita'

group by adc,fecha order by fecha desc;";

$queryx = $this->db->query($sqlx);

if ($queryx->num_rows() > 0)
{

//  $diariego = array();
  
      //$data[]=array("id_prod_serv"=>$id_fundo,"nombre_ps"=>$nombrefundo);
  $acumularm=0;
   foreach ($queryx->result() as $rowx)
   {
          $rmin=$rowx->hm;
$acumularm=$acumularm+$rmin;
   }

} else { $acumularm=0;}

$nn["$nf"]["$fechita"]= $acumularm;


}



} else {


}

/*****/

} // Fin del For de fechas

//$js=json_encode($nn);
$js='{"fundogeneral":{"fundos":'.json_encode($nn).'}}';

return $js;


   }
        public function tracking_unidadfs($unidad,$dia1,$dia2,$idu,$datax)
      {

        //echo $dia1;         echo $dia2;

        /** Inicio**/
        date_default_timezone_set('America/Lima');
              $hoy=date("Y-m-d",mktime());
            $ayer=date('Y-m-d', strtotime('-1 day'));
            if ($datax=='tm_data_hoy')
            {
              //echo "dia ".$dia1;
              $fis=$hoy.' '.$dia1;
          //    echo $fis; echo " <br> ";
              $ff=$hoy.' '.$dia2;
            //  echo $ff;
            };
                        if ($datax=='tm_data_ayer')
            {
              //echo "dia ".$dia1;
              $fis=$ayer.' '.$dia1;
          //    echo $fis; echo " <br> ";
              $ff=$ayer.' '.$dia2;
            //  echo $ff;
            }
                                    if ($datax=='tm_data_mesactual')
            {
              //echo "dia ".$dia1;
              $fis=$dia1;
              $fis = str_replace("%20"," ",$fis);
          //    echo $fis; echo " <br> ";
              $ff=$dia2;
              $ff = str_replace("%20"," ",$ff);

            //  echo $ff;
            }
$filtro= " and (a.gps_date - CAST('5 hour' AS INTERVAL))>'$fis' and  (a.gps_date - CAST('5 hour' AS INTERVAL))<'$ff' ";
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
.distrito as distrito,a.departamento as departamento,a.panico as panico,a.fuel_level as  fuel_level
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.$datax a, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente
WHERE 
a.fuel_level is not null AND
  tm_mobil.id_mobil = a.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario =  $idu  AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_equipo_componente.id_com = id_componente.id_com  and tm_mobil.id_mobil=$unidad and estado=1 $filtro order by gps_date desc    ";
//echo $hoy;
//echo $ayer;
//  echo $sql;
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

        /** Fin ***/
        
      }
        public function tracking_unidadf($unidad,$dia1,$dia2,$idu,$datax)
      {
$numero_excesos=0;
$numero_velcero=0;
$numero_velocidad=0;
$disrecorrida=0;
        //echo $dia1;         echo $dia2;

        /** Inicio**/
        date_default_timezone_set('America/Lima');
              $hoy=date("Y-m-d",mktime());
            $ayer=date('Y-m-d', strtotime('-1 day'));
            if ($datax=='tm_data_hoy')
            {
              //echo "dia ".$dia1;
              $fis=$hoy.' '.$dia1;
          //    echo $fis; echo " <br> ";
              $ff=$hoy.' '.$dia2;
            //  echo $ff;
                            $fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));
              $ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));

            };
                        if ($datax=='tm_data_ayer')
            {
              //echo "dia ".$dia1;
              $fis=$ayer.' '.$dia1;
          //    echo $fis; echo " <br> ";
              $ff=$ayer.' '.$dia2;
              $fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));
              $ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));

            //  echo $ff;
            }
                                    if ($datax=='tm_data_mesactual')
            {
              //echo "dia ".$dia1;
              $fis=$dia1;
              $fis = date(str_replace("%20"," ",$fis));
$fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));

        //      $fisx=date("Y-m-d H:i:s",strtotime("$fis + 5 Hours"));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
       //                     echo $fis." ";echo $fisx; echo " <br> ";

              $ff=$dia2;
           //   echo $ff." <br> ";
              $ff = date(str_replace("%20"," ",$ff));
              //$ff = date($ff,(strtotime("+5 Hours")));
   //           $ffx=date("$ff",strtotime("$ff + 5 Hours"));
//                           $ffx=date("Y-m-d H:m:s",strtotime("$ff + 5 Hours"));
$ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
                 //           echo $ff." ";echo $ffx; echo " <br> ";

            //  echo $ff;
            }
                                                if ($datax=='tm_data_mespasado')
            {
              //echo "dia ".$dia1;
              $fis=$dia1;
              $fis = date(str_replace("%20"," ",$fis));
$fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));

        //      $fisx=date("Y-m-d H:i:s",strtotime("$fis + 5 Hours"));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
       //                     echo $fis." ";echo $fisx; echo " <br> ";

              $ff=$dia2;
           //   echo $ff." <br> ";
              $ff = date(str_replace("%20"," ",$ff));
              //$ff = date($ff,(strtotime("+5 Hours")));
   //           $ffx=date("$ff",strtotime("$ff + 5 Hours"));
//                           $ffx=date("Y-m-d H:m:s",strtotime("$ff + 5 Hours"));
$ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
                 //           echo $ff." ";echo $ffx; echo " <br> ";

            //  echo $ff;
            }
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
/*a.gps_date as Fecha,*/
a.gps_date - CAST('5 hour' AS INTERVAL) as Fecha, 
  (a.speed*1.852)::int as speed,
  a.course,
 a.ubica as ubica, a.provincia as provincia,a
.distrito as distrito,a.departamento as departamento,a.panico as panico,a.fuel_level as  fuel_level
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.$datax a, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente
WHERE 
  tm_mobil.id_mobil = a.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario =  $idu  AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_equipo_componente.id_com = id_componente.id_com  and tm_mobil.id_mobil=$unidad and estado=1 $filtro order by gps_date desc    ";
//echo $hoy;
//echo $ayer;
  echo $sql;
###########


$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
    $ix=0; // Numero Fila 
$num_velox=0; // Contadores durante el bucle
$num_vel0=0; // Contadores durante el bucle
   foreach ($query->result() as $row)
   {



        $la[$ix]=$row->latitud;
        $lo[$ix]=$row->longitud;
                $row->distancia=0;
                if($ix>1) {
        $dis=$this->distancia($la[$ix],$lo[$ix],$la[$ix-1],$lo[$ix-1]);
        $disrecorrida=$disrecorrida+$dis;
        $row->distancia=$dis;
        } 
        if($row->speed>0) {
           
    
                 if($num_velox==1 and $ix>0 and $num_vel0>0) {
                   $bb[]=array("v"=>"$num_vel0","c"=>"#cccfc8","t"=>"par");
                   $num_vel0=0; // Reinicia contador bucle
                  }
          $num_velox++;
          $nn=$num_velox;
          $co="#a5d468";
          $mo="mov";
          $numero_velocidad++;
          

        } else 
        {
        $num_vel0++;
          
                if($num_vel0==1 and $num_velox>0) {
                $bb[]=array("v"=>"$num_velox","c"=>"$co","t"=>"$mo");
                }

          $nn=$num_vel0;
          $co="#cccfc8";
          $mo="par";
          $numero_velcero++;
          
          $num_velox=0; // Reinicia contador bucle

        
        }


        $ix++;
        $data[]=$row;


}
       $bb[]=array("v"=>"$nn","c"=>"$co","t"=>"$mo");
$datax['numero_velocidad']=$numero_velocidad;
$datax['numero_velcero']=$numero_velcero;
$datax['disrecorrida']=$disrecorrida;

} 

/*$js='{"ultimatx":'.json_encode($data).'}';

return $js; */
$js='{"ultimatx":'.json_encode($data).',"totalx":'.json_encode($datax).',"totalxx":'.json_encode($bb).'}';

return $js;

        /** Fin ***/
        
      }
              public function tracking_unidadfxls($unidad,$dia1,$dia2,$idu,$datax)
      {

        //echo $dia1;         echo $dia2;

        /** Inicio**/
        date_default_timezone_set('America/Lima');
              $hoy=date("Y-m-d",mktime());
            $ayer=date('Y-m-d', strtotime('-1 day'));
            if ($datax=='tm_data_hoy')
            {
              //echo "dia ".$dia1;
              $fis=$hoy.' '.$dia1;
          //    echo $fis; echo " <br> ";
              $ff=$hoy.' '.$dia2;
            //  echo $ff;
              $fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));
              $ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));

            };
                        if ($datax=='tm_data_ayer')
            {
              //echo "dia ".$dia1;
              $fis=$ayer.' '.$dia1;
          //    echo $fis; echo " <br> ";
              $ff=$ayer.' '.$dia2;
            //  echo $ff;
              $fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));
              $ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));


            }
            if ($datax=='tm_data_mesactual')
            {
              //echo "dia ".$dia1;
              $fis=$dia1;
              $fis = date(str_replace("%20"," ",$fis));
$fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));

        //      $fisx=date("Y-m-d H:i:s",strtotime("$fis + 5 Hours"));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
       //                     echo $fis." ";echo $fisx; echo " <br> ";

              $ff=$dia2;
           //   echo $ff." <br> ";
              $ff = date(str_replace("%20"," ",$ff));
              //$ff = date($ff,(strtotime("+5 Hours")));
   //           $ffx=date("$ff",strtotime("$ff + 5 Hours"));
//                           $ffx=date("Y-m-d H:m:s",strtotime("$ff + 5 Hours"));
$ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
                 //           echo $ff." ";echo $ffx; echo " <br> ";

            //  echo $ff;
            }
                        if ($datax=='tm_data_mespasado')
            {
              //echo "dia ".$dia1;
              $fis=$dia1;
              $fis = date(str_replace("%20"," ",$fis));
$fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));

        //      $fisx=date("Y-m-d H:i:s",strtotime("$fis + 5 Hours"));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
       //                     echo $fis." ";echo $fisx; echo " <br> ";

              $ff=$dia2;
           //   echo $ff." <br> ";
              $ff = date(str_replace("%20"," ",$ff));
              //$ff = date($ff,(strtotime("+5 Hours")));
   //           $ffx=date("$ff",strtotime("$ff + 5 Hours"));
//                           $ffx=date("Y-m-d H:m:s",strtotime("$ff + 5 Hours"));
$ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
                 //           echo $ff." ";echo $ffx; echo " <br> ";

            //  echo $ff;
            }
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
/*a.gps_date as Fecha,*/
a.gps_date - CAST('5 hour' AS INTERVAL) as Fecha, 
  (a.speed*1.852)::int as speed,
  a.course,
 a.ubica as ubica, a.provincia as provincia,a
.distrito as distrito,a.departamento as departamento,a.panico as panico,a.fuel_level as  fuel_level
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.$datax a, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente
WHERE 
  tm_mobil.id_mobil = a.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario =  $idu  AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_equipo_componente.id_com = id_componente.id_com  and tm_mobil.id_mobil=$unidad and estado=1 $filtro order by gps_date desc    ";
//echo $hoy;
//echo $ayer;
//  echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {
$data[]=$row;
}
} 

return $data;

        /** Fin ***/
        
      }




public function tracking_unidad($unidad,$dia1,$dia2,$idu,$data)
			{
				/** Inicio**/
$hoy=date("Y-m-d",mktime());
$ayer=date('Y-m-d', strtotime('-1 day'));
  
$numero_excesos=0;
$numero_velcero=0;
$numero_velocidad=0;
$disrecorrida=0;
$sql= "SELECT 
    tm_mobil.id_mobil as id_mobil, 
    tm_mobil.nombremobil as nombremobil, 
    tm_mobil.placa as placa, 
    tm_mobil.estado as estado ,
    tm_equipo.id_equipo as id_equipo , 
    id_componente.tipoc ,
    tm_data_hoy.lat_dd as latitud, 
    tm_data_hoy.long_dd as longitud,
    tm_data_hoy.gps_date - CAST('5 hour' AS INTERVAL) as Fecha,
  	(tm_data_hoy.speed*1.852)::int as speed,
  	tm_data_hoy.course,
    tm_data_hoy.ubica as ubica, 
    tm_data_hoy.provincia as provincia,
    tm_data_hoy.distrito as distrito,
    tm_data_hoy.departamento as departamento,
    tm_data_hoy.panico as panico,
    tm_data_hoy.fuel_level as  fuel_level
FROM 
    datos.tm_mobil, 
    datos.tm_usuario_mobil, 
    datos.tm_data_hoy, 
    datos.tm_mobil_equipo, 
    datos.tm_equipo, 
    datos.tm_equipo_componente, 
    datos.id_componente
WHERE 
    tm_mobil.id_mobil = tm_data_hoy.id_mobil AND
    tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
    tm_usuario_mobil.id_usuario =  $idu  AND
    tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
    tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
    tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
    tm_equipo_componente.id_com = id_componente.id_com  and tm_mobil.id_mobil=$unidad and estado=1 order by gps_date desc   ";

    $query = $this->db->query($sql);

    if ($query->num_rows() > 0)
    {
$ix=0; // Numero Fila 
$num_velox=0; // Contadores durante el bucle
$num_vel0=0; // Contadores durante el bucle


       foreach ($query->result() as $row)
       {
        $data[]=$row;
        $la[$ix]=$row->latitud;
        $lo[$ix]=$row->longitud;
        $row->distancia=0;
        if($ix>1) {
        $dis=$this->distancia($la[$ix],$lo[$ix],$la[$ix-1],$lo[$ix-1]);
        $disrecorrida=$disrecorrida+$dis;
        $row->distancia=$dis;
        } 
        if($row->speed>0) {
           
    
                 if($num_velox==1 and $ix>0 and $num_vel0>0) {
                   $bb[]=array("v"=>"$num_vel0","c"=>"#cccfc8","t"=>"par");
                   $num_vel0=0; // Reinicia contador bucle
                  }
          $num_velox++;
          $nn=$num_velox;
          $co="#a5d468";
          $mo="mov";
          $numero_velocidad++;
          

        } else 
        {
        $num_vel0++;
          
                if($num_vel0==1 and $num_velox>0) {
                $bb[]=array("v"=>"$num_velox","c"=>"$co","t"=>"$mo");
                }

          $nn=$num_vel0;
          $co="#cccfc8";
          $mo="par";
          $numero_velcero++;
          
          $num_velox=0; // Reinicia contador bucle

        
        }


        $ix++;
       }
       $bb[]=array("v"=>"$nn","c"=>"$co","t"=>"$mo");
$datax['numero_velocidad']=$numero_velocidad;
$datax['numero_velcero']=$numero_velcero;
$datax['disrecorrida']=$disrecorrida;

    } 

//$js='{"ultimatx":'.json_encode($data).'}';
$js='{"ultimatx":'.json_encode($data).',"totalx":'.json_encode($datax).',"totalxx":'.json_encode($bb).'}';

return $js;

				/** Fin ***/
				
			}


/*
$datax['total_atraso']=$con_at;
$datax['total_cobertura']=$con_cob;
$datax['total_normal']=$query->num_rows()-($con_at+$con_cob);
$datax['total_unidades']=$query->num_rows();

} 

//[{"id_mobil":"1224","nombremobil":"CRUZ_B8070","placa":"A6M951","estado":"1","os":"0","computadora":"0","id_equipo":"1195","tipoc":"6","latitud":"-12.0069841333333","longitud":"-77.0565159333333","fecha":"2014-03-04 10:47:43","speed":"6","course":"351.4","ubica":"SD","provincia":"LIMA","distrito":" INDEPENDENCIA","departamento":" LIMA","panico":"0","atraso":0}

$js='{"ultimatx":'.json_encode($data).',"totalx":'.json_encode($datax).'}';

*/


public function tracking_unidads($unidad,$dia1,$dia2,$idu,$data)
      {
        /** Inicio**/
            $hoy=date("Y-m-d",mktime());
            $ayer=date('Y-m-d', strtotime('-1 day'));
//$hoy="2013-09-04";


  
  $sql= "SELECT 
tm_mobil.id_mobil as id_mobil, 
  tm_mobil.nombremobil as nombremobil, 
  tm_mobil.placa as placa, 
  tm_mobil.estado as estado ,
  tm_equipo.id_equipo as id_equipo , 
  id_componente.tipoc ,
    tm_data_hoy
.lat_dd as latitud, 
    tm_data_hoy
.long_dd as longitud,
tm_data_hoy
.gps_date - CAST('5 hour' AS INTERVAL) as Fecha,
  (tm_data_hoy
.speed*1.852)::int as speed,
  tm_data_hoy
.course,
 tm_data_hoy
.ubica as ubica, tm_data_hoy
.provincia as provincia,tm_data_hoy
.distrito as distrito,tm_data_hoy
.departamento as departamento,tm_data_hoy
.panico as panico,tm_data_hoy.fuel_level as  fuel_level
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.tm_data_hoy, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente
WHERE 
  tm_mobil.id_mobil = tm_data_hoy
.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario =  $idu  AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_data_hoy.fuel_level is not null AND 
  tm_equipo_componente.id_com = id_componente.id_com  and tm_mobil.id_mobil=$unidad and estado=1 order by gps_date desc   ";

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

        /** Fin ***/
        
      }
        public function computadora_unidad($unidad,$dia1,$dia2,$idu)
      {
        /** Inicio**/
            $hoy=date("Y-m-d",mktime());
//$hoy="2013-09-04";


  
  $sql= "SELECT a.rid, a.adc, a.returntime, a.sequencetime - CAST('5 hour' AS INTERVAL) as Fecha,  
a.receivedtime, a.msgnote, a.hrtotalvehdist, a.horometer, a.odometervalue, a.totalfuelused*2 as totalfuelused, 
a.cooltemp, a.rpm*8 as rpm,    a.fuellevel
  FROM   datos.tm_canbus_values_hoy a, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente, 
  datos.tm_mobil_equipo where

   a.polltype in ('2b','2c') and 
     tm_equipo.id_com = tm_equipo_componente.id_com AND
  tm_equipo_componente.id_com = id_componente.id_com AND
  id_componente.adc = a.adc AND
  tm_mobil_equipo.id_equipo = tm_equipo.id_equipo and tm_mobil_Equipo.id_Mobil=$unidad


  order by a.sequencetime desc limit 4000
  ";

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

        /** Fin ***/
        
      }


        public function computadora_unidadf($unidad,$dia1,$dia2,$idu,$datax)
      {
        date_default_timezone_set('America/Lima');
              $hoy=date("Y-m-d",mktime());
            $ayer=date('Y-m-d', strtotime('-1 day'));
            if ($datax=='tm_data_hoy')
            {
                            $tabla="tm_canbus_values_hoy";

              //echo "dia ".$dia1;
              $fis=$hoy.' '.$dia1;
          //    echo $fis; echo " <br> ";
              $ff=$hoy.' '.$dia2;
            //  echo $ff;
                            $fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));
              $ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));

            };
                        if ($datax=='tm_data_ayer')
            {
              //echo "dia ".$dia1;
                            $tabla="tm_canbus_values_ayer";

              $fis=$ayer.' '.$dia1;
          //    echo $fis; echo " <br> ";
              $ff=$ayer.' '.$dia2;
              $fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));
              $ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));

            //  echo $ff;
            }
                                    if ($datax=='tm_data_mesactual')
            {
              //echo "dia ".$dia1;
              $tabla="tm_canbus_values_mes";
              $fis=$dia1;
              $fis = date(str_replace("%20"," ",$fis));
$fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));

        //      $fisx=date("Y-m-d H:i:s",strtotime("$fis + 5 Hours"));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
       //                     echo $fis." ";echo $fisx; echo " <br> ";

              $ff=$dia2;
           //   echo $ff." <br> ";
              $ff = date(str_replace("%20"," ",$ff));
              //$ff = date($ff,(strtotime("+5 Hours")));
   //           $ffx=date("$ff",strtotime("$ff + 5 Hours"));
//                           $ffx=date("Y-m-d H:m:s",strtotime("$ff + 5 Hours"));
$ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
                 //           echo $ff." ";echo $ffx; echo " <br> ";

            //  echo $ff;
            }
                                                if ($datax=='tm_data_mespasado')
            {
              //echo "dia ".$dia1;
                            $tabla="tm_canbus_values_mespasado";

              $fis=$dia1;
              $fis = date(str_replace("%20"," ",$fis));
$fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));

        //      $fisx=date("Y-m-d H:i:s",strtotime("$fis + 5 Hours"));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
       //                     echo $fis." ";echo $fisx; echo " <br> ";

              $ff=$dia2;
           //   echo $ff." <br> ";
              $ff = date(str_replace("%20"," ",$ff));
              //$ff = date($ff,(strtotime("+5 Hours")));
   //           $ffx=date("$ff",strtotime("$ff + 5 Hours"));
//                           $ffx=date("Y-m-d H:m:s",strtotime("$ff + 5 Hours"));
$ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
                 //           echo $ff." ";echo $ffx; echo " <br> ";

            //  echo $ff;
            }
$filtro= " and a.sequencetime >'$fis' and  a.sequencetime <'$ff' ";

  
  $sql= "SELECT a.rid, a.adc, a.returntime, a.sequencetime - CAST('5 hour' AS INTERVAL) as Fecha,  
a.receivedtime, a.msgnote, a.hrtotalvehdist, a.horometer, a.odometervalue, a.totalfuelused*2 as totalfuelused, 
a.cooltemp, a.rpm*8 as rpm,    a.fuellevel
  FROM   datos.$tabla a, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente, 
  datos.tm_mobil_equipo where

   a.polltype in ('2b','2c') and 
     tm_equipo.id_com = tm_equipo_componente.id_com AND
  tm_equipo_componente.id_com = id_componente.id_com AND
  id_componente.adc = a.adc AND
  tm_mobil_equipo.id_equipo = tm_equipo.id_equipo and tm_mobil_Equipo.id_Mobil=$unidad $filtro


  order by a.sequencetime desc limit 4000

  ";

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

        /** Fin ***/
        
      }








        public function consumounidadsemana_nuevo($unidad,$dia1,$dia2)
   {


if(!$dia1) {
      $primer_dia = mktime();
while(date("w",$primer_dia)!=1){
$primer_dia -= 3600;
}
} else
{
$primer_dia=$dia1;

}
if(!$dia2) {

$ultimo_dia = mktime();

while(date("w",$ultimo_dia)!=0){
$ultimo_dia += 3600;
}
} else {
$ultimo_dia=$dia2;

}
$h_dia=date("d-m-Y",mktime());
$p_dia=strtotime(date("d-m-Y",$primer_dia));
$u_dia=strtotime(date("d-m-Y",$ultimo_dia));

//$p_dia=strtotime("2013-09-17");
//$u_dia=strtotime("2013-09-24");

 
for($i=$p_dia; $i<=$u_dia; $i+=86400){ // Inicio del For de Fechas
  //  echo date("Y-m-d", $i);
    $fechita=date("Y-m-d", $i);
/****/

$sql="SELECT 
tm_mobil.id_mobil, 
  tm_mobil.nombremobil, 
  tm_mobil.placa, 
  tm_mobil.estado,
  id_componente.adc as adc, 
  id_componente.tipoc
FROM 
  datos.tm_mobil, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente
WHERE 
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_equipo_componente.id_com = id_componente.id_com AND tm_mobil.id_mobil=$unidad AND tipoc=1 and estado=1;";

//echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{

//  $diariego = array();
  
      //$data[]=array("id_prod_serv"=>$id_fundo,"nombre_ps"=>$nombrefundo);
   foreach ($query->result() as $row)
   {
      $if=$row->id_mobil;
      $nf=$row->nombremobil;
      $adc=$row->adc;

$sqlx="SELECT  adc, date_trunc('DAY',sequencetime) as fecha 
        ,sum(horometer) as hm,avg(latitude) as lati,avg(longitude) as long
  FROM datos.tm_horometro 
where adc='$adc' and date_trunc('DAY',sequencetime)='$fechita'

group by adc,fecha order by fecha desc;";

$queryx = $this->db->query($sqlx);

if ($queryx->num_rows() > 0)
{
  $acumularm=0;
   foreach ($queryx->result() as $rowx)
   {
$data[]=$rowx;
   }

} else 
{

}


}



} else {


}

/*****/

} // Fin del For de fechas

//$js=json_encode($nn);
$js='{"fundogeneral":{"fundos":'.json_encode($data).'}}';

return $js;


   }


public function ultimatxxls($idu)
   {
    $hoy=date("Y-m-d",mktime());
//$hoy="2013-09-04";

$sql="SELECT 
tm_mobil.id_mobil as id_mobil, 
  tm_mobil.nombremobil as nombremobil, 
  tm_mobil.placa as placa, 
  tm_mobil.estado as estado ,
    tm_lastmsg.lat_dd as latitud, 
    tm_lastmsg.long_dd as longitud,
tm_lastmsg.gps_date - CAST('5 hour' AS INTERVAL) as Fecha,
	(tm_lastmsg.speed*1.852)::int as speed,
	tm_lastmsg.course,
 tm_lastmsg.ubica as ubica, tm_lastmsg.provincia as provincia,tm_lastmsg.distrito as distrito,tm_lastmsg.departamento as departamento,tm_lastmsg.panico as panico
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
  tm_equipo_componente.id_com = id_componente.id_com  and estado=1 order by gps_date desc ; ";

$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {
$data[]=$row;
}
} 



return $data;


   }


public function ultimatx($idu)
   {
    $hoyf=date("Y-m-d",mktime());
//$hoy="2013-09-04";
$hoy=mktime();
$sql="SELECT 
tm_mobil.id_mobil as id_mobil, 
  tm_mobil.nombremobil as nombremobil, 
  tm_mobil.placa as placa, 
  tm_mobil.estado as estado ,
   tm_mobil.otros_servicios as os ,
    tm_mobil.computadora as computadora ,
  tm_equipo.id_equipo as id_equipo , 
  id_componente.tipoc ,
    tm_lastmsg.lat_dd as latitud, 
    tm_lastmsg.long_dd as longitud,
tm_lastmsg.gps_date - CAST('5 hour' AS INTERVAL) as Fecha,
  (tm_lastmsg.speed*1.852)::int as speed,
  tm_lastmsg.course,
 tm_lastmsg.ubica as ubica, tm_lastmsg.provincia as provincia,tm_lastmsg.distrito as distrito,tm_lastmsg.departamento as departamento,tm_lastmsg.panico as panico
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
  tm_equipo_componente.id_com = id_componente.id_com  and estado=1 order by gps_date desc ; ";

$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
  $con_at=0;
  $con_cob=0;

   foreach ($query->result() as $row)
   {
          
$fecha_gps=$row->fecha;
$phpdate = strtotime( date($fecha_gps) );
$dif=$hoy-$phpdate;

if ($dif>=1260 and $dif<36000) {

 $cobe=1; 
 $con_cob++;
} else { $cobe=0; }

if ($dif>=36000) {

 $atra=1; 
 $con_at++;
} else { $atra=0; }
          $row->atraso=$atra;
          $row->cobertura=$cobe;

$data[]=$row;
}
$datax['total_atraso']=$con_at;
$datax['total_cobertura']=$con_cob;
$datax['total_normal']=$query->num_rows()-($con_at+$con_cob);
$datax['total_unidades']=$query->num_rows();

} 

//[{"id_mobil":"1224","nombremobil":"CRUZ_B8070","placa":"A6M951","estado":"1","os":"0","computadora":"0","id_equipo":"1195","tipoc":"6","latitud":"-12.0069841333333","longitud":"-77.0565159333333","fecha":"2014-03-04 10:47:43","speed":"6","course":"351.4","ubica":"SD","provincia":"LIMA","distrito":" INDEPENDENCIA","departamento":" LIMA","panico":"0","atraso":0}

$js='{"ultimatx":'.json_encode($data).',"totalx":'.json_encode($datax).'}';

return $js;


   }















        public function resumen_semana3($dia1,$dia2,$idu)
   {


if(!$dia1) {
      $primer_dia = mktime();
while(date("w",$primer_dia)!=1){
$primer_dia -= 3600;
}
} else
{
$primer_dia=$dia1;

}
if(!$dia2) {

$ultimo_dia = mktime();

while(date("w",$ultimo_dia)!=0){
$ultimo_dia += 3600;
}
} else {
$ultimo_dia=$dia2;

}
$h_dia=date("d-m-Y",mktime());
$p_dia=strtotime(date("d-m-Y",$primer_dia));
$u_dia=strtotime(date("d-m-Y",$ultimo_dia));


 
for($i=$p_dia; $i<=$u_dia; $i+=86400){ // Inicio del For de Fechas
    //echo date("Y-m-d", $i);
    $fechita=date("Y-m-d", $i);
/****/
$sqlx="select a.id_fundo,b.nombrefundo,(extract(EPOCH from age(a.final,a.inicio))/60) as riegomin,extract(year from a.inicio) as anio 
,extract(month from a.inicio) as mes,extract(day from a.inicio) as dia
from tm_timer a,tp_fundos b where a.id_fundo=b.id_fundo  and date_trunc('DAY',inicio)='$fechita'
group by a.id_fundo,b.nombrefundo,a.inicio,a.final,anio,mes,dia order by id_fundo,anio,mes,dia";


  $sql="SELECT 
tm_mobil.id_mobil, 
  tm_mobil.nombremobil, 
  tm_mobil.placa, 
  tm_mobil.estado,
  id_componente.adc as adc, 
  id_componente.tipoc
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente
WHERE 
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
  tm_usuario_mobil.id_usuario = $idu AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_equipo_componente.id_com = id_componente.id_com AND tipoc=1 and estado=1;";

//echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{

//  $diariego = array();
  
      //$data[]=array("id_prod_serv"=>$id_fundo,"nombre_ps"=>$nombrefundo);
   foreach ($query->result() as $row)
   {
   /*   $originalDate = $aniox."-".$mesx."-".$diax;
      $newDate = date("d-m-Y", strtotime($originalDate)); */
      $if=$row->id_mobil;

      $nf=$row->nombremobil;
      $adc=$row->adc;

      //if($nf<>$nfn){ $j=0; $acumula=0;};
$sqlxxx="select a.id_fundo,(extract(EPOCH from age(a.final,a.inicio))/60) as riegomin
from tm_timer a where date_trunc('DAY',inicio)='$fechita' and id_fundo=$if
group by a.id_fundo,a.inicio,a.final order by id_fundo";

$sqlxss="SELECT rid, polltype, latitude, longitude, adc, returntime, sequencetime, 
       receivedtime, horometer, horoacu
  FROM datos.tm_horometro where adc='$adc';";
$sqlx="SELECT  adc, date_trunc('DAY',sequencetime) as fecha 
        ,sum(horometer) as hm
  FROM datos.tm_horometro 
where adc='$adc' and date_trunc('DAY',sequencetime)='$fechita'

group by adc,fecha order by fecha desc;";

$queryx = $this->db->query($sqlx);

if ($queryx->num_rows() > 0)
{

//  $diariego = array();
  
      //$data[]=array("id_prod_serv"=>$id_fundo,"nombre_ps"=>$nombrefundo);
  $acumularm=0;
   foreach ($queryx->result() as $rowx)
   {
          $rmin=$rowx->hm;
$acumularm=$acumularm+$rmin;
   }

} else { $acumularm=0;}

$nn["$nf"]["$fechita"]= $acumularm;

      //$nda=$newDate;
      $nfn=$nf;
}



} else {


}

/*****/

} // Fin del For de fechas

//$js=json_encode($nn);
$js='{"fundogeneral":{"fundos":'.json_encode($nn).'}}';

return $js;


   }
  public function resumen_semana2xxx()
   {

$sql="select a.id_fundo,b.nombrefundo,(extract(EPOCH from age(a.final,a.inicio))/60) as riegomin,extract(year from a.inicio) as anio 
,extract(month from a.inicio) as mes,extract(day from a.inicio) as dia
from tm_timer a,tp_fundos b where a.id_fundo=b.id_fundo  
group by a.id_fundo,b.nombrefundo,a.inicio,a.final,anio,mes,dia order by id_fundo,anio,mes,dia";
//echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{

//  $diariego = array();
  $di = array();

      //$data[]=array("id_prod_serv"=>$id_fundo,"nombre_ps"=>$nombrefundo);
$cuenta=0;
$acumula=0;
$nda='';
$nfn='';
   foreach ($query->result() as $row)
   {
      $diax=$row->dia;
      $mesx=$row->mes;
      $aniox=$row->anio;
      $originalDate = $aniox."-".$mesx."-".$diax;
      $newDate = date("d-m-Y", strtotime($originalDate));
      $nf=$row->nombrefundo;
      if($nf<>$nfn){ $j=0; };
      $rm=$row->riegomin;
      if(($newDate==$nda) or ($nda=='')) { 
                  if($nda==''){
                  $acumula=$rm+$acumula;
                   $dataxx[$j]=array("fecha"=>$newDate,"minutos"=>$acumula);

                  } else {
                  $acumula=$rm+$acumula;
                                   //  $dataxx[$j]=array("fecha"=>$newDate,"minutos"=>$acumula);

                  }
        
//                      $dataxx[$j]=null;
       $j++;

      } 
      else 
      {
        $acumula=0;
        $acumula=$rm+$acumula;
           //   $dataxx[$nf]=$nf;
        $dataxx[$j]=array("fecha"=>$newDate,"minutos"=>$acumula);


      }
                   
$funx["$nf"]=$dataxx;
$nn["$nf"]["$newDate"]= $acumula;

      $nda=$newDate;
      $nfn=$nf;
}
$js='{"fundogeneral":'.json_encode($funx).'}';


return $js;


} else {

  echo "no";
}

   }


public function listar_fundos()
   {
   $this->db->select(' a.id_fundo, a.nombrefundo, a.caracteristica, a.area, a.latitud, a.longitud');
    $this->db->from('tp_fundos a'); 
//        $this->db->where('a.id_padre ='.$id);
  
        $this->db->order_by('a.id_fundo');   
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

   public function detalle_fundo($if)
   {
   $this->db->select(' a.id_fundo, a.nombrefundo, a.caracteristica, a.area, a.latitud, a.longitud');
    $this->db->from('tp_fundos a'); 
        $this->db->where('a.id_fundo ='.$if);
  
        $this->db->order_by('a.id_fundo');   
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
      public function inserta_fundo()
   {
/*$sql = "INSERT INTO tm_items (cod_factura,cod_cliente, cod_empresa, cod_articulo, detalle,observaciones, cantidad, precio, descuento, total) 
        VALUES (".$this->input->post('txt_cod_factura').",0,0,".$this->input->post('txt_articulo').",'".$this->input->post('txt_item')."','".
          $this->input->post('txt_observaciones')."',".$this->input->post('txt_cantidad').",".$this->input->post('txt_precio').",".
          $this->input->post('txt_descuento').",".$this->input->post('txt_total_item').")";*/
$sql="INSERT INTO tp_fundos(
             nombrefundo, caracteristica, area)
    VALUES ('".$this->input->post('nom')."','".$this->input->post('car')."','".$this->input->post('are')."');";
$this->db->query($sql);

   }



public function listar_sectores($id_fundo)
   {
   $this->db->select('  b.id_sector,  b.numero_sector,   b.nombre_sector,   a.id_fundo');
    $this->db->from('tm_fundo_sector a'); 
        $this->db->from('tm_sector b'); 

        $this->db->where('b.id_sector = a.id_sector');
          $this->db->where('a.id_fundo',$id_fundo);

//        $this->db->order_by('a.id_fundo');   
        $query = $this->db->get();

    if($query->num_rows()!=0){
  
        foreach($query->result() as $fila){

           $data[] = $fila;
      /*             echo '<pre>';
   print_r($data);
echo '</pre>';  */

        }
        
        return $data;
    }
    else{
     return False;
    }

   }

public function listar_sectores_sa($id_fundo) /* Listar sectores sin asignar */
   {
   $this->db->select('   b.id_sector,   b.numero_sector,   b.nombre_sector');
    $this->db->from('public.tm_sector b'); 

        $this->db->where('b.id_sector not in ( select a.id_sector from  public.tm_fundo_sector a where a.id_fundo='.$id_fundo.')');
//          $this->db->where('a.id_fundos',$id_fundo);

//        $this->db->order_by('a.id_fundo');   
        $query = $this->db->get();

    if($query->num_rows()!=0){
  
        foreach($query->result() as $fila){

           $data[] = $fila;
      /*             echo '<pre>';
   print_r($data);
echo '</pre>';  */

        }
        
        return $data;
    }
    else{
     return False;
    }

   }

public function asigna_sectores() /* Listar sectores sin asignar */
   {
$ifundo=$this->input->post('ifundo');

$misa=$this->input->post('missectoresa');


 // echo "separa ".$i." ".$aaa ;
//echo $aaa." ";
for ($z=0;$z<count($misa);$z++) { 

   echo $misa[$z];
   $this->db->select('    id_fundo, id_sector');
    $this->db->from('tm_fundo_sector'); 
          $this->db->where('id_fundo',$ifundo);
          $this->db->where('id_sector',$misa[$z]);

        $query = $this->db->get();

    if($query->num_rows()!=0){
  

} 

  }
$missa=$this->input->post('missectoressa');
for ($z=0;$z<count($missa);$z++) { 

  echo $missa[$z];

  $sql="INSERT INTO tm_fundo_sector(
             id_fundo, id_sector)
    VALUES ('".$ifundo."','".$missa[$z]."');";
$this->db->query($sql);


  }

   }
public function desasigna_sectores() /* Listar sectores sin asignar */
   {
$ifundo=$this->input->post('ifundo');

$misa=$this->input->post('missectoresa');


 // echo "separa ".$i." ".$aaa ;
//echo $aaa." ";
for ($z=0;$z<count($misa);$z++) { 

   echo $misa[$z];
   $this->db->select('    id_fundo, id_sector');
    $this->db->from('tm_fundo_sector'); 
          $this->db->where('id_fundo',$ifundo);
          $this->db->where('id_sector',$misa[$z]);

        $query = $this->db->get();

    if($query->num_rows()!=0){
  

} 

  }
$misa=$this->input->post('missectoresa');
for ($z=0;$z<count($misa);$z++) { 

  echo $misa[$z];

  $sql="DELETE from  tm_fundo_sector where 
             id_fundo='".$ifundo."' and  id_sector='".$misa[$z]."'";

             echo $sql;
    $this->db->query($sql);


  }

   }
public function asigna_valvulas() /* Listar sectores sin asignar */
   {
$ifundo=$this->input->post('ifundov');
$isector=$this->input->post('isectorv');

$misa=$this->input->post('misvalvulasa');


$missa=$this->input->post('misvalvulassa');
for ($z=0;$z<count($missa);$z++) { 

  echo $missa[$z];

  $sql="INSERT INTO tm_sector_valvula(
             id_fundo, id_valvula,id_sector)
    VALUES ('".$ifundo."','".$missa[$z]."','".$isector."');";
    echo $sql;                                     
$this->db->query($sql);


  }

   }
public function desasigna_valvulas() /* Listar sectores sin asignar */
   {
$ifundo=$this->input->post('ifundov');
$isector=$this->input->post('isectorv');

$misa=$this->input->post('misvalvulasa');


 // echo "separa ".$i." ".$aaa ;
//echo $aaa." ";

//$misa=$this->input->post('missectoresa');
for ($z=0;$z<count($misa);$z++) { 

  echo $misa[$z];

  $sql="DELETE from  tm_sector_valvula where 
             id_fundo='".$ifundo."'and id_sector='".$isector."' and  id_valvula='".$misa[$z]."'";

             echo $sql;
    $this->db->query($sql);


  }

   }

public function listar_valvulas($id_fundo,$id_sector)
   {
   $this->db->select('  b.id_valvula,  b.nombrevalvula,  a.id_sector,a.id_fundo');
    $this->db->from('tm_sector_valvula a'); 
        $this->db->from('tm_valvula b'); 

        $this->db->where('b.id_valvula = a.id_valvula');
          $this->db->where('a.id_fundo',$id_fundo);
          $this->db->where('a.id_sector',$id_sector);


//        $this->db->order_by('a.id_fundo');   
        $query = $this->db->get();

    if($query->num_rows()!=0){
  
        foreach($query->result() as $fila){

           $data[] = $fila;
      /*             echo '<pre>';
   print_r($data);
echo '</pre>';  */

        }
        
        return $data;
    }
    else{
     return False;
    }

   }

public function listar_valvulas_sa($id_fundo,$id_sector)
   {
   $this->db->select('  b.id_valvula,  b.nombrevalvula');
 //   $this->db->from('tm_sector_valvula a'); 
        $this->db->from('tm_valvula b'); 
         //$this->db->where('b.id_valvula = a.id_valvula');
        //$this->db->where(' b.id_valvula not in ( select a.id_valvula from  public.tm_sector_valvula a where a.id_fundo='.$id_fundo.' and a.id_sector='.$id_sector.')');
        $this->db->where('b.id_valvula = b.id_valvula and b.id_valvula not in ( select a.id_valvula from  public.tm_sector_valvula a where a.id_fundo='.$id_fundo.' and a.id_sector='.$id_sector.')');
$this->db->order_by('id_valvula');
/*        $this->db->where('b.id_valvula = a.id_valvula');
          $this->db->where('a.id_fundo',$id_fundo);
          $this->db->where('a.id_sector',$id_sector);
*/

/***/
  /* $this->db->select('   b.id_sector,   b.numero_sector,   b.nombre_sector');
    $this->db->from('public.tm_sector b'); 

        $this->db->where('b.id_sector not in ( select a.id_sector from  public.tm_fundo_sector a where a.id_fundo='.$id_fundo.')');
*/
/***/




//        $this->db->order_by('a.id_fundo');   
        $query = $this->db->get();

    if($query->num_rows()!=0){
  
        foreach($query->result() as $fila){

           $data[] = $fila;
      /*             echo '<pre>';
   print_r($data);
echo '</pre>';  */

        }
        
        return $data;
    }
    else{
     return False;
    }

   }

  public function tracking_flota($idu)
//  public function tracking_flota($unidad,$dia1,$dia2,$idu,$datax)
      {
$misa=$this->input->post('sector1');
$unidades='';
for ($z=0;$z<count($misa);$z++) { 

  //echo $misa[$z];
if($z<(count($misa)-1))
{  $sep=','; } else { $sep='';}
$unidades=$unidades.$misa[$z].$sep;
}
//echo $unidades;
$datax=$this->input->post('fundo1');
$fis=$this->input->post('calendar1');
$ff=$this->input->post('calendar2');

//echo $datax."<br>";
//echo $fis."<br>";
//echo $ff."<br>";



        //echo $dia1;         echo $dia2;

        /** Inicio**/
        
        date_default_timezone_set('America/Lima');
              $hoy=date("Y-m-d",mktime());
            $ayer=date('Y-m-d', strtotime('-1 day'));
            if ($datax=='tm_data_hoy')
            {
              //echo "dia ".$dia1;
       //       $fis=$hoy.' '.$dia1;
          //    echo $fis; echo " <br> ";
         //     $ff=$hoy.' '.$dia2;
            //  echo $ff;
              $fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));
              $ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));

            };
                        if ($datax=='tm_data_ayer')
            {
              //echo "dia ".$dia1;
       //       $fis=$ayer.' '.$dia1;
          //    echo $fis; echo " <br> ";
         //     $ff=$ayer.' '.$dia2;
            //  echo $ff;
              $fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));
              $ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));


            }
            if ($datax=='tm_data_mesactual')
            {
              //echo "dia ".$dia1;
          //    $fis=$dia1;
           //   $fis = date(str_replace("%20"," ",$fis));
$fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));

        //      $fisx=date("Y-m-d H:i:s",strtotime("$fis + 5 Hours"));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
       //                     echo $fis." ";echo $fisx; echo " <br> ";

        //      $ff=$dia2;
           //   echo $ff." <br> ";
          //    $ff = date(str_replace("%20"," ",$ff));
              //$ff = date($ff,(strtotime("+5 Hours")));
   //           $ffx=date("$ff",strtotime("$ff + 5 Hours"));
//                           $ffx=date("Y-m-d H:m:s",strtotime("$ff + 5 Hours"));
$ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
                 //           echo $ff." ";echo $ffx; echo " <br> ";

            //  echo $ff;
            }
                        if ($datax=='tm_data_mespasado')
            {
              //echo "dia ".$dia1;
           //   $fis=$dia1;
            //  $fis = date(str_replace("%20"," ",$fis));
$fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));

        //      $fisx=date("Y-m-d H:i:s",strtotime("$fis + 5 Hours"));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
       //                     echo $fis." ";echo $fisx; echo " <br> ";

        //      $ff=$dia2;
           //   echo $ff." <br> ";
          //    $ff = date(str_replace("%20"," ",$ff));
              //$ff = date($ff,(strtotime("+5 Hours")));
   //           $ffx=date("$ff",strtotime("$ff + 5 Hours"));
//                           $ffx=date("Y-m-d H:m:s",strtotime("$ff + 5 Hours"));
$ff=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($ff)));
            //  $fisx = date($fis,(strtotime("+5 Hours")));
                 //           echo $ff." ";echo $ffx; echo " <br> ";

            //  echo $ff;
            }
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
.distrito as distrito,a.departamento as departamento,a.panico as panico,a.fuel_level as  fuel_level
FROM 
  datos.tm_mobil, 
   datos.tm_usuario_mobil, 
  datos.$datax a, 
  datos.tm_mobil_equipo, 
  datos.tm_equipo, 
  datos.tm_equipo_componente, 
  datos.id_componente
WHERE 
  tm_mobil.id_mobil = a.id_mobil AND
tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
tm_usuario_mobil.id_usuario =  $idu  AND
  tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
  tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  tm_equipo_componente.id_com = id_componente.id_com  and tm_mobil.id_mobil in ($unidades) and estado=1 $filtro order by nombremobil, gps_date desc    ";
//echo $hoy;
//echo $ayer;
 // echo $sql;
$query = $this->db->query($sql);

if ($query->num_rows() > 0)
{
   foreach ($query->result() as $row)
   {
$data[]=$row;
}
} 

return $data;

        /** Fin ***/
        
      }

}