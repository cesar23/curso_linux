<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_contactos extends CI_Model{ // Begin class model_mantcateg
	   
  public function listar_contactos($ie,$un)
  {

    if (($ie) and($un>0)) {

      $filtro = " and tm_empresas.id_empresa=$ie ";
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
    tm_contactos.id_empresa = tm_empresas.id_empresa $filtro ;
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

    public function listar_contactosxempresa($ie,$un)
  {

    if (($ie)) {

      $filtro = " and tm_empresas.id_empresa=$ie ";
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
    tm_contactos.id_empresa = tm_empresas.id_empresa $filtro ;
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



     public function list_contactos_unidad_alertas($im)
  {

    if ($im) {

      $filtro = " and tm_contactos_unidad_alertas.id_mobil=$im ";
    } else {
      $filtro = " ";
    }

    $hoy=date("Y-m-d");

    $sql=" SELECT 
  tm_contactos.id_contacto, 
  tm_contactos.nombres, 
  tm_contactos.apellidop, 
  tm_contactos.celular, 
  tm_contactos.correo, 
  tm_contactos.id_empresa, 
  tm_contactos_unidad_alertas.id_mobil, 
  tm_contactos_unidad_alertas.estado
FROM 
  datos.tm_contactos, 
  datos.tm_contactos_unidad_alertas
WHERE 
  tm_contactos.id_contacto = tm_contactos_unidad_alertas.id_contacto  $filtro ;
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

   public function list_contactos_unidad_alertaslibres($im)
  {

    if ($im) {

      $filtro = " and tm_contactos_unidad_alertas.id_mobil=$im ";
    } else {
      $filtro = " ";
    }

    $hoy=date("Y-m-d");

    $sql=" SELECT 
  tm_contactos.id_contacto, 
  tm_contactos.nombres, 
  tm_contactos.apellidop, 
  tm_contactos.celular, 
  tm_contactos.correo, 
  tm_contactos.id_empresa
FROM 
  datos.tm_contactos

WHERE tm_contactos.correo <>'' and  tm_contactos.id_contacto not in ( select id_contacto from datos.tm_contactos_unidad_alertas where id_mobil=$im); ";


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

   public function asigna_contactos() {

$idmobil=$this->input->post('idmobil');
$missa=$this->input->post('disponibles');
for ($z=0;$z<count($missa);$z++) { 


// INSERT INTO datos.tm_contactos_unidad_alertas(
//             id_cua, id_contacto, id_mobil, estado, fechasistema)
//     VALUES (?, ?, ?, ?, ?);

  //echo $missa[$z];
  $sql="INSERT INTO datos.tm_contactos_unidad_alertas(
             id_mobil, id_contacto)
    VALUES ('".$idmobil."','".$missa[$z]."');";
$this->db->query($sql);


  }

   }

      public function desasigna_contactos() {
$idmobil=$this->input->post('idmobil');

$misa=$this->input->post('contasignados');
for ($z=0;$z<count($misa);$z++) { 

  //echo $misa[$z];

  $sql="DELETE from  datos.tm_contactos_unidad_alertas where 
             id_mobil='".$idmobil."' and  id_contacto='".$misa[$z]."'";

        //     echo $sql;
    $this->db->query($sql);


  }



   }


}