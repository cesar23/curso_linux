<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_serviciostecnicos extends CI_Model{ // Begin class model_mantcateg
	   
  public function listar($ie,$un)
  {

    /*if ($ie) {

      $filtro = " and tm_empresas.id_empresa=$ie ";
    } else {
      $filtro = " ";
    }
*/
    if ($un>0) {

      $filtro2 = " and tm_empresas.id_empresa=$ie ";
    } else {
      $filtro2 = " ";
    }

    $hoy=date("Y-m-d");

    $sql="SELECT 
  tm_ordenestrabajo.id_ot, 
  ts_estadoot.detalle, 
  ts_tipoorden.requerimiento, 
  tm_ordenestrabajo.fecharegistro, 
  tm_ordenestrabajo.fechaservicio, 
  tm_empresas.razonsocial, 
  tm_mobil.nombremobil, 
  tm_mobil.placa, 
  tm_ordenestrabajo.situacion, 
  tm_ordenestrabajo.id_usuario, 
  tm_ordenestrabajo.id_tecnico, 
  tm_ordenestrabajo.fat, 
  tm_ordenestrabajo.horainicio, 
  tm_ordenestrabajo.horafinal, 
  tm_ordenestrabajo.direccion, 
  tm_ordenestrabajo.detalletecnico, 
  tm_ordenestrabajo.detallecliente, 
  tm_ordenestrabajo.vb,
  tm_personalgsp.nombres,
  tm_personalgsp.apellidop
FROM 
  datos.tm_ordenestrabajo, 
  datos.ts_estadoot, 
  datos.ts_tipoorden, 
  datos.tm_empresas, 
  datos.tm_mobil,
  datos.tm_personalgsp
WHERE 
tm_personalgsp.id_personal = tm_ordenestrabajo.id_tecnico AND 
  tm_ordenestrabajo.id_mobil = tm_mobil.id_mobil AND
  ts_estadoot.estado_ot = tm_ordenestrabajo.estado_ot AND
  ts_tipoorden.tipoot = tm_ordenestrabajo.tipoot AND
  tm_empresas.id_empresa = tm_ordenestrabajo.id_empresa $filtro2;";

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

  
  public function detalle_registro($ic)
  {

    if ($ic) {

      $filtro = " and tm_ordenestrabajo.id_ot=$ic ";
    } else {
      $filtro = " ";
    }

    $hoy=date("Y-m-d");

    $sql=" SELECT 
  tm_ordenestrabajo.id_ot, 
  tm_ordenestrabajo.id_mobil,
  ts_estadoot.detalle, 
  ts_tipoorden.requerimiento, 
  tm_ordenestrabajo.fecharegistro, 
  to_char( tm_ordenestrabajo.fechaservicio,'DD/MM/YYYY') as fechaservicio, 
  tm_empresas.razonsocial, 
  tm_mobil.nombremobil, 
  tm_mobil.placa, 
  tm_ordenestrabajo.situacion, 
  tm_ordenestrabajo.id_usuario, 
  tm_ordenestrabajo.id_tecnico, 
  tm_ordenestrabajo.fat, 
  tm_ordenestrabajo.horainicio, 
  tm_ordenestrabajo.horafinal, 
  tm_ordenestrabajo.direccion, 
  tm_ordenestrabajo.detalletecnico, 
  tm_ordenestrabajo.detallecliente, 
  tm_ordenestrabajo.vb,
   tm_ordenestrabajo.id_empresa,
    tm_ordenestrabajo.tipoot,
     tm_ordenestrabajo.id_bitacora,
     tm_ordenestrabajo.estado_ot,
     tm_ordenestrabajo.contacto
FROM 
  datos.tm_ordenestrabajo, 
  datos.ts_estadoot, 
  datos.ts_tipoorden, 
  datos.tm_empresas, 
  datos.tm_mobil
WHERE 
  tm_ordenestrabajo.id_mobil = tm_mobil.id_mobil AND
  ts_estadoot.estado_ot = tm_ordenestrabajo.estado_ot AND
  ts_tipoorden.tipoot = tm_ordenestrabajo.tipoot AND
  tm_empresas.id_empresa = tm_ordenestrabajo.id_empresa  $filtro;
    ";

    $query = $this->db->query($sql);
    if ($query->num_rows() > 0)  {
        
        foreach($query->result() as $fila){

         $data[] = $fila;
       }
       
       return json_encode($data);
     }
     else{
       return False;
     }

   }

 

  public function nuevo_registro($idu)
   {


$sql="INSERT INTO datos.tm_ordenestrabajo(
              estado_ot, tipoot, id_empresa, id_mobil, id_usuario,id_bitacora,situacion,direccion,contacto,fechaservicio,id_tecnico)
    VALUES ('".$this->input->post('estadoot')."', '".$this->input->post('tipoot')."', '".$this->input->post('listaempresas')."', '".$this->input->post('lista1')."', '".$idu."',".$this->input->post('lista3').",'".$this->input->post('comment')."', '".$this->input->post('cam1')."', '".$this->input->post('cam2')."', to_date('".$this->input->post('fecha_contrato')."','DD/MM/YYYY'), '".$this->input->post('lista2')."');";

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


    $sql="update datos.tm_ordenestrabajo set  estado_ot='".$this->input->post('estadoot')."', tipoot='".$this->input->post('tipoot')."', id_empresa='".$this->input->post('listaempresas')."',id_mobil='".$this->input->post('lista1')."',id_bitacora='".$this->input->post('lista3')."',situacion='".$this->input->post('comment')."',direccion='".$this->input->post('cam1')."',contacto='".$this->input->post('cam2')."',fechaservicio=to_date('".$this->input->post('fecha_contrato')."','DD/MM/YYYY'),id_tecnico='".$this->input->post('lista2')."' where id_ot='".$this->input->post('idr')."'  ";
  




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
    $sql="update datos.tm_ordenestrabajo set  estado_ot=6  where   id_ot='".$this->input->post('idr')."'  ";
  




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

     public function estadounidad()
  {




    $sql=" SELECT estado, detalle
  FROM datos.ts_estadomovil;

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

   public function estadoot()
  {

    $sql=" SELECT estado_ot, detalle
  FROM datos.ts_estadoot; ";

    $query = $this->db->query($sql);


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

      public function tipoot()
  {

    $sql=" SELECT tipoot, requerimiento
  FROM datos.ts_tipoorden; ";

    $query = $this->db->query($sql);


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

      public function tecnicos()
  {

    $sql=" SELECT id_personal, nombres, apellidop, apellidom, dni, telefono1, telefono2, 
       celular, correo, cargo, area, detalles
  FROM datos.tm_personalgsp;
 ";

    $query = $this->db->query($sql);


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


}