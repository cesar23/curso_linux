<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_tracking extends CI_Model{ // Begin class model_mantcateg

public function f_min($fi,$fa) // Obtiene fecha minima 
{
    if($fa<=$fi)
    {
    return $fa;
    } else {
    return $fi;
    }
}
public function f_max($fi,$fa) // Obtiene fecha maxima 
{ 
    if($fa>=$fi)
    {
    return $fa;
    } else {
    return $fi;
    }
}
 
 public function tiempo_segundos($segundos){ // Devuelve los tiempos en horas minutos y segundos 
$minutos=$segundos/60;
$horas=floor($minutos/60);
$minutos2=$minutos%60;
$segundos_2=$segundos%60%60%60;
    if($minutos2<10)$minutos2='0'.$minutos2;
    if($segundos_2<10)$segundos_2='0'.$segundos_2;
    if($segundos<60){ /* segundos */
    $resultado= round($segundos).' Segundos';
    }elseif($segundos>60 && $segundos<3600){/* minutos */
    $resultado= $minutos2.':'.$segundos_2.' Minutos';
    }else{/* horas */
    $resultado= $horas.':'.$minutos2.':'.$segundos_2.' Horas';
    }
return $resultado;
} 


  public function tracking_unidadx($unidad,$dia1,$finicio,$dia2,$idu,$dataxx,$limitex)
  {


    $datax='tm_data_hoy';
    /** Inicio**/
    date_default_timezone_set('America/Lima');
    $hoy=date("Y-m-d",time());
    $hoy=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($hoy)));
    $ayer=date('Y-m-d', strtotime('-1 day'));
    $dia2=date('Y-m-d', strtotime('+1 day',strtotime($hoy)));
    $dia2=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($dia2)));

if ($dataxx=='null') {
//console.log('noexiste');
    if (($dia1>$hoy) and ($dia1<$dia2)) {
      $datax='tm_data_hoy';
      $limite = " limit $limitex";

    }
    else {
        //$datax='tm_data_mesactual';
              // $limite = " limit 1000";
      $datax='tm_data_hoy';
     $limite = " limit $limitex";
   }

} else {
 // console.log('si existe');
  $datax=$dataxx;
       $limite = " limit 2000";
}



   $sql= "SELECT 
   tm_mobil.id_mobil as id_mobil, 
   tm_mobil.nombremobil as nombremobil, 
   tm_mobil.placa as placa, 
   tm_mobil.estado as estado ,
   tm_mobil.tipo_vehiculo as tipovehiculo,
   tm_equipo.id_equipo as id_equipo , 
   id_componente.tipoc ,
   dt.lat_dd as latitud, 
   dt.long_dd as longitud,
   dt.gps_date - CAST('5 hour' AS INTERVAL) as Fecha,
   (dt.speed*1.852)::int as speed,
   dt.course,
   dt.ubica as ubica, 
   dt.provincia as provincia,
   dt.distrito as distrito,
   dt.departamento as departamento,
   dt.panico as panico,
   dt.fuel_level as  fuel_level,
   dt.punto_control as  pc,
   ts_tipotx.detalle as ttx
   FROM 
   datos.tm_mobil, 
   datos.tm_usuario_mobil, 
   datos.$datax  dt, 
   datos.tm_mobil_equipo, 
   datos.tm_equipo, 
   datos.tm_equipo_componente, 
   datos.id_componente,
   datos.ts_tipotx
   WHERE 
   ts_tipotx.tipotx=dt.tipotx and 
   tm_mobil.id_mobil = dt.id_mobil AND
   tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
   tm_usuario_mobil.id_usuario =  $idu  AND
   tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
   tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
   tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
   tm_equipo_componente.id_com = id_componente.id_com  and tm_mobil.id_mobil=$unidad and estado=1 order by gps_date desc  $limite ";

   // echo $sql;
   $cont=0;
   $periodos=0;
   $sw=0;
   $query = $this->db->query($sql);
   ?>

   <?php
   if ($query->num_rows() > 0)
   {
     foreach ($query->result() as $row)
     {
   //   echo $cont."\n";
      $data[]=$row;
     /**** Inicio Funcion Bucle ****/
$lt[$cont]=$row->latitud;
$lg[$cont]=$row->longitud;
$vel[$cont]=$row->speed;
$velocidad=$vel[$cont];
$fecha=$row->fecha;
$ubix=$row->ubica;
$dis=$row->distrito;
$depa=$row->departamento;
// echo $ubix;
        if ($cont>0){
$distanciapunto=sqrt(pow(($lt[$cont]-$lt[$cont-1]),2)+pow(($lg[$cont]-$lg[$cont-1]),2))*115;
$row->distancia=number_format($distanciapunto,2);

        $conts=$cont+(-1);
                if(($vel[$cont]>0) and ($vel[$conts]==0))
                {
                $sw=1;
                $periodos++;
                }
                        if(($vel[$cont]==0) and ($vel[$conts]>0))
                {
                $sw=1;
                $periodos++;
                }

        } else {
          $distanciapunto=0.00;
$row->distancia=$distanciapunto;
        }

        if ($cont==0 or $sw==1) {
                // echo $cont."\n";
          $nroregistro["$periodos"]=$cont;
          $ubicx["$periodos"]=$ubix;
          $distri["$periodos"]=$dis;
          $depax["$periodos"]=$depa;
         $contador["$periodos"]=1;
         $i_periodo["$periodos"]["0"]=$fecha;
         $f_periodo["$periodos"]["1"]=$fecha;
         $f_mi=$i_periodo["$periodos"]["0"];
         $f_ma=$f_periodo["$periodos"]["1"];
         $velo[$periodos]=$velocidad;

            $diagps=substr($f_mi,8,2);
            $mesgps=substr($f_mi,5,2);
            $aniogps=substr($f_mi,0,4);
            $horagps=substr($f_mi,11,2);
            $minugps=substr($f_mi,14,2);
            $segugps=substr($f_mi,17,2);
            $timestamp1 = time($horagps,$minugps,$segugps,$mesgps,$diagps,$aniogps);
            $diagpsx=substr($f_ma,8,2);
            $mesgpsx=substr($f_ma,5,2);
            $aniogpsx=substr($f_ma,0,4);
            $horagpsx=substr($f_ma,11,2);
            $minugpsx=substr($f_ma,14,2);
            $segugpsx=substr($f_ma,17,2);
            $timestamp1x = time($horagpsx,$minugpsx,$segugpsx,$mesgpsx,$diagpsx,$aniogpsx);
            $di_t=$timestamp1x-$timestamp1;
//echo $f_mi." ".$f_ma." ";   
$segundos[$periodos]=$di_t;
$tiempo[$periodos]=$this->modelo_tracking->tiempo_segundos($di_t);








         $sw=0;
       } else  {
        $contador["$periodos"]++;

                  $i_periodo["$periodos"]["0"]=$this->modelo_tracking->f_min($i_periodo["$periodos"]["0"],$fecha);     
                  $i_periodo["$periodos"]["1"]=$this->modelo_tracking->f_max($f_periodo["$periodos"]["1"],$fecha);    
                           $f_mi=$i_periodo["$periodos"]["0"];
         $f_ma=$f_periodo["$periodos"]["1"];
                  $velo[$periodos]=$velocidad+$velo[$periodos];



            $diagps=substr($f_mi,8,2);
            $mesgps=substr($f_mi,5,2);
            $aniogps=substr($f_mi,0,4);
            $horagps=substr($f_mi,11,2);
            $minugps=substr($f_mi,14,2);
            $segugps=substr($f_mi,17,2);
            $timestamp1 = time($horagps,$minugps,$segugps,$mesgps,$diagps,$aniogps);
            $diagpsx=substr($f_ma,8,2);
            $mesgpsx=substr($f_ma,5,2);
            $aniogpsx=substr($f_ma,0,4);
            $horagpsx=substr($f_ma,11,2);
            $minugpsx=substr($f_ma,14,2);
            $segugpsx=substr($f_ma,17,2);
            $timestamp1x = time($horagpsx,$minugpsx,$segugpsx,$mesgpsx,$diagpsx,$aniogpsx);
            $di_t=$timestamp1x-$timestamp1;
//echo $f_mi." ".$f_ma." ";   
$segundos[$periodos]=$di_t;
               $tiempo[$periodos]=$this->modelo_tracking->tiempo_segundos($di_t);
            
            //$f_periodo["$periodos"]["1"]=f_max($f_periodo["$periodos"]["1"],$fecha);   
      }

//echo 'x'.$periodos.'x';
       
           /**** Fin Funcion Bucle ****/
           $cont++;

    }
  } 
// $grupos[]='';

for($cont=0;$cont<=$periodos;$cont++) {  


      // $datag[]=$grupos;
  $promvelo=$velo[$cont]/$contador[$cont];
      $datap[] = array(
"nroreg" => $nroregistro[$cont],
"inicio" => $i_periodo[$cont]["0"],
"final" => $f_periodo[$cont]["1"],
"segundos"=>$segundos[$cont],
"tiempo"=>$tiempo[$cont],
"nrotx"=>$contador[$cont],
"promvel"=>$promvelo,
"ubica"=>$ubicx[$cont],
"distrito"=>$distri[$cont],
"departamento"=>$depax[$cont]
);
  //  echo "min ".$i_periodo[$cont]["0"]." ";
  // echo "max ".$f_periodo[$cont]["1"]."\n";
  //   echo "sec ".$segundos[$cont]."\n";
  //    echo "tiempo ".$tiempo[$cont]."\n";
  //  echo "vel ".$velo[$cont]."\n";
  //  echo "nro".$contador[$cont]."\n";
  //  $promvelo=$velo[$cont]/$contador[$cont];
  //  echo "promedio ".$promvelo."\n"."\n";
}
  $js='{"ultimatx":'.json_encode($data).',"periodos":'.json_encode($datap).'}';
  //$js='{"ultimatx":'.json_encode($datap).'}';
  return $js;  


}





 public function tracking_unidad($unidad,$dia1,$dia2,$idu,$data)
  {
    $datax='tm_data_mesactual';
    /** Inicio**/
    date_default_timezone_set('America/Lima');
    $hoy=date("Y-m-d",time());
    $hoy=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($hoy)));
    $ayer=date('Y-m-d', strtotime('-1 day'));
    $dia2=date('Y-m-d', strtotime('+1 day',strtotime($hoy)));
    $dia2=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($dia2)));

     //   echo $dia1;    echo $hoy; echo $dia2;

    if (($dia1>$hoy) and ($dia1<$dia2)) {
      $datax='tm_data_hoy';
      $limite = " limit 60";

    }
    else {

              // $datax='tm_data_mesactual';
              // $limite = " limit 1000";
     $datax='tm_data_hoy';
     $limite = " limit 60";
   }

              //echo "dia ".$dia1;
   $fis=$dia1;

   $ff=$dia2;

   $fis=date("Y-m-d H:i:s",strtotime('+5 hour',strtotime($fis)));
   $ff=date("Y-m-d H:i:s",strtotime('+1 day',strtotime($fis)));


   
   $sql= "SELECT 
   tm_mobil.id_mobil as id_mobil, 
   tm_mobil.nombremobil as nombremobil, 
   tm_mobil.placa as placa, 
   tm_mobil.estado as estado ,
   tm_mobil.tipo_vehiculo as tipovehiculo,
   tm_equipo.id_equipo as id_equipo , 
   id_componente.tipoc ,
   dt.lat_dd as latitud, 
   dt.long_dd as longitud,
   dt.gps_date - CAST('5 hour' AS INTERVAL) as Fecha,
   (dt.speed*1.852)::int as speed,
   dt.course,
   dt.ubica as ubica, 
   dt.provincia as provincia,
   dt.distrito as distrito,
   dt.departamento as departamento,
   dt.panico as panico,
   dt.fuel_level as  fuel_level,
   dt.punto_control as  pc
   FROM 
   datos.tm_mobil, 
   datos.tm_usuario_mobil, 
   datos.$datax  dt, 
   datos.tm_mobil_equipo, 
   datos.tm_equipo, 
   datos.tm_equipo_componente, 
   datos.id_componente
   WHERE 
   tm_mobil.id_mobil = dt.id_mobil AND
   tm_mobil.id_mobil = tm_usuario_mobil.id_mobil AND
   tm_usuario_mobil.id_usuario =  $idu  AND
   tm_mobil.id_mobil = tm_mobil_equipo.id_mobil AND
   tm_equipo.id_equipo = tm_mobil_equipo.id_equipo::int AND
   tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
   tm_equipo_componente.id_com = id_componente.id_com  and tm_mobil.id_mobil=$unidad and estado=1 order by gps_date desc  $limite ";


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














      public function listar_tablas()
   {

   $sql=" SELECT id_mes, nombremes, tabla, to_char(inicio,'DD-MM-YYYY') as inicio,inicio as in, final, activo FROM datos.tm_data_hist where activo=1 order by id_mes desc  ; ";

$query = $this->db->query($sql);

  //      $query = $this->db->get();
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
       

}