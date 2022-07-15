<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_bitacora extends CI_Model{ // Begin class model_mantcateg
	   
  public function listar($ie,$un)
  {

   if ($un>0) {

      $filtro2 = " and tm_empresas.id_empresa=$ie ";
    } else {
      $filtro2 = " ";
    }


    $hoy=date("Y-m-d");

    $sql="
SELECT 
  tm_bitacora.id_bitacora, 
  tm_bitacora.asunto, 
  tm_bitacora.estado, 
  tm_bitacora.fecha_open, 
  tm_bitacora.fecha_update, 
  tm_mobil.nombremobil, 
  tm_mobil.placa, 
  tm_usuarios.usuario, 
  tm_empresas.razonsocial, 
  tm_bitacora.detalle, 
  ts_estadobitacora.descripcion
FROM 
  datos.tm_bitacora, 
  datos.tm_mobil, 
  datos.tm_usuarios, 
  datos.tm_empresas, 
  datos.ts_estadobitacora
WHERE 
  tm_bitacora.id_mobil = tm_mobil.id_mobil AND
  tm_mobil.id_empresa = tm_empresas.id_empresa AND
  tm_usuarios.id_usuario = tm_bitacora.id_usuario AND
  ts_estadobitacora.estado = tm_bitacora.estado $filtro2 
order by id_bitacora desc;

    ";


   // echo $sql;

  // FROM datos.tm_empresas where  estado not in (6) $filtro ;
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


  public function listarbitacora($im)
  {

    if ($im) {

      $filtro = " and tm_bitacora.id_mobil=$im ";
    } else {
      $filtro = " ";
    }

    $hoy=date("Y-m-d");

    $sql="SELECT 
  tm_bitacora.fecha_open, 
  tm_bitacora.id_mobil, 
  tm_bitacora.id_usuario, 
  tm_bitacora.id_bitacora, 
  tm_bitacora.asunto, 
  tm_bitacora.detalle, 
  tm_bitacora.estado, 
  tm_bitacora.fecha_update, 
  tm_usuarios.usuario
FROM 
  datos.tm_bitacora, 
  datos.tm_usuarios
WHERE 
  tm_bitacora.id_usuario = tm_usuarios.id_usuario $filtro  order by id_bitacora desc ;

    ";
//echo $sql;
  // FROM datos.tm_empresas where  estado not in (6) $filtro ;
    $query = $this->db->query($sql);


$row = array();
    if ($query->num_rows() > 0){

        foreach($query->result() as $fila){     
         $data[] = $fila;
       }

       return json_encode($data);
     }
     else{
      $row["detalle"]="No hay Registros";
      $data[] = $row;
      return json_encode($data);
     //  return False;
     }

   }



  public function detallebitacora($ib)
  {

    if ($ib) {

      $filtro = " and tm_bitacora_det.id_bitacora=$ib ";
    } else {
      $filtro = " ";
    }

    $hoy=date("Y-m-d");

    $sql="SELECT 
  tm_bitacora_det.fecha_open, 
  tm_bitacora_det.id_usuario, 
  tm_bitacora_det.id_bitacora, 
  tm_bitacora_det.detalle, 
  tm_usuarios.usuario
FROM 
  datos.tm_bitacora_det, 
  datos.tm_usuarios
WHERE 
  tm_bitacora_det.id_usuario = tm_usuarios.id_usuario $filtro ;

    ";
//echo $sql;
  // FROM datos.tm_empresas where  estado not in (6) $filtro ;
    $query = $this->db->query($sql);



    if ($query->num_rows() > 0){

        foreach($query->result() as $fila){     
         $data[] = $fila;
       }

       return json_encode($data);
     }
     else{
      $row["detalle"]="No hay Registros";
      $data[] = $row;
      return json_encode($data);
     //  return False;
     }

   }
  
  public function detalle_empresa($ic)
  {

    if ($ic) {

      $filtro = " where tm_empresas.id_empresa=$ic ";
    } else {
      $filtro = " ";
    }

    $hoy=date("Y-m-d");

    $sql=" SELECT id_empresa, tipoempresa, ruc, razonsocial, ncomercial, telefono, 
       email, contacto, direccion, estado, fecharegistro, id_empresa_anterior, 
       tipomtc
  FROM datos.tm_empresas $filtro;
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

 
  public function nuevo_registro()
   {


$sql="INSERT INTO datos.tm_bitacora(
             id_usuario, id_mobil,  asunto, detalle
           )
    VALUES ('".$this->input->post('idub')."','".$this->input->post('idmb')."','".$this->input->post('asuntob')."','".$this->input->post('detalleb')."');";


    $query = $this->db->query($sql);
    if($query)
      {
       $idm=$this->input->post('idmb');
        return $idm;
      }
      else
      {
        return false;
      }
   }

  public function edita_registro()
   {
    $sql="update datos.tm_empresas set  razonsocial='".$this->input->post('cam1')."', ncomercial='".$this->input->post('cam2')."', ruc='".$this->input->post('cam3')."',direccion='".$this->input->post('cam4')."',telefono='".$this->input->post('cam5')."',contacto='".$this->input->post('cam6')."',estado='".$this->input->post('list1')."' where id_empresa='".$this->input->post('idr')."'  ";
  




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


     public function borra_registro()
   {
    $sql="delete from  datos.tm_empresas  where   id_empresa='".$this->input->post('idr')."'  ";
  




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
# Detalle Bitacora 
  public function nuevo_detalle_registro()
   {


$sql="INSERT INTO datos.tm_bitacora_det(
             id_usuario, id_bitacora,  asunto, detalle
           )
    VALUES ('".$this->input->post('idubdet')."','".$this->input->post('idb')."','".$this->input->post('asuntob')."','".$this->input->post('detalleb')."');";


    $query = $this->db->query($sql);
    if($query)
      {
       $idm=$this->input->post('idb');
        return $idm;
      }
      else
      {
        return false;
      }
   }

}