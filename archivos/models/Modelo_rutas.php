<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_rutas extends CI_Model{ // Begin class model_mantcateg

public function listar() {

$sql ="SELECT 
  ts_ruta.id_ruta, 
  ts_ruta.nombreruta, 
  ts_ruta.punto1, 
  ts_ruta.punto2, 
  ts_ruta.descr, 
  ts_ruta.id_empresa, 
  a.nombre as puntoi, 
  b.nombre as puntof
FROM 
  datos.ts_ruta, 
  public.tp_fundos a, 
  public.tp_fundos b
WHERE 
  ts_ruta.punto1 = a.id_fundo AND
  ts_ruta.punto2 = b.id_fundo;
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

        public function inserta_ruta()
   {

        $session_data = $this->session->userdata('logged_in');
        $idx = $session_data['id'];
        $ni = $session_data['nivel'];
        $ie = $session_data['ie'];

      //  echo $ie;


$sql="INSERT INTO datos.ts_ruta(nombreruta, punto1, punto2,id_empresa)
    VALUES ('".$this->input->post('detalleruta')."','".$this->input->post('inicioruta')."','".$this->input->post('finruta')."','".$ie."');";
$resulta=$this->db->query($sql); 
$idr=$this->db->insert_id();

$sql="INSERT INTO datos.ts_rutadetalle(
            id_ruta, id_fundo, tipo, orden)
    VALUES ('".$idr."','".$this->input->post('inicioruta')."','1','0');";
$this->db->query($sql); 

$sql="INSERT INTO datos.ts_rutadetalle(
            id_ruta, id_fundo, tipo, orden)
    VALUES ('".$idr."','".$this->input->post('finruta')."','3','0');";
$this->db->query($sql); 

return $idr;
{

}

   }


public function asignapuntos() /* Listar sectores sin asignar */
   {
$idr=$this->input->post('idruta');
//$isector=$this->input->post('isectorv');

$misa=$this->input->post('mispuntosas');


$missa=$this->input->post('mispuntossa');
for ($z=0;$z<count($missa);$z++) { 

  echo $missa[$z];

$sql="INSERT INTO datos.ts_rutadetalle(
            id_ruta, id_fundo, tipo)
    VALUES ('".$idr."','".$missa[$z]."','2');";
$this->db->query($sql); 




  }

   }
public function desasignapuntos() /* Listar sectores sin asignar */
   {
$idr=$this->input->post('idruta');


$misa=$this->input->post('mispuntosas');


 // echo "separa ".$i." ".$aaa ;
//echo $aaa." ";

//$misa=$this->input->post('missectoresa');
for ($z=0;$z<count($misa);$z++) { 

  echo $misa[$z];

  $sql="DELETE from  datos.ts_rutadetalle where 
             id_ruta='".$idr."' and  id_fundo='".$misa[$z]."'";

             //echo $sql;
    $this->db->query($sql);

  }

   }
   public function ordena() {
//$updateRecordsArray   = $_POST['recordsArray'];
$updateRecordsArray=$this->input->post('recordsArray');
 $listingCounter=0;
foreach ($updateRecordsArray as $recordIDValue) {
    
echo $recordIDValue;
$sql="UPDATE datos.ts_rutadetalle SET reorden='".$listingCounter."'  WHERE orden='".$recordIDValue."'";
$this->db->query($sql);
$listingCounter++;

   /* $query = "UPDATE records SET recordListingID = " . $listingCounter . " WHERE recordID = " . $recordIDValue;
    mysql_query($query) or die('Error, insert query failed');
    $listingCounter = $listingCounter + 1;   */
  }


   }


public function recupera($ir) {

$sql ="SELECT 
  ts_ruta.id_ruta, 
  ts_ruta.nombreruta, 
  ts_ruta.punto1, 
  ts_ruta.punto2, 
  ts_ruta.descr, 
  ts_ruta.id_empresa, 
  a.nombre as puntoi, 
  b.nombre as puntof
FROM 
  datos.ts_ruta, 
  public.tp_fundos a, 
  public.tp_fundos b
WHERE 
  ts_ruta.punto1 = a.id_fundo AND
  ts_ruta.punto2 = b.id_fundo AND ts_ruta.id_ruta=$ir;
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


/****** FUNCIONES QUE NO USAMOS ***/     

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



}