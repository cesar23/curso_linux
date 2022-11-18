<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_conductores extends CI_Model{ // Begin class model_mantcateg
	   
  public function listar($ie,$un)
  {

    if (($ie) and($un>0)) {

      $filtro = " and tm_empresas.id_empresa=$ie ";
    } else {
      $filtro = " ";
    }

    $hoy=date("Y-m-d");

    $sql=" SELECT 
    tm_conductores.id_conductor, 
    tm_conductores.nombres, 
    tm_conductores.apellidop, 
    tm_conductores.apellidom, 
    tm_conductores.dni, 
    tm_conductores.telefono1, 
    tm_conductores.telefono2, 
    tm_conductores.celular, 
    tm_conductores.correo, 
    tm_conductores.cargo, 
    tm_conductores.detalles, 
    tm_empresas.id_empresa, 
    tm_empresas.razonsocial, 
    tm_empresas.ncomercial
    FROM 
    datos.tm_empresas, 
    datos.tm_conductores
    WHERE 
    tm_conductores.id_empresa = tm_empresas.id_empresa $filtro ;
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

  
  public function detalle($ic)
  {

    if ($ic) {

      $filtro = " and tm_conductores.id_conductor=$ic ";
    } else {
      $filtro = " ";
    }

    $hoy=date("Y-m-d");

    $sql=" SELECT 
    tm_conductores.id_conductor, 
    tm_conductores.nombres, 
    tm_conductores.apellidop, 
    tm_conductores.apellidom, 
    tm_conductores.dni, 
    tm_conductores.telefono1, 
    tm_conductores.telefono2, 
    tm_conductores.celular, 
    tm_conductores.correo, 
    tm_conductores.cargo, 
    tm_conductores.detalles, 
    tm_empresas.id_empresa, 
    tm_empresas.razonsocial, 
    tm_empresas.ncomercial
    FROM 
    datos.tm_empresas, 
    datos.tm_conductores
    WHERE 
    tm_conductores.id_empresa = tm_empresas.id_empresa $filtro;
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

 
  public function nuevo()
   {
    $sql="INSERT INTO datos.tm_conductores(
            nombres, apellidop, celular,correo,dni,cargo,id_empresa)
    VALUES ('".$this->input->post('nombrec')."','".$this->input->post('apellidoc')."','".$this->input->post('telefonoc')."','".$this->input->post('emailc')."','".$this->input->post('dnic')."','".$this->input->post('cargoc')."','".$this->input->post('listaempresas')."');
";


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

  public function edita_contacto()
   {
    $sql="update datos.tm_conductores set  nombres='".$this->input->post('nombrec')."', apellidop='".$this->input->post('apellidoc')."', celular='".$this->input->post('telefonoc')."',correo='".$this->input->post('emailc')."',dni='".$this->input->post('dnic')."',id_empresa='".$this->input->post('listaempresas')."',cargo='".$this->input->post('cargoc')."' where id_conductor='".$this->input->post('idcontacto')."'  ";
  

echo $sql;


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


  public function borra_contacto()
   {
    $sql="delete from  datos.tm_conductores  where   id_conductor='".$this->input->post('idcontacto')."'  ";
  




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