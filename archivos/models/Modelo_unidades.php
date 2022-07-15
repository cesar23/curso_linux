<?php if (!defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_unidades extends CI_Model
{ // Begin class model_mantcateg

    public function listar_unidades($im, $un, $ie)
    {

        if ($im) {

            $filtro = " and tm_mobil.id_mobil=$im ";
        } else {
            $filtro = " ";
        }

        if ($un > 0) {

            $filtro2 = " and tm_empresas.id_empresa=$ie ";
        } else {
            $filtro2 = " ";
        }

        $hoy = date("Y-m-d");

        $sql = " SELECT 
  tm_mobil.id_mobil, 
  tm_mobil.nombremobil, 
  tm_mobil.commstat, 
  tm_mobil.placa, 
  tm_mobil.observaciones, 
  tm_mobil.f_sistema, 
  tm_mobil.id_empresa, 
  tm_mobil.marca, 
  tm_mobil.modelo, 
  tm_mobil.anofabricacion, 
  tm_mobil.color, 
  tm_mobil.seriemotor, 
  tm_mobil.f_instalacion, 
  tm_mobil.proveedor, 
  tm_mobil.tiposervicio, 
  tm_mobil.vmax, 
  tm_mobil.promc, 
  tm_mobil.kmr, 
  tm_mobil.kms, 
  tm_mobil.tipounidad, 
  tm_mobil.comodin, 
  tm_mobil.id_mobil_anterior, 
  tm_mobil.computadora, 
  tm_mobil.horometro, 
  tm_mobil.otros_servicios, 
  tm_mobil.tipo_vehiculo, 
  tm_mobil.corpesa, 
  tm_mobil.alertacorreo, 
  ts_estadomovil.estado, 
  ts_estadomovil.detalle,
  tm_empresas.razonsocial,
  tm_mobil.alert_consumo1,
  tm_mobil.alert_consumo2
FROM 
  datos.tm_mobil, 
  datos.tm_empresas,
  datos.ts_estadomovil
WHERE 
tm_mobil.id_empresa=tm_empresas.id_empresa and 
  tm_mobil.estado = ts_estadomovil.estado $filtro $filtro2;
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


    public function listar_unidades_xempresa($ie)
    {

        if ($ie) {

            $filtro = " and tm_mobil.id_empresa=$ie ";
        } else {
            $filtro = " ";
        }

        $hoy = date("Y-m-d");

        $sql = " SELECT 
  tm_mobil.id_mobil, 
  tm_mobil.nombremobil, 
  tm_mobil.commstat, 
  tm_mobil.placa

FROM 
  datos.tm_mobil, 
  datos.tm_empresas,
  datos.ts_estadomovil
WHERE 
tm_mobil.id_empresa=tm_empresas.id_empresa and 
  tm_mobil.estado = ts_estadomovil.estado $filtro;
 ";


        $query = $this->db->query($sql);


        if ($query->num_rows() > 0) {

            foreach ($query->result() as $fila) {

                $data[] = $fila;
            }

            return json_encode($data);
            //return "si hay data";
        } else {
            //$resp['data']="sindatos";
            return json_encode(null);
        }

    }

    public function listar_unidad_equipo($im)
    {

        if ($im) {

            $filtro = " and tm_mobil_equipo.id_mobil=$im ";
        } else {
            $filtro = " ";
        }


        $hoy = date("Y-m-d");

        $sql = " SELECT 
  tm_equipo.id_equipo, 
  tm_equipo.fecha_equipo, 
  id_componente.id_com, 
  id_componente.imei, 
  id_componente.adc, 
  id_componente.telefono, 
  id_componente.tipoc, 
  id_componente.tiposim, 
  ts_tipoequipo.descripcion as tipoe, 
  tm_mobil_equipo.id_mobil, 
  tm_mobil_equipo.id_sim, 
  ts_tiposim.descripcion as tiposim
FROM 
  datos.tm_equipo, 
  datos.id_componente, 
  datos.tm_equipo_componente, 
  datos.ts_tipoequipo, 
  datos.tm_mobil_equipo, 
  datos.ts_tiposim
WHERE 
  tm_equipo.id_equipo = tm_equipo_componente.id_equipo AND
  id_componente.id_com = tm_equipo_componente.id_com AND
  id_componente.tipoc = ts_tipoequipo.tipoequipo AND
  id_componente.tiposim = ts_tiposim.tiposim AND
  tm_mobil_equipo.id_equipo = tm_equipo.id_equipo $filtro; ";

// echo $sql;
        $query = $this->db->query($sql);


        if ($query->num_rows() > 0)


            if ($query->num_rows() != 0) {

                foreach ($query->result() as $fila) {

                    $data[] = $fila;
                }

                return json_encode($data);
            } else {
                return False;
            }

    }

    function unidades_sinasignar()
    {
        $sql = "SELECT id_mobil, nombremobil
  FROM datos.tm_mobil where id_mobil not in(SELECT id_mobil FROM datos.tm_mobil_equipo) order by nombremobil;";
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

    function unidades_asignadas()
    {
        $sql = "SELECT id_mobil, nombremobil
  FROM datos.tm_mobil where id_mobil  in(SELECT id_mobil FROM datos.tm_mobil_equipo) order by nombremobil;";
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

    public function asigna_equipo()
    {

        $sql = "INSERT INTO datos.tm_mobil_equipo(
            id_equipo, id_mobil, observaciones)
    VALUES ('" . $this->input->post('listaequipos') . "','" . $this->input->post('listaunidades') . "','" . $this->input->post('comment') . "');";
        $query = $this->db->query($sql);
        if ($query) {
            $sql = "UPDATE datos.tm_equipo SET estado_equipo=1 where id_equipo='" . $this->input->post('listaequipos') . "'";
            $query = $this->db->query($sql);

            return true;
        } else {
            return false;
        }
    }

    public function desasigna_equipo()
    {

        $sql = "delete from datos.tm_mobil_equipo where id_equipo='" . $this->input->post('listaequipos') . "' and id_mobil='" . $this->input->post('listaunidades') . "'";
        $query = $this->db->query($sql);
        if ($query) {
            $sql = "INSERT INTO datos.tm_mobil_equipo_historia(
            id_equipo, id_mobil, observaciones)
    VALUES ('" . $this->input->post('listaequipos') . "','" . $this->input->post('listaunidades') . "','" . $this->input->post('comment') . "');";
            $query = $this->db->query($sql);

            $sql = "UPDATE datos.tm_equipo SET estado_equipo=2 where id_equipo='" . $this->input->post('listaequipos') . "'";
            $query = $this->db->query($sql);

            return true;
        } else {
            return false;
        }
    }

    public function edita_contacto()
    {
        $sql = "update datos.tm_conductores  set 
            nombres='" . $this->input->post('nombrec') . "', 
            apellidop='" . $this->input->post('apellidoc') . "', 
            celular='" . $this->input->post('telefonoc') . "',
            correo='" . $this->input->post('emailc') . "',
            dni='" . $this->input->post('dnic') . "',
            id_empresa='" . $this->input->post('listaempresas') . "',
            cargo='" . $this->input->post('cargoc') . "' 
            where id_conductor='" . $this->input->post('id_conductor') . "'  ";


        echo $sql;


        $query = $this->db->query($sql);
        if ($query) {
            return true;
        } else {
            return false;
        }
    }


    public function nuevo($payload)
    {
        $sql = "INSERT INTO datos.tm_mobil(
            nombremobil,
            placa,
            id_empresa,
            anofabricacion,
            color,
            seriemotor,
            modelo,
            marca,
            observaciones,
            vmax,
            promc,
            kmr,
            horometro,
            comodin,
            computadora,
            alert_consumo1,
            alert_consumo2,
            alertacorreo)
    VALUES  (

   '" . $payload['nombremobil']. "',
   '" . $payload['placa']. "',
   '" . $payload['id_empresa']. "',
   '" . $payload['anofabricacion']. "',
   '" . $payload['color']. "',
   '" . $payload['seriemotor']. "',
   '" . $payload['modelo']. "',
   '" . $payload['marca']. "',
   '" . $payload['observaciones']. "',
   '" . $payload['vmax']. "',
   '" . $payload['promc']. "',
   '" . $payload['kmr']. "',
   '" . $payload['horometro']. "',
   '" . $payload['comodin']. "',
   '" . $payload['computadora']. "',
   '" . $payload['alert_consumo1']. "',
   '" . $payload['alert_consumo2']. "',
   '" . $payload['alertacorreo']. "'
    );
";



        $query = $this->db->query($sql);
        if ($query) {
            return true;
        } else {
            return false;
        }
    }

    public function createRegAlert($payload)
    {
        $sql = "
            INSERT INTO datos.alert(    
            id_mobil,
            id_empresa,
            id_usuario,
            alert_panic,
            alert_speed,
            alert_geocerca,
            observations,
            gps_date,
            updated_at,
            lat_dd,
            long_dd,
            speed,
            course,
            puerta,
            odometervalue,
            can_rpm,
            can_odometer,
            info,
            state_reviewed,
            gps_location,
            state_alert
            )
            VALUES (
            '" . $payload['id_mobil']. "',
                        null,
                        null,
                        false,
                        false,
                        false,
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        'create'
                  );";



        $query = $this->db->query($sql);
        if ($query) {
            return true;
        } else {
            return false;
        }
    }

    public function edita($payload)
    {




        $sql = " UPDATE datos.tm_mobil
   SET nombremobil='" . $payload["nombremobil"]."',

placa='" . $payload["placa"]."',
observaciones='" . $payload["observaciones"]."',

id_empresa='" . $payload["id_empresa"]."',
marca='" . $payload["marca"]."',
modelo='" . $payload["modelo"]."',
anofabricacion='" . $payload["anofabricacion"]."',
color='" . $payload["color"]."',
seriemotor='" . $payload["seriemotor"]."',

vmax='" . $payload["vmax"]."',
promc='" . $payload["promc"]."',
kmr='" . $payload["kmr"]."',
alertacorreo='" . $payload["alertacorreo"]."',
id_flota='" . $payload["id_empresa"]."'

 WHERE id_mobil='" .$payload["id_mobil"]. "'";





//        echo $sql;
        $query = $this->db->query($sql);
        if ($query) {
            return true;
        } else {
            return false;
        }





        if ($this->input->post('campo14')) {
            $alerta_consumo2 = $this->input->post('campo14');
        } else {
            $alerta_consumo2 = 'null';
        }
        if ($this->input->post('campo13')) {
            $alerta_consumo1 = $this->input->post('campo13');
        } else {
            $alerta_consumo1 = 'null';
        }


        $sql = "update datos.tm_mobil set  
          nombremobil='" . $this->input->post('campo1') . "', 
          placa='" . $this->input->post('campo2') . "', 
          id_empresa='" . $this->input->post('listaempresas') . "',
          anofabricacion='" . $this->input->post('campo3') . "',
          color='" . $this->input->post('campo4') . "',
          seriemotor='" . $this->input->post('campo5') . "',
          modelo='" . $this->input->post('campo6') . "',
          marca='" . $this->input->post('campo7') . "',
          observaciones='" . $this->input->post('campo8') . "',
          vmax='" . $this->input->post('campo9') . "',
          promc='" . $this->input->post('campo10') . "',
          kmr='" . $this->input->post('campo11') . "',
          horometro='" . $this->input->post('campo12') . "',
          comodin='" . $this->input->post('lista2') . "',
          computadora='" . $this->input->post('lista3') . "',
          alert_consumo1='" . $this->input->post('campo13') . "',
          alert_consumo2=" . $alerta_consumo2 . ",
          alertacorreo='" . $this->input->post('lista4') . "' 
          where id_mobil='" . $this->input->post('idunidad') . "'  ";


        echo $sql;


        $query = $this->db->query($sql);
        if ($query) {
            return true;
        } else {
            return false;
        }
    }


    public function borra()
    {
        $sql = "update  datos.tm_mobil  set estado=6 where   id_mobil='" . $this->input->post('idunidad') . "'  ";


        $query = $this->db->query($sql);
        if ($query) {
            return true;
        } else {
            return false;
        }
    }

    public function actualizapanico()
    {
        $sql = "update  datos.tm_lastmsg  set panico='" . $this->input->post('estadopanico') . "' where   id_mobil='" . $this->input->post('idmb') . "'  ";


        $query = $this->db->query($sql);
        if ($query) {
            return true;
        } else {
            return false;
        }
    }


    function getMobil($item, $valor)
    {

        $this->db->select('id_mobil, nombremobil, commstat, placa, observaciones, f_sistema, 
       id_empresa, marca, modelo, anofabricacion, color, seriemotor, 
       f_instalacion, estado, proveedor, tiposervicio, vmax, promc, 
       kmr, kms, tipounidad, comodin, id_mobil_anterior, computadora, 
       horometro, otros_servicios, tipo_vehiculo, corpesa, alertacorreo, 
       suspencion, f_ultimoestado, alert_consumo1, alert_consumo2, codigo, 
       estado_unidad, id_modelo, id_flota, id_marca, parada, max_combustible, 
       peso, equipo_tiempo, color_2, archivo_extension, max_peso, motor, 
       cds, tramarsa');
        $this->db->from('datos.tm_mobil');
        $this->db->where($item, $valor);
        $this->db->limit(1);
        $query = $this->db->get();

        if ($query->num_rows() == 1) {

            return $query->row();

        } else {
            return false;

        }

    }

    public function getReg($payload)
    {

        $sql = "SELECT
id_mobil, nombremobil, commstat, placa, observaciones, f_sistema, 
       id_empresa, marca, modelo, anofabricacion, color, seriemotor, 
       f_instalacion, estado, proveedor, tiposervicio, vmax, promc, 
       kmr, kms, tipounidad, comodin, id_mobil_anterior, computadora, 
       horometro, otros_servicios, tipo_vehiculo, corpesa, alertacorreo, 
       suspencion, f_ultimoestado, alert_consumo1, alert_consumo2, codigo, 
       estado_unidad, id_modelo, id_flota, id_marca, parada, max_combustible, 
       peso, equipo_tiempo, color_2, archivo_extension, max_peso, motor, 
       cds, tramarsa
FROM
datos.tm_mobil where 1=1
                AND nombremobil='{$payload['nombremobil']}' 
                limit 1";

        $query = $this->db->query($sql);
        $row = $query->row();

        if (isset($row)) {
            return $row;
        }
        return false;
    }


}
