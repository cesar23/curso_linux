<?php if ( ! defined('BASEPATH')) exit('El acceso directo a este archivo no esta permitido.');

class modelo_sectores extends CI_Model{ // Begin class model_mantcateg
	   
public function listar_sectores()
   {
   $this->db->select(' a.id_fundo, a.nombrefundo, a.caracteristica, a.area, a.latitud, a.longitud');
    $this->db->from('tp_fundos a'); 
//        $this->db->where('a.id_padre ='.$id);
  
        $this->db->order_by('a.id_fundo');   
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
   /*
   SELECT 
  b.id_sector, 
  b.numero_sector, 
  b.nombre_sector, 
  a.id_fundos
FROM 
  public.tm_fundo_sector a, 
  public.tm_sector b
WHERE 
  b.id_sector = a.id_sector;
*/

/*
public function listar_sectores($id_fundo)
   {
   $this->db->select('  b.id_sector,  b.numero_sector,   b.nombre_sector,   a.id_fundos');
    $this->db->from('tm_fundo_sector a'); 
        $this->db->from('tm_sector b'); 

        $this->db->where('b.id_sector = a.id_sector');
          $this->db->where('a.id_fundos',$id_fundo);

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

public function listar_sectores_sa() 
   {
   $this->db->select('   b.id_sector,   b.numero_sector,   b.nombre_sector');
    $this->db->from('public.tm_sector b'); 

        $this->db->where('b.id_sector not in ( select a.id_sector from  public.tm_fundo_sector a )');
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

   } */
}