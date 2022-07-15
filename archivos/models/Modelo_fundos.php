<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_fundos extends CI_Model{ // Begin class model_mantcateg
	   
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

      public function edita_fundo()
   {
$sql="UPDATE tp_fundos SET nombrefundo='".$this->input->post('nfe')."', caracteristica='".$this->input->post('care')."', area='".$this->input->post('aree')."'  WHERE id_fundo='".$this->input->post('id_fundoe')."'";

//echo $sql;
$this->db->query($sql);

   }

      public function borra_fundo()
   {
/*$sql = "INSERT INTO tm_items (cod_factura,cod_cliente, cod_empresa, cod_articulo, detalle,observaciones, cantidad, precio, descuento, total) 
        VALUES (".$this->input->post('txt_cod_factura').",0,0,".$this->input->post('txt_articulo').",'".$this->input->post('txt_item')."','".
          $this->input->post('txt_observaciones')."',".$this->input->post('txt_cantidad').",".$this->input->post('txt_precio').",".
          $this->input->post('txt_descuento').",".$this->input->post('txt_total_item').")";*/
$sql="delete from tp_fundos where id_fundo=".$this->input->post('id_fundob');

//echo $sql;
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

/*
INSERT INTO tm_valvulas_ips(
             id_fundo, id_sector, id_valvula)
    VALUES (?, ?, ?);*/

  $sql="INSERT INTO tm_valvulas_ips(
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
  $sql="DELETE from  tm_valvulas_ips where 
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


        }
        
        return $data;
    }
    else{
     return False;
    }

   }



   public function detalle_valvutar($id_fundo)
   {
      $this->db->select('     tm_valvulas_ips.id_v_ip, tp_fundos.nombrefundo, tm_sector.nombre_sector, tm_valvula.nombrevalvula, tm_valvulas_ips.ip, tm_valvulas_ips.id_puerto');
      $this->db->from(' public.tm_valvulas_ips'); 
      $this->db->from('public.tm_valvula'); 
      $this->db->from('public.tp_fundos'); 
      $this->db->from('public.tm_sector'); 
      $this->db->where('tm_valvula.id_valvula = tm_valvulas_ips.id_valvula');
      $this->db->where('tp_fundos.id_fundo = tm_valvulas_ips.id_fundo');
      $this->db->where('tm_sector.id_sector = tm_valvulas_ips.id_sector');
            $this->db->where('tm_valvulas_ips.id_v_ip',$id_fundo);

      $this->db->order_by('tp_fundos.id_fundo, tm_sector.nombre_sector, tm_valvula.nombrevalvula');   


//        $this->db->order_by('a.id_fundo');   
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

public function listar_valvulas_sa($id_fundo,$id_sector)
   {
        $this->db->select('  b.id_valvula,  b.nombrevalvula');
        $this->db->from('tm_valvula b'); 
        $this->db->where('b.id_valvula = b.id_valvula and b.id_valvula not in ( select a.id_valvula from  public.tm_sector_valvula a where a.id_fundo='.$id_fundo.' and a.id_sector='.$id_sector.')');
        $this->db->order_by('id_valvula');
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
   public function listar_valvutar($id_fundo,$id_sector)
   {
   /* $this->db->select('   tp_fundos.id_fundo,   tp_fundos.nombrefundo,   tm_sector.nombre_sector,   tm_sector.id_sector,   tm_valvula.id_valvula,   tm_valvula.nombrevalvula');
      $this->db->from('public.tp_fundos'); 
      $this->db->from('public.tm_fundo_sector'); 
      $this->db->from('public.tm_sector'); 
      $this->db->from('public.tm_sector_valvula'); 
      $this->db->from('public.tm_valvula'); 
      $this->db->where('tp_fundos.id_fundo = tm_fundo_sector.id_fundo');
      $this->db->where('tm_fundo_sector.id_sector = tm_sector.id_sector');
      $this->db->where('tm_fundo_sector.id_fundo =tm_sector_valvula.id_fundo');
      $this->db->where('tm_fundo_sector.id_sector = tm_sector_valvula.id_sector');
      $this->db->where('tm_sector_valvula.id_valvula = tm_valvula.id_valvula');
      $this->db->order_by('tp_fundos.id_fundo, tm_sector.nombre_sector, tm_valvula.nombrevalvula');   
*/
      $this->db->select('     tm_valvulas_ips.id_v_ip, tp_fundos.nombrefundo, tm_sector.nombre_sector, tm_valvula.nombrevalvula, tm_valvulas_ips.ip, tm_valvulas_ips.id_puerto');
      $this->db->from(' public.tm_valvulas_ips'); 
      $this->db->from('public.tm_valvula'); 
      $this->db->from('public.tp_fundos'); 
      $this->db->from('public.tm_sector'); 
      $this->db->where('tm_valvula.id_valvula = tm_valvulas_ips.id_valvula');
      $this->db->where('tp_fundos.id_fundo = tm_valvulas_ips.id_fundo');
      $this->db->where('tm_sector.id_sector = tm_valvulas_ips.id_sector');
      $this->db->order_by('tp_fundos.id_fundo, tm_sector.nombre_sector, tm_valvula.nombrevalvula');   



        $query = $this->db->get();

    if($query->num_rows()!=0){
  
        foreach($query->result() as $fila){

           $data[] = $fila;


        };
        
        return $data;
    }
    else{
     return False;
    }

   }





public function editarvalvutar() /* Listar sectores sin asignar */
   {
    
$id_v_ipc=$this->input->post('id_v_ipc');
$ipe=$this->input->post('ipe');
$puertoip=$this->input->post('puertoip');
  
/*
$isector=$this->input->post('isectorv');

$misa=$this->input->post('misvalvulasa');


$missa=$this->input->post('misvalvulassa');
*/
$sql="UPDATE tm_valvulas_ips
   SET  ip='".$ipe."', id_puerto='".$puertoip."' 
       
 WHERE id_v_ip='".$id_v_ipc."'";


$this->db->query($sql);


   }





}