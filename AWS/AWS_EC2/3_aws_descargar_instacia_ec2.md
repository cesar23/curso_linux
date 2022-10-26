# como descargar instacia EC2 localmente
fuente oficial: 
- https://docs.aws.amazon.com/es_es/vm-import/latest/userguide/vmexport.html

## 1. preprarar bucket

1. crear el bucket y le habilitamos el ACL

<img width="100%" src="https://i.imgur.com/HvBeLh6.png" alt="My cool logo"/>

2. editar el bucket en al seccion acl
<img width="100%" src="https://i.imgur.com/mm6uL3g.png" alt="My cool logo"/>

-- -- 
3. ya dentro en `Access for other AWS accounts` activamos los check

<img width="100%" src="https://i.imgur.com/nSd8qgg.png" alt="My cool logo"/>

-- -- 

## 2.Iniciar una tarea de exportación de instancias

Para exportar la instancia, utilice lacreate-instance-export-taskcomando. El archivo exportado se escribe en el depósito de S3 especificado en la siguiente clave de S3:prefixexport-i-xxxxxxxxxxxxxxxxx.formato(por ejemplo, my-export-bucket/vms/export-i-1234567890abcdef0.ova).

- preparamos el archivo de configuracion para exportar
```shell
aws ec2 create-instance-export-task \
  --instance-id instance-id \
  --target-environment vmware \
  --export-to-s3-task file://C:\file.json
```



- El archivo `file.json` es un documento JSON que contiene la información necesaria.

```shell
{
"ContainerFormat": "ova",
"DiskImageFormat": "VMDK",
"S3Bucket": "my-export-bucket",
"S3Prefix": "vms/"
}
```



## Usado para eucim
<img  src="https://cesar23.github.io/cdn_webs/iconos_png/aws_cloudShell.png" alt="My cool logo"/>

Ultimo usado para  exportar lo de eucim desde `AWS CloudShell`

```shell
# para usar la region d e sau paulo
# export AWS_DEFAULT_REGION=sa-east-1
# el de configuracion
path_file="./ec2_file_export.json"
id_instance="i-08f4c67cddfbae129"

# el script de exportacion
aws ec2 create-instance-export-task \
  --instance-id $id_instance \
  --target-environment vmware \
  --export-to-s3-task file://$path_file --profile eucim
```

El archivo `ec2_file_export.json`
```shell
{
"ContainerFormat": "ova",
"DiskImageFormat": "VMDK",
"S3Bucket": "backup-ami-cesar2"
}
```

<img width="100%" src="https://i.imgur.com/j5CT05j.png" alt="My cool logo"/>

-- -- 




- Supervisa una tarea de exportación de instancias
```shell
aws ec2 describe-export-tasks --export-task-ids export-i-1234567890abcdef0
```

- Cancelar una tarea de exportación de instancias
```shell
aws ec2 cancel-export-task --export-task-id export-i-1234567890abcdef0
```
