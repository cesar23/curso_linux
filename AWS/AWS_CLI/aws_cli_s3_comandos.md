# comandos aws cli s3


## 1. Descargar ficheros 
```shell

aws s3 cp \
  "s3://backup-ami-cesar2/export-i-0d285f74b9425a78f.ova" \
  "E:\virtuales\aws_ubuntu\export-i-0d285f74b9425a78f.ova" \
   --bash.bashrc.sh eucim 


aws s3 cp \
  "s3://backup-ami-cesar2/Meslo.zip" \
  "E:\virtuales\aws_ubuntu\Meslo.zip" \
   --bash.bashrc.sh eucim 
   
aws s3 cp "s3://backup-ami-cesar2/dir/install.sh" "/e/virtuales/aws_ubuntu/install.sh" --bash.bashrc.sh eucim
```
