<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_moviles extends CI_Model{ // Begin class model_mantcateg
	   
public function listar_moviles($id)
   {
   $this->db->select(' id_mobil, nombremobil, commstat, placa, observaciones, f_sistema, 
       id_empresa, marca, modelo, anofabricacion, color, seriemotor, 
       f_instalacion, estado, proveedor, tiposervicio, vmax, promc, 
       kmr, kms, tipounidad, comodin, horometro, otros_servicios,tipo_vehiculo');
    $this->db->from('datos.tm_mobil'); 
        $this->db->where('estado not in (6,3,8,15,5)');
  
        $this->db->order_by('id_mobil');   



   $sql=" SELECT 
 tm_mobil.id_mobil as id_mobil, nombremobil, commstat, placa, observaciones, f_sistema, 
       id_empresa, marca, modelo, anofabricacion, color, seriemotor, 
       f_instalacion, estado, proveedor, tiposervicio, vmax, promc, 
       kmr, kms, tipounidad, comodin, horometro, otros_servicios,tipo_vehiculo

FROM 
  datos.tm_mobil  , datos.tm_usuario_mobil 

WHERE
tm_mobil.id_mobil=tm_usuario_mobil.id_mobil and tm_usuario_mobil.id_usuario=$id and 
 estado not in (6,3,8,15,5)  order by id_mobil";

$query = $this->db->query($sql);

  //      $query = $this->db->get();
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

public function detalle_movil($if)
   {
    $this->db->select(' id_mobil, nombremobil, commstat, placa, observaciones, f_sistema, 
    id_empresa, marca, modelo, anofabricacion, color, seriemotor, 
    f_instalacion, estado, proveedor, tiposervicio, vmax, promc, 
    kmr, kms, tipounidad, comodin, horometro, otros_servicios,tipo_vehiculo');
    $this->db->from('datos.tm_mobil'); 
    $this->db->where('id_mobil ='.$if);
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

public function edita_movil($idx)
   {
    $sql="UPDATE datos.tm_mobil SET  vmax='".$this->input->post('vmaxe')."', promc='".$this->input->post('promce')."', kmr='".$this->input->post('kme')."', horometro='".$this->input->post('hore')."'  WHERE id_mobil='".$this->input->post('id_mobile')."'";
    $this->db->query($sql);
    $sql="INSERT INTO datos.ts_his_param(id_mobil, vmax, promc, kmr, horometro, id_usuario)  VALUES ('".$this->input->post('id_mobile')."','".$this->input->post('vmaxe')."','".$this->input->post('promce')."','".$this->input->post('kme')."','".$this->input->post('hore')."','".$idx."')";
    $this->db->query($sql);

   }

     
public function contadores($idx)
   {

        $sqlx="SELECT  id_tc, id_mobil, horometroi, horometroa, horometrom,parametro_repite, repetir, estado,
              descripcion, id_usuario, f_sistema  FROM datos.tm_contadores,datos.ts_tipoevento where tm_contadores.id_evento=ts_tipoevento.id_evento
              and id_mobil='$idx' ";
        $queryx = $this->db->query($sqlx);

        if ($queryx->num_rows() > 0)
        {
          $acumularm=0;
          foreach ($queryx->result() as $rowx)
          {
          $data[]=$rowx;
          }
          return $data;
        }
        else
        {
          return False;
        }

   }

public function grabacontador()
   {
    /*$sql="UPDATE datos.tm_mobil SET  vmax='".$this->input->post('vmaxe')."', promc='".$this->input->post('promce')."', kmr='".$this->input->post('kme')."', horometro='".$this->input->post('hore')."'  WHERE id_mobil='".$this->input->post('id_mobile')."'";
    $this->db->query($sql);
    $sql="INSERT INTO datos.ts_his_param(id_mobil, vmax, promc, kmr, horometro, id_usuario)  VALUES ('".$this->input->post('id_mobile')."','".$this->input->post('vmaxe')."','".$this->input->post('promce')."','".$this->input->post('kme')."','".$this->input->post('hore')."','".$idx."')";
    $this->db->query($sql);
*/

    $sql="INSERT INTO datos.tm_contadores(
            id_mobil, horometroi, horometroa, horometrom, parametro_repite, 
            estado, repetir, id_evento)
    VALUES ('".$this->input->post('id_movili')."','".$this->input->post('horometroi')."', '".$this->input->post('horometroa')."', '".$this->input->post('horometroo')."',
      '".$this->input->post('parametro')."', 
            '".$this->input->post('estadocontador')."', '".$this->input->post('repitev')."', '".$this->input->post('id_evento')."');";
$this->db->query($sql);

   }













}