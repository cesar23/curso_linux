<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_embarcaciones extends CI_Model{ // Begin class model_mantcateg

  public function listar_embarcaciones($id,$ni)
  {

      if ($ni<=0) {
    $sql="SELECT    tm_naves.codigonave,tm_naves.matricula, tm_naves.nombrenave, tm_naves.estadonave, tm_naves.fecha_inscripcion_gsp, tm_naves.tiposervicio, 
    tm_naves.tipoembarcacion, tm_naves.equipo_instalado,  tm_naves.fecha_sistema, tm_naves.limite_diario, tm_naves.limite_mensual, tm_naves.alias, 
    tm_naves.tipo, tm_armador.armador,tm_naves.codigoarmador,ts_tipoembarcacion.detalle as tipoep
    FROM 
    marine.tm_naves, 
      marine.tm_armador,
      marine.ts_tipoembarcacion
    WHERE 
    ts_tipoembarcacion.tipoembarcacion=tm_naves.tipoembarcacion and 
    tm_naves.codigoarmador = tm_armador.codigoarmador   ";


  }else {
    $sql="SELECT    tm_naves.codigonave,tm_naves.matricula, tm_naves.nombrenave, tm_naves.estadonave, tm_naves.fecha_inscripcion_gsp, tm_naves.tiposervicio, 
    tm_naves.tipoembarcacion, tm_naves.equipo_instalado,  tm_naves.fecha_sistema, tm_naves.limite_diario, tm_naves.limite_mensual, tm_naves.alias, 
    tm_naves.tipo, tm_asignacion.codigousuario, tm_armador.armador,tm_naves.codigoarmador,ts_tipoembarcacion.detalle as tipoep
    FROM 
    marine.tm_naves, 
    marine.tm_asignacion, 
    marine.tm_armador,
      marine.ts_tipoembarcacion
    WHERE 
    ts_tipoembarcacion.tipoembarcacion=tm_naves.tipoembarcacion and 
    tm_naves.codigonave = tm_asignacion.codigonave AND
    tm_naves.codigoarmador = tm_armador.codigoarmador  and tm_asignacion.codigousuario=$id  ";

  }



    $query = $this->db->query($sql);



    if ($query->num_rows() > 0)
    {

      foreach($query->result() as $fila){     
       $data[] = $fila;
     }

     return json_encode($data);
   }
   else{
     return False;
   }
 }

public function listar_embarcaciones_xempresa($ie,$id)
   {

if ($ie) {

$filtro = " and tm_naves.codigoarmador=$ie ";
} else {
  $filtro = " ";
}

 $hoy=date("Y-m-d");

   $sql=" SELECT tm_naves.codigonave, matricula, nombrenave, estadonave, tm_naves.codigoflota, tm_naves.codigoarmador, 
       redirecciona, fecha_inscripcion_gsp, navecode, alias, fecha_inicio_transmisiones, 
       gracia, mantprev1, tipo, prioridad, tipoembarcacion, tiposervicio, 
       equipo_instalado, fecha_sistema, limite_diario, limite_mensual 
  FROM   marine.tm_naves,
        marine.tm_asignacion

  where     tm_naves.codigonave = tm_asignacion.codigonave AND tm_asignacion.codigousuario=$id and
  estadonave not in (6) $filtro; ";

//echo $sql;

$query = $this->db->query($sql);



if ($query->num_rows() > 0)
{
  
        foreach($query->result() as $fila){

           $data[] = $fila;
        }
        
          return json_encode($data);
        //return "si hay data";
    }
    else{
      //$resp['data']="sindatos";
     return json_encode(null);
    }
}

  public function detalle_embarcacion($id,$cn)
  {

    $sql="SELECT    tm_naves.codigonave,tm_naves.matricula, tm_naves.nombrenave, tm_naves.estadonave, tm_naves.fecha_inscripcion_gsp, tm_naves.tiposervicio, 
    tm_naves.tipoembarcacion, tm_naves.equipo_instalado,  tm_naves.fecha_sistema, tm_naves.limite_diario, tm_naves.limite_mensual, tm_naves.alias, 
    tm_naves.tipo, tm_asignacion.codigousuario, tm_armador.armador,tm_naves.codigoarmador
    FROM 
    marine.tm_naves, 
    marine.tm_asignacion, 
    marine.tm_armador
    WHERE 
    tm_naves.codigonave = tm_asignacion.codigonave AND
    tm_naves.codigoarmador = tm_armador.codigoarmador  and tm_asignacion.codigousuario=$id and tm_naves.codigonave=$cn ";

    $query = $this->db->query($sql);



    if ($query->num_rows() > 0)
    {

      foreach($query->result() as $fila){     
       $data[] = $fila;
     }

     return json_encode($data);
   }
   else{
     return False;
   }
 }



  public function detalleu($id,$cn)
  {

    $sql="SELECT    tm_naves.codigonave, tm_naves.nombrenave,tm_naves.codigoarmador
    FROM 
    marine.tm_naves, 
    marine.tm_asignacion, 
    marine.tm_armador,
    
    WHERE 
    tm_naves.codigonave = tm_asignacion.codigonave AND
    tm_naves.codigoarmador = tm_armador.codigoarmador  and tm_asignacion.codigousuario=$id and tm_naves.codigonave=$cn ";

    $query = $this->db->query($sql);



    if ($query->num_rows() > 0)
    {

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
    $sql="INSERT INTO marine.tm_naves(
            nombrenave, matricula, codigoarmador,codigoflota, alias, estadonave,tipoembarcacion )
    VALUES  ('".$this->input->post('campo1')."','".$this->input->post('campo2')."','".$this->input->post('listaempresas')."','".$this->input->post('listaempresas')."','".$this->input->post('campo3')."','".$this->input->post('campo4')."','".$this->input->post('tipoep')."');
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



  public function edita()
   {
    $sql="update marine.tm_naves set  nombrenave='".$this->input->post('campo1')."', matricula='".$this->input->post('campo2')."', codigoarmador='".$this->input->post('listaempresas')."',alias='".$this->input->post('campo3')."',estadonave='".$this->input->post('campo4')."',tipoembarcacion='".$this->input->post('tipoep')."' where codigonave='".$this->input->post('idunidad')."'  ";
  
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

  public function borra()
   {
    $sql="update  marine.tm_naves set estadonave=6 where   codigonave='".$this->input->post('idunidad')."' ";
  
//echo $sql;



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

function embarcaciones_sinasignar()
{
  $sql="SELECT codigonave, matricula, nombrenave, estadonave
  FROM marine.tm_naves where estadonave not in (6) and codigonave not in(SELECT codigonave FROM marine.tm_nave_equipo) order by nombrenave;";
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

  public function asigna_equipo()
   {

$ide=$this->input->post('listaequipos');
$epx=$this->input->post('listaunidades');
$otx=$this->input->post('ordentrabajo');
$obs=$this->input->post('observ');
    $sql="INSERT INTO marine.tm_nave_equipo(
            id_equipo,  codigonave,codigoot,observaciones)
    VALUES ('".$ide."','".$epx."','".$otx."','".$obs."' );";


    $query = $this->db->query($sql);
    if($query)
      {



          $sql1="UPDATE marine.tm_naves set estadonave=1 WHERE codigonave='".$epx."'";
    $this->db->query($sql1);

   $sql2="UPDATE marine.tm_equipo set estado_equipo=1 WHERE id_equipo='".$ide."'";
    $this->db->query($sql2);

   $sql3=" INSERT INTO marine.tm_nave_equipo_historia(
             id_equipo,codigonave, tipo_operacion)
    VALUES ('".$ide."','".$epx."',1) ";

    $this->db->query($sql3);
        return true;
      }
      else
      {
        return false;
      }
   }


public function desasigna() 
   {
$ide=$this->input->post('ideq');
$epx=$this->input->post('cna');

  $sql="DELETE FROM marine.tm_nave_equipo WHERE codigonave='".$epx."' and  id_equipo='".$ide."'";
    $this->db->query($sql);

  $sql1="UPDATE marine.tm_naves set estadonave=0 WHERE codigonave='".$epx."'";
    $this->db->query($sql1);

   $sql2="UPDATE marine.tm_equipo set estado_equipo=0 WHERE id_equipo='".$ide."'";
    $this->db->query($sql2);


   $sql3=" INSERT INTO marine.tm_nave_equipo_historia(
             id_equipo,codigonave, tipo_operacion)
    VALUES ('".$ide."','".$epx."',2) ";

    $this->db->query($sql3);

return true;
  

   }


   public function tipoembarcacion()
   {

    $sql=" SELECT tipoembarcacion, detalle  FROM marine.ts_tipoembarcacion; ";
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



}