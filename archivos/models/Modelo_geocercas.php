<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_geocercas extends CI_Model{ // Begin class model_mantcateg
     
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
public function listar_geocercas($nivel,$ie)
   {
if ($nivel==0) {
$filtro='';
} else 
{
$filtro=" and  a.id_empresa=$ie ";
}

$sql="select a.id_fundo,a.id_empresa,a.nombre,a.descripcion, a.googlemaps as google, a.area, a.latitud, a.longitud, b.detalle as tipogeocerca, c.ncomercial as empresa
from tp_fundos a,datos.ts_tipogeocerca b, datos.tm_empresas c where a.id_empresa=c.id_empresa and  a.id_tipogeo=b.id_tipogeo  $filtro
order by a.id_fundo";
//echo $sql;
$query = $this->db->query($sql);

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

  public function listar_geo_ruta_sa($nivel,$ie,$ir)
   {
if ($nivel==0) {
$filtro=" where a.estado=0 ";
} else 
{
$filtro=" where a.estado=0 and a.id_empresa=$ie ";
}

$sql="select a.id_fundo,a.id_empresa,a.nombre,a.descripcion, a.nombrefundo, a.caracteristica,a.googlemaps as google, a.area, a.latitud, a.longitud
from tp_fundos a $filtro and  a.id_fundo not in (select id_fundo from  datos.ts_rutadetalle where id_ruta=$ir)
order by a.id_fundo";
//echo $sql;
$query = $this->db->query($sql);

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
 public function listar_geo_ruta_as($nivel,$ie,$ir)
   {
if ($nivel==0) {
$filtro='';
} else 
{
$filtro=" where a.id_empresa=$ie ";
}

$sql="SELECT 
  ts_rutadetalle.id_ruta, 
  ts_rutadetalle.id_fundo, 
  ts_rutadetalle.tipo, 
  ts_rutadetalle.orden, 
  tp_fundos.nombre, 
  tp_fundos.latitud, 
  tp_fundos.longitud
FROM 
  datos.ts_rutadetalle, 
  public.tp_fundos
WHERE 
  ts_rutadetalle.id_fundo = tp_fundos.id_fundo and ts_rutadetalle.id_ruta=$ir order by ts_rutadetalle.tipo,ts_rutadetalle.reorden,ts_rutadetalle.orden;";
//echo $sql;
$query = $this->db->query($sql);

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
   public function listar_geocerca($id)
   {
  
  $sql="SELECT  a.id_fundo,a.id_empresa, a.nombre,a.descripcion,a.nombrefundo, a.caracteristica,a.googlemaps as google, a.area, a.latitud, a.longitud, a.id_tipogeo, a.mv, a.tp 
FROM tp_fundos a
WHERE a.id_fundo=$id order by a.id_fundo";
  
        $query = $this->db->query($sql);
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
      public function inserta_geocerca()
   {

$nvert= strlen($this->input->post('vertices'));
echo $nvert;
$nver1=$nvert-2;
$nver=substr($this->input->post('vertices'), 1,$nver1);
  echo $nver;


$sql="INSERT INTO puntos_control(
             pc_nombre, pc_fecha,  puntos_gmap)
    VALUES ('".$this->input->post('ngeocerca')."',now(),'".$this->input->post('vertices')."');";
    echo $sql;
    $this->db->query($sql);

   }

      public function edita_fundo()
   {
$sql="UPDATE tp_fundos SET nombrefundo='".$this->input->post('nfe')."', caracteristica='".$this->input->post('care')."', area='".$this->input->post('aree')."'  WHERE id_fundo='".$this->input->post('id_fundoe')."'";

//echo $sql;
$this->db->query($sql);

   }

      public function borra_fundo()
   {

$sql="delete from tp_fundos where id_fundo=".$this->input->post('id_fundoe');

echo $sql;
$this->db->query($sql);

   }



         public function inserta_fundog()
   {
$postgis=$this->input->post('googlef');
$postgis=str_replace("),(",");(",$postgis);
//echo $postgis;
$puntos=explode(';',$postgis);
$nropuntos=count($puntos);
echo $nropuntos;
$coordenadas="";
for($x=0;$x<$nropuntos;$x++) {
    $longpg=strlen($puntos[$x]);
  $longf=$longpg-2;
  $cade=substr($puntos[$x], 1,$longf);

    $coord=explode(', ',$cade);
    $coordenadas=$coordenadas.$coord[1]." ".$coord[0].",";
     $nropu=$nropuntos-1;
     if($x==0) {
  $coori=$coord[1];
  $coorf=$coord[0];  
  }

}
$postgisf="ST_GeomFromText(' MULTIPOLYGON(((".$coordenadas.$coori." ".$coorf.")))',4326)";

$sql="INSERT INTO tp_fundos(
             nombre, descripcion,id_tipogeo,id_empresa,mv,tp, area,geom,latitud,longitud,googlemaps)
    VALUES ('".$this->input->post('nom')."','".$this->input->post('car')."','".$this->input->post('tipog')."','".$this->input->post('ieg')."','".$this->input->post('mv')."','".$this->input->post('tp')."','".$this->input->post('are')."',".$postgisf.",'".$coorf."','".$coori."','".$this->input->post('googlef')."');";
  //  echo $sql;
$this->db->query($sql);

   } 

         public function edita_fundog()
   {
$postgis=$this->input->post('googlef');
$postgis=str_replace("),(",");(",$postgis);
//echo $postgis;
$puntos=explode(';',$postgis);
$nropuntos=count($puntos);
echo $nropuntos;
$coordenadas="";
for($x=0;$x<$nropuntos;$x++) {
    $longpg=strlen($puntos[$x]);
  $longf=$longpg-2;
  $cade=substr($puntos[$x], 1,$longf);

    $coord=explode(', ',$cade);
    $coordenadas=$coordenadas.$coord[1]." ".$coord[0].",";
     $nropu=$nropuntos-1;
     if($x==0) {
  $coori=$coord[1];
  $coorf=$coord[0];  
  }

}
$postgisf="ST_GeomFromText(' MULTIPOLYGON(((".$coordenadas.$coori." ".$coorf.")))',4326)";

$sql="UPDATE tp_fundos SET nombre='".$this->input->post('nom')."', descripcion='".$this->input->post('car')."', area='".$this->input->post('are')."', geom=".$postgisf.", latitud='".$coorf."', longitud='".$coori."',googlemaps='".$this->input->post('googlef')."'  WHERE id_fundo='".$this->input->post('idg')."'";
echo $sql;
$this->db->query($sql);

   }  

}