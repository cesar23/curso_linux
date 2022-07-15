<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_otros extends CI_Model{ // Begin class model_mantcateg
	   
  public function listar_enviomtc()
  {




    $sql=" SELECT tipoenvio, descripcion
  FROM datos.ts_enviomtc;
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

   public function tipoequipos()
   {

      $sql=" SELECT tipoequipo, descripcion
  FROM datos.ts_tipoequipo; ";
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

      public function tiposim()
   {

      $sql=" SELECT tiposim, descripcion
  FROM datos.ts_tiposim;";
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


   public function estadounidad()
   {

      $sql=" SELECT estado, detalle
      FROM datos.ts_estadomovil;
      ";
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

     public function estadoempresa()
  {




    $sql=" SELECT estado, descripcion
  FROM datos.ts_estadoempresa;   ";


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
  
  public function detalle_contacto($ic)
  {

    if ($ic) {

      $filtro = " and tm_contactos.id_contacto=$ic ";
    } else {
      $filtro = " ";
    }

    $hoy=date("Y-m-d");

    $sql=" SELECT 
    tm_contactos.id_contacto, 
    tm_contactos.nombres, 
    tm_contactos.apellidop, 
    tm_contactos.apellidom, 
    tm_contactos.dni, 
    tm_contactos.telefono1, 
    tm_contactos.telefono2, 
    tm_contactos.celular, 
    tm_contactos.correo, 
    tm_contactos.cargo, 
    tm_contactos.detalles, 
    tm_empresas.id_empresa, 
    tm_empresas.razonsocial, 
    tm_empresas.ncomercial
    FROM 
    datos.tm_empresas, 
    datos.tm_contactos
    WHERE 
    tm_contactos.id_empresa = tm_empresas.id_empresa $filtro;
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

 
  public function nuevo_contacto()
   {
    $sql="INSERT INTO datos.tm_contactos(
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
    $sql="update datos.tm_contactos set  nombres='".$this->input->post('nombrec')."', apellidop='".$this->input->post('apellidoc')."', celular='".$this->input->post('telefonoc')."',correo='".$this->input->post('emailc')."',dni='".$this->input->post('dnic')."',id_empresa='".$this->input->post('listaempresas')."',cargo='".$this->input->post('cargoc')."' where id_contacto='".$this->input->post('idcontacto')."'  ";
  




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
    $sql="delete from  datos.tm_contactos  where   id_contacto='".$this->input->post('idcontacto')."'  ";
  




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