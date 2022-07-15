<?php

Class Modelo_usuario extends CI_Model
{
    function login($username, $password)
    {
        $this->db->select('id_usuario as id,id_usuario,usuario as usuario,nombres as nombre,email,apellidop as apellidos,imagen as avatar,cargo, pass as password,nivel,id_empresa,estado ');
        $this->db->from('datos.tm_usuarios');
        $this->db->where('usuario = ' . "'" . $username . "'");
        $this->db->where('pass = ' . "'" . MD5($password) . "'");
        $this->db->where("estado",'t');
        $this->db->limit(1);

        $query = $this->db->get();

        if ($query->num_rows() == 1) {
            $ip = $this->input->ip_address();
            foreach ($query->result() as $row) {
                $id_e = $row->id_empresa;
                $id_u = $row->id;
            }

            $sqlx = "INSERT INTO datos.ts_logacceso( id_usario,id_empresa,tipoempresa,ip, fecha, tipo)
      VALUES ('$id_u','$id_e',1,'$ip',now(),0);";
            $queryx = $this->db->query($sqlx);


            return $query->result();
        } else {
            return false;
        }

    }

    function listar($ni, $ide, $iu)
    {

        if ($ni < 1) {
            $filtroe = '';
        } else {
            $filtroe = "and a.id_empresa=$ide ";
        }
        if ($ni <= 1) {
            $filtrou = '';

        } else {
            $filtrou = " and a.id_usuario=$iu";

        }


        $sql = "Select a.id_usuario as id,a.usuario as usuario,a.nombres,a.apellidop,a.nivel,a.email,b.razonsocial,b.id_empresa as id_empresa,a.estadousuario,a.estado,a.receive_alerts
      from datos.tm_usuarios a, datos.tm_empresas b where a.id_empresa=b.id_empresa and  a.estadousuario in(0,1) $filtroe $filtrou order by a.nivel asc, a.usuario ";
        $query = $this->db->query($sql);


        if ($query->num_rows() > 0) {
            foreach ($query->result() as $row) {
                $data[] = $row;
            }
            return $data;
        } else {
            return false;
        }


    }

    function listarusuario($iu)
    {


        $sql = "Select a.id_usuario as id,a.usuario as usuario,a.nombres,a.apellidop,a.nivel,a.email,a.phone,b.razonsocial,a.estado,a.receive_alerts
      from datos.tm_usuarios a, datos.tm_empresas b where a.id_empresa=b.id_empresa and a.id_usuario=$iu order by a.nivel asc, a.usuario ";
        $query = $this->db->query($sql);


        if ($query->num_rows() > 0) {
            foreach ($query->result() as $row) {
                $data[] = $row;
            }
            return $data;
        } else {
            return false;
        }


    }

    public function nuevo_usuario($password)
    {
        $password=MD5($password);

        $not = array(" ", "(", ")", "''", "\"","-","_");
        $sms = str_replace($not, "", $this->input->post('phonec'));

        $data = array(
            'id_empresa' => $this->input->post('listaempresas'),
            'tipoempresa' => 1,
            'usuario' => $this->input->post('usuarioc'),
            'nombres' => $this->input->post('nombrec'),
            'apellidop' => $this->input->post('apellidoc'),
            'email' => $this->input->post('emailc'),
            'pass' => $password,
            'phone' => $sms,
            'nivel' => $this->input->post('lista1'),
            'latitud' => -12.1123494,
            'longitud' => -76.993256,
            'tiempo' => 30,
            'sexo' => 'M',
            'zoom' => 15,
            'estado' => 't',
            'id_usuario_tipo' => 'AE',
//            'persona_id' => $id_usuario,
            'mapa' => 'hybrid'

            );
        $this->db->insert('datos.tm_usuarios', $data);









        $sql = "select * from datos.tm_usuarios where usuario='" . $this->input->post('usuarioc') . "' ";
        $query = $this->db->query($sql);
        $id_usuario = "";
        foreach ($query->result() as $row) {
            $id_usuario = $row->id_usuario;
        }
        $this->db->query("UPDATE datos.tm_usuarios set persona_id = '$id_usuario' WHERE id_usuario =  '$id_usuario'");

        $this->db->flush_cache();

        $sql = "INSERT INTO datos.persona(
              id,   nombres, apellido_paterno,
               sexo)
    VALUES ('$id_usuario', '" . $this->input->post('nombrec') . "', '" . $this->input->post('apellidoc') . "', 'M');";
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

    public function nuevo_usuario_ant()
    {
        $password = MD5($this->input->post('passwordc'));


        try {
            $sql = "INSERT INTO datos.tm_usuarios
          (id_empresa,tipoempresa, usuario, nombres, apellidop,email,pass, nivel)
          VALUES 
          ('" . $this->input->post('listaempresas') . "',1,'" . $this->input->post('usuarioc') . "','" . $this->input->post('nombrec') . "','" . $this->input->post('apellidoc') . "','" . $this->input->post('emailc') . "','" . $password . "','" . $this->input->post('lista1') . "');";

            //echo $sql;exit;
            //$query = $this->db->query($sql);

            $data = array(
                'id_empresa' => $this->input->post('listaempresas'),
                'tipoempresa' => 1,
                'usuario' => $this->input->post('usuarioc'),
                'nombres' => $this->input->post('nombrec'),
                'apellidop' => $this->input->post('apellidoc'),
                'email' => $this->input->post('emailc'),
                'pass' => $password,
                'nivel' => $this->input->post('lista1'));

            //echo '<pre>'.var_dump($data).'</pre>';exit;
            $query = $this->db->insert('datos.tm_usuarios', $data);


            $sql = "select * from datos.tm_usuarios where usuario='" . $this->input->post('usuarioc') . "' ";
            $query = $this->db->query($sql);
            $id_usuario = "";
            foreach ($query->result() as $row) {
                $id_usuario = $row->id_usuario;
            }

            $this->db->flush_cache();


            $sql = "UPDATE datos.tm_usuarios 
SET latitud = -12.1123494, 
longitud = -76.993256, 
tiempo = 30, 
sexo = 'M', 
zoom = 15, 
estado = true, 
id_usuario_tipo = 'AE', 
persona_id = '$id_usuario', 
mapa = 'hybrid'
 WHERE id_usuario =  '$id_usuario'";
            $query = $this->db->query($sql);


            $sql = "INSERT INTO datos.persona(
              id,   nombres, apellido_paterno,
               sexo)
    VALUES ('$id_usuario', '" . $this->input->post('nombrec') . "', '" . $this->input->post('apellidoc') . "', 'M');";
            $query = $this->db->query($sql);


        } catch (Exception $e) {
            //alert the user.
            var_dump($e->getMessage());
        }

        exit;

//
//    if($query)
//      {
//        return true;
//      }
//      else
//      {
//        return false;
//      }
    }

    public function edita_usuario()
    {
        $estado='f';
        $receive_alerts='f';
        if($this->input->post('estado')==1 ||$this->input->post('estado')=='1'){
            $estado='t';
        }

        if($this->input->post('receive_alerts')==1 ||$this->input->post('receive_alerts')=='1' ){
            $receive_alerts='t';
        }

        $sql = "UPDATE datos.tm_usuarios   
            SET  nombres='" . $this->input->post('nombrec') . "', 
            apellidop='" . $this->input->post('apellidoc') . "', 
            usuario='" . $this->input->post('usuarioc') . "',
            id_empresa='" . $this->input->post('listaempresas') . "', 
            phone='" . $this->input->post('phonec') . "', 
            nivel='" . $this->input->post('lista1') . "',
            estado='" . $estado . "' ,
            receive_alerts='" . $receive_alerts . "' ,
            email='" . $this->input->post('emailc') . "'
            where id_usuario='" . $this->input->post('idusuario') . "'";

//        echo $sql;exit;
        $query = $this->db->query($sql);

        if ($query) {
            return true;
        } else {
            return false;
        }

    }

    public function edita_usuariop()
    {
        $password = MD5($this->input->post('passwordc'));


        $sql = "UPDATE datos.tm_usuarios   SET  nombres='" . $this->input->post('nombrec') . "', apellidop='" . $this->input->post('apellidoc') . "', usuario='" . $this->input->post('usuarioc') . "',id_empresa='" . $this->input->post('listaempresas') . "',email='" . $this->input->post('emailc') . "',pass='" . $password . "' where id_usuario='" . $this->input->post('idusuario') . "'";
        $query = $this->db->query($sql);
        if ($query) {
            return true;
        } else {
            return false;
        }

    }

    public function borra_usuario()
    {
        $sql = "UPDATE datos.tm_usuarios   SET  estadousuario='1' where id_usuario='" . $this->input->post('idusuario') . "'";
        $query = $this->db->query($sql);
        if ($query) {
            return true;
        } else {
            return false;
        }

    }

    public function activar_usuario()
    {
        $sql = "UPDATE datos.tm_usuarios   SET  estadousuario='0' where id_usuario='" . $this->input->post('idusuario') . "'";
        $query = $this->db->query($sql);
        if ($query) {
            return true;
        } else {
            return false;
        }

    }


    function movilesa($iu, $ie, $nu)
    {

//a.estado<>6 and
        $sql = "
SELECT 
  a.id_mobil as id_sector,
  a.nombremobil as nombre_sector
FROM 
  datos.tm_mobil a , 
  datos.tm_usuario_mobil b
WHERE 

  a.id_mobil = b.id_mobil and 
  b.id_usuario  in ($iu)
  order by nombremobil asc
;
 ";
// echo $sql;
        $query = $this->db->query($sql);


        if ($query->num_rows() > 0) {
            foreach ($query->result() as $row) {
                $data[] = $row;
            }
            return $data;
        } else {
            return false;
        }


    }

    function moviles_sa($iu, $ie, $nu)
    {
        if ($nu < 1) {

            $filtro = "";
        } else {
            $filtro = " and id_empresa=$ie ";
        }
//a.estado<>6 and
        $sql = "select id_mobil as id_sector,nombremobil as nombre_sector from datos.tm_mobil where id_mobil not in (
SELECT 
  a.id_mobil
  
FROM 
  datos.tm_mobil a , 
  datos.tm_usuario_mobil b
WHERE 

  a.id_mobil = b.id_mobil and 
  b.id_usuario  in ($iu)) $filtro
order by nombremobil asc
;
 ";
        //echo $sql;
        $query = $this->db->query($sql);


        if ($query->num_rows() > 0) {
            foreach ($query->result() as $row) {
                $data[] = $row;
            }
            return $data;
        } else {
            return false;
        }


    }


    public function asigna_sectores() /* Listar sectores sin asignar */
    {
        $idusuario = $this->input->post('idusuario');

//$disponibles=$this->input->post('disponibles');


        $missa = $this->input->post('disponibles');
        for ($z = 0; $z < count($missa); $z++) {

            echo $missa[$z];
            $sql = "INSERT INTO datos.tm_usuario_mobil(
             id_usuario, id_mobil)
    VALUES ('" . $idusuario . "','" . $missa[$z] . "');";
            $this->db->query($sql);


        }

    }


    public function desasigna_sectores() /* Listar sectores sin asignar */
    {
        $idusuario = $this->input->post('idusuario');


//$misa=$this->input->post('missectoresa');


        $misa = $this->input->post('contasignados');
        for ($z = 0; $z < count($misa); $z++) {

//  echo $misa[$z];

            $sql = "DELETE from  datos.tm_usuario_mobil where 
             id_usuario='" . $idusuario . "' and  id_mobil='" . $misa[$z] . "'";

            //           echo $sql;
            $this->db->query($sql);


        }

    }


    public function tipousuario()
    {

        $sql = "SELECT tipousuario, descripcion  FROM datos.ts_tipousuario;
 ";
        $query = $this->db->query($sql);

        if ($query->num_rows() > 0) {
            foreach ($query->result() as $fila) {
                $data[] = $fila;
            }
            return json_encode($data);
        } else {
            return False;
        }

    }

    function validEmail($email)
    {
        $this -> db -> select('id_usuario as id,usuario,
nombres,
apellidop,
apellidom,
pass,
cargo,
email,
latitud,
longitud,
tiempo,
sexo,
zoom,
estado,
observaciones,
id_usuario_tipo,
persona_id');
        $this -> db -> from('datos.tm_usuarios');
        $this -> db -> where('email = ' . "'" . $email . "'");
//        $this -> db -> where('estado = true');
        $this -> db -> limit(1);

        $query = $this -> db -> get();

        if($query -> num_rows() == 1)
        {
            $registro=null;

            foreach ($query->result() as $row)
            {
                $registro=$row;
            }

            return $registro;
        }
        else
        {
            //           echo "Holas2";

            return false;
        }

    }
    public function edita_usuario_por_recu_password($id_usuario,$password)
    {


        $sql="UPDATE datos.usuario   
                SET 
                 contrasena='".$password."' 
                 where id_usuario='".$id_usuario."'";

        // echo $sql;
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

    function getUser($item, $valor){

        $this -> db -> select('id_usuario as id,usuario,
nombres,
apellidop,
apellidom,
pass,
cargo,
email,
email as correo,
latitud,
longitud,
tiempo,
sexo,
zoom,
estado,
observaciones,
id_usuario_tipo,
persona_id');
        $this -> db -> from('datos.tm_usuarios');
        $this -> db -> where($item,$valor);
        $this -> db -> limit(1);
        $query = $this -> db -> get();

        if($query -> num_rows() == 1) {

            return $query->row();

        }else{
            return false;

        }

    }

    function setChangePassword($id_usuario,$new_password){


        $this->db->set('pass', $new_password);
        $this->db->where('id_usuario', $id_usuario);
        $salida=$this->db->update('datos.tm_usuarios'); // gives UPDATE `mytable` SET `field` = 'field+1' WHERE `id` = 2



        if($salida) {

            return $salida;

        }else{
            return false;

        }

    }


}

?>