# 1. configuraciond e AWS CLI

descarga oficial: https://aws.amazon.com/es/cli/

### 1.2 configuracion
```shell
aws --version
# aws-cli/1.26.1 Python/3.8.10 Windows/10 botocore/1.28.1


# ---------- configurar profile default
aws configure
# ---------- configurar profile cesar
aws configure --profile cesar
```
### 1.3 desde la consola
```shell
$ aws configure --profile produser
AWS Access Key ID [None]: AKIAI44QH8DHBEXAMPLE
AWS Secret Access Key [None]: je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
Default region name [None]: us-east-1
Default output format [None]: text
```

crear o editar manualmente la ruta `C:\Users\Cesar\.aws`

_**~/.aws/config (Linux & Mac) or %USERPROFILE%\.aws\config (Windows)**_
 
ahi dentro deberiamos crear los siguientes archivos: `config` y `credentials`

fichero: `nano ~/.aws/credentials`
```shell
# ::::: por defecto si no se usa:  --profile <elegido>

[default]
aws_access_key_id=AKxxxxxxxxxxxxxxx
aws_secret_access_key=u3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


# ::::: se usuara  --profile eucim
# --------- ejemplo: aws s3 ls --profile eucim

[eucim]
aws_access_key_id=Axxxxxxxxxxxxxxx
aws_secret_access_key=cxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

fichero: `nano ~/.aws/config`

```shell
# :: profile defecto la regiuon de virgina
[default]
region = us-east-1
output=json

# :: profile eucim la regiuon de sau paulo
[profile eucim]
#::::: sau paulo
region = sa-east-1
output=text
```

# 2. Ejemplos de comandos CLI
lista todos las instancas de Eucin en la zona de disponibilidad
```shell
aws ec2 describe-instances --profile eucim

# seteando la zona e virginia
export AWS_DEFAULT_REGION=us-east-1
export AWS_DEFAULT_REGION=sa-east-1
aws ec2 describe-instances --profile eucim
```

listar bucket s3
```shell
aws s3 ls --profile eucim
aws s3 ls --profile cesar
```

# 3. pasar credenciales por enviroment
Para Linux o Mac
```shell
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-west-2
```
Para  windows
```bash
C:\> setx AWS_ACCESS_KEY_ID AKIAIOSFODNN7EXAMPLE
C:\> setx AWS_SECRET_ACCESS_KEY wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
C:\> setx AWS_DEFAULT_REGION us-west-2
```

para  powerShell
```powershell
$Env:AWS_ACCESS_KEY_ID="AKIAIOSFODNN7EXAMPLE"
$Env:AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
$Env:AWS_DEFAULT_REGION="us-west-2"
```


## configuracion de Laptop
fichero: `nano ~/.aws/credentials`

```shell
# [default]
# aws_access_key_id=xxxxxxxxxxx
# aws_secret_access_key=xxxxxxxx

# -------------------------------------------------
# ::::: Cuenta de EUCIM
# Accound Id: 252878719353
# Iam User: cauris

[eucim]
aws_access_key_id=xxxxxxxxxxxxxxxx
aws_secret_access_key=cxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

# -------------------------------------------------
# ::::: Cuenta de CESAR
# Accound Id: 743100177182
# Iam User: cesar
[cesar]
aws_access_key_id=xxxxxxxxxxxxxxxxxxxx
aws_secret_access_key=xxxxxxxxxxxxxxxxxxxxxxxxxx
```



fichero: `nano ~/.aws/config`

```shell
# ------------------------------------------------
# [default]
# region = us-east-1
# output=json

# ------------------------------------------------
[profile eucim]
region = sa-east-1
output=json

# ------------------------------------------------
[profile cesar]
region = us-east-1
output=json
```