<?php
Class Modelo_clientesalquiler extends CI_Model
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


      $sqlxx="Select id_usuario as id,usuario as usuario,nombres,apellidop,nivel,email
      from datos.tm_usuarios where id_empresa=$ide $filtrou order by nivel asc, usuario ";
$sql="SELECT id_cliente, tipoempresa, ruc, razonsocial, ncomercial, telefono, 
       email, contacto, direccion, estado, fecharegistro, id_empresa_anterior, 
       tipomtc
  FROM datos.tm_clientes;";

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


      $sql="SELECT id_cliente, tipoempresa, ruc, razonsocial, ncomercial, telefono, 
       email, contacto, direccion, estado, fecharegistro, id_empresa_anterior, 
       tipomtc
  FROM datos.tm_clientes where id_cliente=$iu; ";
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

  public function nuevo()
   {
    /*$sql="INSERT INTO datos.tm_usuarios(id_empresa,tipoempresa, usuario, nombres, apellidop,email,pass, nivel)
    VALUES ('".$this->input->post('emp')."',1,'".$this->input->post('usu')."','".$this->input->post('nom')."','".$this->input->post('apel')."','".$this->input->post('ema')."','".$password."','".$this->input->post('niv')."');";
    $query = $this->db->query($sql);*/
    $sql="INSERT INTO datos.tm_clientes(
             tipoempresa, ruc, razonsocial, ncomercial, telefono, 
            email, contacto, direccion)
    VALUES (1, '".$this->input->post('ruc')."', '".$this->input->post('empresa')."', '".$this->input->post('nombrecomercial')."','".$this->input->post('telefono')."', 
            '".$this->input->post('ema')."', '".$this->input->post('contacto')."', '".$this->input->post('direccion')."');";

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
$sql="update datos.tm_clientes set   ruc='".$this->input->post('ruc')."', razonsocial='".$this->input->post('empresa')."', ncomercial='".$this->input->post('nombrecomercial')."', 
telefono='".$this->input->post('telefono')."',  email='".$this->input->post('ema')."', contacto='".$this->input->post('contacto')."', 
direccion='".$this->input->post('direccion')."' where id_cliente= '".$this->input->post('idcli')."'";

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
$sql="delete from datos.tm_clientes  where id_cliente= '".$this->input->post('idcli')."'";

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


      $sql="select id_mobil as id_sector,nombremobil as nombre_sector from datos.tm_mobil where id_empresa=$ie and id_mobil not in (
SELECT 
  a.id_mobil
  
FROM 
  datos.tm_mobil a , 
  datos.tm_usuario_mobil b
WHERE 
a.estado<>6 and
  a.id_mobil = b.id_mobil and 
  b.id_usuario  in ($iu))
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
$ifundo=$this->input->post('ifundo');

$misa=$this->input->post('missectoresa');



$missa=$this->input->post('missectoressa');
for ($z=0;$z<count($missa);$z++) { 

  echo $missa[$z];
  $sql="INSERT INTO datos.tm_usuario_mobil(
             id_usuario, id_mobil)
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

  $sql="DELETE from  datos.tm_usuario_mobil where 
             id_usuario='".$ifundo."' and  id_mobil='".$misa[$z]."'";

             echo $sql;
    $this->db->query($sql);


  }

   }












        function movilesa($iu,$ie)
  {


      $sql="
SELECT 
  a.id_mobil as id_sector,
  a.nombremobil as nombre_sector
FROM 
  datos.tm_mobil a , 
  datos.tm_usuario_mobil b
WHERE 
a.estado<>6 and
  a.id_mobil = b.id_mobil and 
  b.id_usuario  in ($iu)
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




}
?>