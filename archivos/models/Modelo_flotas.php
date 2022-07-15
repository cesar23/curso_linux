<?php
Class Modelo_flotas extends CI_Model
{
  function login($username, $password)
  {
    $this -> db -> select('id_usuario as id,usuario as usuario, pass as password,nivel,id_empresa ');
    $this -> db -> from('datos.tm_usuarios');
    $this -> db -> where('usuario = ' . "'" . $username . "'"); 
    $this -> db -> where('pass = ' . "'" . MD5($password) . "'"); 
    $this -> db -> limit(1);

    $query = $this -> db -> get();

    if($query -> num_rows() == 1)
    {
   //   echo "Holas";
      return $query->result();
    }
    else
    {
 //           echo "Holas2";

      return false;
    }

  }
    function listar($ni,$ide,$iu)
  {
    if($ni<=1) 
      {
        $filtrou='';
      } else {
        $filtrou=" and id_usuario=$iu";
      }
$sql="SELECT id_flota, nombreflota, email, email1, email2, contacto, contacto1, 
       contacto2, fecharegistro  FROM datos.tm_flota where id_empresa=$ide;";
      $query = $this->db->query($sql);
    if($query -> num_rows() > 0)
    {
         foreach ($query->result() as $row)
        {
        $data[] = $row;
        }
      return $data;
    }
    else
    {
      return false;
    }
  }
      function recuperar($iu)
  {


      $sql="SELECT id_flota, nombreflota, email, email1, email2, contacto, contacto1, 
       contacto2, fecharegistro  FROM datos.tm_flota where id_flota=$iu ";
      $query = $this->db->query($sql);


    if($query -> num_rows() > 0)
    {
         foreach ($query->result() as $row)
        {
        $data[] = $row;
        }
      return $data;
    }
    else
    {
      return false;
    }


  }

  public function nuevo($ide)
   {
    /*$sql="INSERT INTO datos.tm_usuarios(id_empresa,tipoempresa, usuario, nombres, apellidop,email,pass, nivel)
    VALUES ('".$this->input->post('emp')."',1,'".$this->input->post('usu')."','".$this->input->post('nom')."','".$this->input->post('apel')."','".$this->input->post('ema')."','".$password."','".$this->input->post('niv')."');";
    $query = $this->db->query($sql);*/
    $sql="INSERT INTO datos.tm_flota(
             nombreflota, email, email1, email2, contacto, contacto1,contacto2,id_empresa)
    VALUES ('".$this->input->post('nombreflota')."', '".$this->input->post('email1')."', '".$this->input->post('email2')."','".$this->input->post('email3')."', 
            '".$this->input->post('contacto1')."', '".$this->input->post('contacto2')."', '".$this->input->post('contacto3')."','".$ide."');";

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
  public function editar()
   {
         //$sql="UPDATE datos.tm_usuarios   SET  nombres='".$this->input->post('nom')."', apellidop='".$this->input->post('apel')."',email='".$this->input->post('ema')."' where id_usuario='".$this->input->post('idusu')."'";
$sql="update datos.tm_flota set   nombreflota='".$this->input->post('nombreflota')."', email='".$this->input->post('email1')."', email1='".$this->input->post('email2')."', 
email2='".$this->input->post('email3')."',contacto='".$this->input->post('contacto1')."', contacto1='".$this->input->post('contacto2')."', 
contacto2='".$this->input->post('direccion')."' where id_flota= '".$this->input->post('idcli')."'";

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

     public function borrar()
   {
         //$sql="UPDATE datos.tm_usuarios   SET  nombres='".$this->input->post('nom')."', apellidop='".$this->input->post('apel')."',email='".$this->input->post('ema')."' where id_usuario='".$this->input->post('idusu')."'";
$sql="delete from datos.tm_flota  where id_flota= '".$this->input->post('idcli')."'";

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
    
      function moviles_sa($iu,$ie)
  {


      $sql="select a.id_mobil as id_sector,a.nombremobil as nombre_sector 
      from datos.tm_mobil a,datos.tm_usuario_mobil b where a.estado<>6 and
      a.id_mobil=b.id_mobil and b.id_usuario=$iu and
      id_empresa=$ie and a.id_mobil not in ( select id_mobil from datos.tm_flota_mobil)
order by nombremobil desc
;
 ";


      $query = $this->db->query($sql);


    if($query -> num_rows() > 0)
    {
         foreach ($query->result() as $row)
        {
        $data[] = $row;
        }
      return $data;
    }
    else
    {
      return false;
    }


  }

        function movilesa($iu,$if)
  {




      $sql="select a.id_mobil as id_sector,a.nombremobil as nombre_sector 
      from datos.tm_mobil a,datos.tm_usuario_mobil b where a.estado<>6 and
      a.id_mobil=b.id_mobil and 
  b.id_usuario  in ($iu)  and a.id_mobil in ( select id_mobil from datos.tm_flota_mobil where id_flota=$if)
order by nombremobil desc
;
 ";

// echo $sql;
      $query = $this->db->query($sql);


    if($query -> num_rows() > 0)
    {
         foreach ($query->result() as $row)
        {
        $data[] = $row;
        }
      return $data;
    }
    else
    {
      return false;
    }


  }


public function asigna_sectores() /* Listar sectores sin asignar */
   {
$idflo=$this->input->post('idflo');

$misa=$this->input->post('missectoresa');



$missa=$this->input->post('missectoressa');
for ($z=0;$z<count($missa);$z++) { 

  echo $missa[$z];
  $sqlxx="INSERT INTO datos.tm_usuario_mobil(
             id_usuario, id_mobil)
    VALUES ('".$ifundo."','".$missa[$z]."');";

$sql="INSERT INTO datos.tm_flota_mobil(
             id_flota, id_mobil)
    VALUES ('".$idflo."','".$missa[$z]."');";


$this->db->query($sql);


  }

   }



public function desasigna_sectores() /* Listar sectores sin asignar */
   {
$idflo=$this->input->post('idflo');

$misa=$this->input->post('missectoresa');


 // echo "separa ".$i." ".$aaa ;
//echo $aaa." ";
/*
for ($z=0;$z<count($misa);$z++) { 

   echo $misa[$z];
   $this->db->select('    id_fundo, id_sector');
    $this->db->from('tm_fundo_sector'); 
          $this->db->where('id_fundo',$ifundo);
          $this->db->where('id_sector',$misa[$z]);

        $query = $this->db->get();

    if($query->num_rows()!=0){
  

} 

  } */
$misa=$this->input->post('missectoresa');
for ($z=0;$z<count($misa);$z++) { 

  echo $misa[$z];

  $sql="DELETE from  datos.tm_flota_mobil where 
             id_flota='".$idflo."' and  id_mobil='".$misa[$z]."'";

             echo $sql;
    $this->db->query($sql);


  }

   }















}
?>