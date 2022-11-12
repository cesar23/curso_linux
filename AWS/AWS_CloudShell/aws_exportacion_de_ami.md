# exportacion de ami de ec2

fuente: https://docs.aws.amazon.com/es_es/vm-import/latest/userguide/vmexport.html


## 1. Identificar nuestro id de EC2

identicicar el ami de nuestro ec2 `i-05e1ca8d4353d50a5` y ponerlo en stop

<img width="90%" src="https://i.imgur.com/AvzrPiX.png" alt="My cool logo"/>

-- --

## 2. Crear Bucket y dar permisos ACL

<img width="90%" src="https://i.imgur.com/WmjQP50.png" alt="My cool logo"/>

-- --

configurar los acls

<img width="90%" src="https://i.imgur.com/BPAdTev.png" alt="My cool logo"/>

-- --
Ahi dentro ubicaremos y modificaremso los permisos

<img width="90%" src="https://i.imgur.com/yX8ZKlk.png" alt="My cool logo"/>

-- --

-- --


el backet q usaremos sera: `backup-ami-cesar2`

` cat  file.json`
```shell
{
    "ContainerFormat": "ova",
    "DiskImageFormat": "VMDK",
    "S3Bucket": "backup-ami-cesar2"
   
}
```

```shell
aws ec2 create-instance-export-task --instance-id i-05e1ca8d4353d50a5 --target-environment vmware --export-to-s3-task file://./file.json
# output:
#   {
#       "ExportTask": {
#           "ExportTaskId": "export-i-00308e48fad3570b7",
#           "ExportToS3Task": {
#               "ContainerFormat": "ova",
#               "DiskImageFormat": "vmdk",
#               "S3Bucket": "backup-ami-cesar2",
#               "S3Key": "export-i-00308e48fad3570b7.ova"
#           },
#           "InstanceExportDetails": {
#               "InstanceId": "i-05e1ca8d4353d50a5",
#               "TargetEnvironment": "vmware"
#           },
#           "State": "active"
#       }
#   }
```

salida: 

<img width="90%" src="https://i.imgur.com/CLRa1uq.png" alt="My cool logo"/>

-- --

### Supervisa una tarea de exportación de instancias
Para supervisar la exportación de la instancia, utilice lo siguientedescribe-export-taskscomando:

le indicaremos el id de la exportacion generada: `export-i-00308e48fad3570b7`

```shell
aws ec2 describe-export-tasks --export-task-ids export-i-00308e48fad3570b7

```

### Cancelar una tarea de exportación de instancias
Si es necesario, puede utilizar lo siguientecancel-export-taskpara cancelar la exportación de una instancia que está en curso.

```shell
aws ec2 cancel-export-task --export-task-id export-i-1234567890abcdef0
```
