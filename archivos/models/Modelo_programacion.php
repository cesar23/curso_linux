<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_programacion extends CI_Model{ // Begin class model_mantcateg

 
 
public function listar_programacion()
   {

    $sql="SELECT 
  tm_prog_head.id_pro_head,
  tm_prog_head.fecha_programacion, 
  tm_programacion.id_fundo, 
  tm_programacion.fecha_empieza, 
  tm_programacion.tr, 
  tm_programacion.ci, 
  tp_fundos.nombrefundo, 
  tm_prog_head.id_usuario,
  ts_estadoprogramacion.detalle_estado
FROM 
  public.tm_prog_head, 
  public.tm_programacion, 
  public.tp_fundos,
    public.ts_estadoprogramacion
WHERE 
  tm_prog_head.id_pro_head = tm_programacion.id_pro_head AND
  tm_programacion.id_fundo = tp_fundos.id_fundo AND
  tm_prog_head.id_estado=ts_estadoprogramacion.id_estado
 GROUP BY
 tm_prog_head.id_pro_head,
  tm_prog_head.fecha_programacion, 
  tm_programacion.id_fundo, 
  tm_programacion.fecha_empieza, 
  tm_programacion.tr, 
  tm_programacion.ci, 
  tp_fundos.nombrefundo, 
  tm_prog_head.id_usuario,
    ts_estadoprogramacion.detalle_estado


 order by id_pro_head;
";
//echo $sql;
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


        public function resumen_semana3($dia1,$dia2)
   {

$fechaInicio=strtotime("10-09-2013");
$fechaFin=strtotime("17-09-2013");
 
for($i=$fechaInicio; $i<=$fechaFin; $i+=86400){ // Inicio del For de Fechas
    //echo date("Y-m-d", $i);
    $fechita=date("Y-m-d", $i);
/****/
$sqlx="select a.id_fundo,b.nombrefundo,(extract(EPOCH from age(a.final,a.inicio))/60) as riegomin,extract(year from a.inicio) as anio 
,extract(month from a.inicio) as mes,extract(day from a.inicio) as dia
from tm_timer a,tp_fundos b where a.id_fundo=b.id_fundo  and date_trunc('DAY',inicio)='$fechita'
group by a.id_fundo,b.nombrefundo,a.inicio,a.final,anio,mes,dia order by id_fundo,anio,mes,dia";

$sql="SELECT id_fundo, nombrefundo, caracteristica, area, latitud, longitud  FROM tp_fundos order by id_fundo asc";

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
      $if=$row->id_fundo;

      $nf=$row->nombrefundo;
      //if($nf<>$nfn){ $j=0; $acumula=0;};
$sqlx="select a.id_fundo,(extract(EPOCH from age(a.final,a.inicio))/60) as riegomin
from tm_timer a where date_trunc('DAY',inicio)='$fechita' and id_fundo=$if
group by a.id_fundo,a.inicio,a.final order by id_fundo";

$queryx = $this->db->query($sqlx);

if ($queryx->num_rows() > 0)
{

//  $diariego = array();
  
      //$data[]=array("id_prod_serv"=>$id_fundo,"nombre_ps"=>$nombrefundo);
  $acumularm=0;
   foreach ($queryx->result() as $rowx)
   {
          $rmin=$rowx->riegomin;
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


}