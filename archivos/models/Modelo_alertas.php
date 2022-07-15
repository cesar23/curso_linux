<?php if (!defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_alertas extends CI_Model
{ // Begin class model_mantcateg


    public function listar_alert($ie, $un, $num)
    {


        if ($un > 0) {
            $filtro2 = " AND alert_history.id_empresa = $ie ";
        } else {
            $filtro2 = " ";
        }


        if ($num) {
            $limite = " limit $num ";
        } else {
            $limite = " limit 100 ";
        };

        $sql = "SELECT
	tm_mobil.nombremobil,
	tm_mobil.placa,alert_history.*
FROM
	datos.alert_history
	INNER JOIN datos.tm_mobil ON alert_history.id_mobil = tm_mobil.id_mobil 
	$filtro2 
WHERE
	1 = 1 
	AND alert_history.alert_panic = TRUE 
	OR alert_history.alert_speed = TRUE 
	OR alert_history.alert_somno = TRUE 
		
ORDER BY
	alert_history.gps_date_local DESC $limite;";



        $query = $this->db->query($sql);

        //      $query = $this->db->get();
        if ($query->num_rows() != 0) {

            foreach ($query->result() as $fila) {

                $data[] = $fila;
            }

            return $data;
        } else {
            return False;
        }

    }


    public function listar_alertas($ie, $un, $num)
    {


        if ($un > 0) {
            $filtro2 = " and a.id_empresa=$ie ";
        } else {
            $filtro2 = " ";
        }


        if ($num) {
            $limite = " limit $num ";
        } else {
            $limite = " limit 100 ";
        };

        $sql = " SELECT   a.nombremobil,   a.placa, b.tipo as ti,b.estado as es,    c.descripcion as tipo,   b.fecha_alerta,   b.fecha_reporta,   b.departamento,   b.provincia, 
  b.ubicacion,   b.fechag - CAST('5 hour' AS INTERVAL) as fechag,     b.nrotxt,   d.descripcion as estado,   b.observacion
FROM 
  datos.tm_mobil a,  datos.tm_alertas b,  datos.ts_tipoalerta c,  datos.ts_estadoalerta d

WHERE 
  a.id_mobil = b.id_mobil and b.tipo=c.tipo and d.estado=b.estado $filtro2 order by b.tipo, b.fecha_alerta desc $limite;
";

        $query = $this->db->query($sql);

        //      $query = $this->db->get();
        if ($query->num_rows() != 0) {

            foreach ($query->result() as $fila) {

                $data[] = $fila;
            }

            return $data;
        } else {
            return False;
        }

    }

    public function getAllImg($nro_id_jpg)
{

    $query=$this->db->query('SET bytea_output="escape"');


    $sql = " SELECT
datos.tm_ruptelamsgs.nro_id_jpg,

datos.tm_ruptelamsgs.numjpg,
datos.tm_ruptelamsgs.isjpg,
datos.tm_ruptelamsgs.course,
datos.tm_ruptelamsgs.speed,
datos.tm_ruptelamsgs.lat_dd,
datos.tm_ruptelamsgs.long_dd,
datos.tm_ruptelamsgs.id_mobil,
datos.tm_mobil.nombremobil,
datos.tm_mobil.placa,
datos.tm_ruptelamsgs.gps_date as gsp_date_local
FROM
datos.tm_ruptelamsgs
INNER JOIN datos.tm_mobil ON datos.tm_ruptelamsgs.id_mobil = datos.tm_mobil.id_mobil
WHERE
datos.tm_ruptelamsgs.nro_id_jpg = '$nro_id_jpg'
ORDER BY
datos.tm_ruptelamsgs.numjpg ASC limit 100;
";

//        echo $sql;exit;
    $query = $this->db->query($sql);

//              $query = $this->db->get();
    if ($query->num_rows() != 0) {

        foreach ($query->result() as $fila) {

            $data[] = $fila;
        }

        return $data;
    } else {
        return False;
    }

}

    public function ver($id=NULL)
    {
        $query=$this->db->query('SET bytea_output="escape"');
        $sql="SELECT
            *
            FROM
            datos.tm_ruptelamsgs tm_ruptelamsgs
            WHERE
            tm_ruptelamsgs.isjpg=1 AND
            tm_ruptelamsgs.nro_id_jpg='$id'
            ORDER BY
            tm_ruptelamsgs.numjpg";
//        echo $sql;exit;
        $query=$this->db->query($sql);
        return $query->result_array();
    }

    public function getImg($nro_id_jpg,$nro)
    {

        $query=$this->db->query('SET bytea_output="escape"');


        $sql = " SELECT
datos.tm_ruptelamsgs.numjpg,
datos.tm_ruptelamsgs.isjpg,
datos.tm_ruptelamsgs.contentjpg
FROM
datos.tm_ruptelamsgs
INNER JOIN datos.tm_mobil ON datos.tm_ruptelamsgs.id_mobil = datos.tm_mobil.id_mobil
WHERE
datos.tm_ruptelamsgs.nro_id_jpg = '$nro_id_jpg' 
ORDER BY
datos.tm_ruptelamsgs.numjpg;
";
        $query = $this->db->query($sql);

        $result = $query->result();
        return $result;

//        $row = $query->row();
//
//        if (isset($row))
//        {
//           return $row;
//        }else{
//            return false;
//        }

    }

    public function listar_alertascanbus($idu, $im, $limite)
    {
//public function detalletxcanbus($idu,$im,$limite)
        // {

        if ($im) {
            $filtroum = " and a.id_mobil=$im ";
        } else {
            $filtroum = "";
        }
        $filtrofecha = "";
        $daterange = $this->input->post('daterange');
        $servicios = $this->input->post('seleps');
        $tipo = $this->input->post('tipo');
        if ($tipo) {
// echo "si viene tipo";
        } else {
            //echo "no viene tipo";
        }
        if ($daterange) {
            $fechas = explode("-", $daterange);
            $fechai = trim($fechas[0]);
            $fechaf = trim($fechas[1]);
//echo $tipo; echo $fechai; echo $fechaf;
        }

        if ($tipo == 2) {

            $filtrolimite = "limit $limite";
        } else {

            $filtrolimite = " limit 60 ";
        }

        if ($tipo == 1) {
            $filtrolimite = "";

            $filtrofecha = "and a.fecha_alerta - CAST('5 hour' AS INTERVAL)>=to_timestamp('$fechai','DD/MM/YYYY HH24:MI') and a.fecha_alerta - CAST('5 hour' AS INTERVAL)<=to_timestamp('$fechaf','DD/MM/YYYY HH24:MI')";
        }

        $hoyf = date("Y-m-d", time());
//$hoy="2013-09-04";
        $hoy = time();

        $sql = " SELECT a.id_ac,a.tipo_ac, a.id_mobil, b.nombremobil, a.estado, a.observacion, a.fecha_alerta - CAST('5 hour' AS INTERVAL) as Fecha,  a.fechag, 
              a.nivel_comb,  a.total_fuel_used,  a.p_total_fuel_used, 
       a.p_total_engine_hours,a.nromotor,a.paramconsumo,a.consumido,c.descripcion as detalletipoac
  FROM datos.tm_alertas_canbus a,datos.tm_mobil b,datos.ts_tipoalerta c where c.tipo=a.tipo_ac and a.id_mobil=b.id_mobil $filtroum $filtrofecha order by fecha_alerta desc $filtrolimite;";
//echo $sql;exit;
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


    public function listar_moviles($id)
    {
        $this->db->select(' id_mobil, nombremobil, commstat, placa, observaciones, f_sistema, 
       id_empresa, marca, modelo, anofabricacion, color, seriemotor, 
       f_instalacion, estado, proveedor, tiposervicio, vmax, promc, 
       kmr, kms, tipounidad, comodin, horometro, otros_servicios,tipo_vehiculo');
        $this->db->from('datos.tm_mobil');
        $this->db->where('estado not in (6,3,8,15,5)');

        $this->db->order_by('id_mobil');


        $sql = " SELECT 
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
        if ($query->num_rows() != 0) {

            foreach ($query->result() as $fila) {

                $data[] = $fila;
            }

            return $data;
        } else {
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
        $this->db->where('id_mobil =' . $if);
        $query = $this->db->get();
        if ($query->num_rows() != 0) {
            foreach ($query->result() as $fila) {
                $data[] = $fila;
            }
            return $data;
        } else {
            return False;
        }
    }

    public function edita_movil($idx)
    {
        $sql = "UPDATE datos.tm_mobil SET  vmax='" . $this->input->post('vmaxe') . "', promc='" . $this->input->post('promce') . "', kmr='" . $this->input->post('kme') . "', horometro='" . $this->input->post('hore') . "'  WHERE id_mobil='" . $this->input->post('id_mobile') . "'";
        $this->db->query($sql);
        $sql = "INSERT INTO datos.ts_his_param(id_mobil, vmax, promc, kmr, horometro, id_usuario)  VALUES ('" . $this->input->post('id_mobile') . "','" . $this->input->post('vmaxe') . "','" . $this->input->post('promce') . "','" . $this->input->post('kme') . "','" . $this->input->post('hore') . "','" . $idx . "')";
        $this->db->query($sql);

    }


    public function contadores($idx)
    {

        $sqlx = "SELECT  id_tc, id_mobil, horometroi, horometroa, horometrom,parametro_repite, repetir, estado,
              descripcion, id_usuario, f_sistema  FROM datos.tm_contadores,datos.ts_tipoevento where tm_contadores.id_evento=ts_tipoevento.id_evento
              and id_mobil='$idx' ";
        $queryx = $this->db->query($sqlx);

        if ($queryx->num_rows() > 0) {
            $acumularm = 0;
            foreach ($queryx->result() as $rowx) {
                $data[] = $rowx;
            }
            return $data;
        } else {
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

        $sql = "INSERT INTO datos.tm_contadores(
            id_mobil, horometroi, horometroa, horometrom, parametro_repite, 
            estado, repetir, id_evento)
    VALUES ('" . $this->input->post('id_movili') . "','" . $this->input->post('horometroi') . "', '" . $this->input->post('horometroa') . "', '" . $this->input->post('horometroo') . "',
      '" . $this->input->post('parametro') . "', 
            '" . $this->input->post('estadocontador') . "', '" . $this->input->post('repitev') . "', '" . $this->input->post('id_evento') . "');";
        $this->db->query($sql);

    }


}