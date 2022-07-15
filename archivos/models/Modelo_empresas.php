<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_empresas extends CI_Model{ // Begin class model_mantcateg
	   
  public function listar_empresas($ie,$un)
  {

    if (($ie) and($un>0)) {

      $filtro = " and tm_empresas.id_empresa=$ie ";
    } else {
      $filtro = " ";
    }

    $hoy=date("Y-m-d");

    $sql="SELECT id_empresa, tipoempresa, ruc, razonsocial, ncomercial, telefono, 
       email, contacto, direccion, estado, fecharegistro, id_empresa_anterior, 
       tipomtc
  FROM datos.tm_empresas where estado not in (6) $filtro ;
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
       return False;
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
    $sqlxxx="INSERT INTO datos.tm_contactos(
            nombres, apellidop, celular,correo,dni,cargo,id_empresa)
    VALUES ('".$this->input->post('nombrec')."','".$this->input->post('apellidoc')."','".$this->input->post('telefonoc')."','".$this->input->post('emailc')."','".$this->input->post('dnic')."','".$this->input->post('cargoc')."',1);
";

$sql="INSERT INTO datos.tm_empresas(
             tipoempresa, ruc, razonsocial, ncomercial, telefono,contacto, direccion,estado)
    VALUES (3, '".$this->input->post('cam3')."', '".$this->input->post('cam1')."', '".$this->input->post('cam2')."', '".$this->input->post('cam5')."', '".$this->input->post('cam6')."', '".$this->input->post('cam4')."',1);";

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

}