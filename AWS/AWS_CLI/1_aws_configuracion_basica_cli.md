# 1. configuraciond e AWS CLI

descarga oficial: https://aws.amazon.com/es/cli/

### 1.2 configuracion
```shell
aws --version
# aws-cli/1.26.1 Python/3.8.10 Windows/10 botocore/1.28.1


# ---------- configurar bash.bashrc.sh default
aws configure
# ---------- configurar bash.bashrc.sh cesar
aws configure --bash.bashrc.sh cesar

# ---- configurar asignando un profile
aws configure --profile cesar

# ------ lista  los  rpfiles
aws configure list-profiles

# -informacion del profile  actual
aws sts get-caller-identity


```
### 1.3 desde la consola
```shell
$ aws configure --bash.bashrc.sh produser
AWS Access Key ID [None]: xxxxxxxxxxxxxxxxxxxxx
AWS Secret Access Key [None]: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Default region name [None]: us-east-1
Default output format [None]: text
```

crear o editar manualmente la ruta `C:\Users\Cesar\.aws`

_**~/.aws/config (Linux & Mac) or %USERPROFILE%\.aws\config (Windows)**_
 
ahi dentro deberiamos crear los siguientes archivos: `config` y `credentials`

fichero: `nano ~/.aws/credentials`
```shell
# ::::: por defecto si no se usa:  --bash.bashrc.sh <elegido>

[default]
aws_access_key_id=AKxxxxxxxxxxxxxxx
aws_secret_access_key=u3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


# ::::: se usuara  --bash.bashrc.sh eucim
# --------- ejemplo: aws s3 ls --bash.bashrc.sh eucim

[eucim]
aws_access_key_id=Axxxxxxxxxxxxxxx
aws_secret_access_key=cxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

fichero: `nano ~/.aws/config`

```shell
# :: bash.bashrc.sh defecto la regiuon de virgina
[default]
region = us-east-1
output=json

# :: bash.bashrc.sh eucim la regiuon de sau paulo
[bash.bashrc.sh eucim]
#::::: sau paulo
region = sa-east-1
output=text
```

# 2. Ejemplos de comandos CLI
lista todos las instancas de Eucin en la zona de disponibilidad
```shell
aws ec2 describe-instances --bash.bashrc.sh eucim

# seteando la zona e virginia
export AWS_DEFAULT_REGION=us-east-1
export AWS_DEFAULT_REGION=sa-east-1
aws ec2 describe-instances --bash.bashrc.sh eucim
```

listar bucket s3
```shell
aws s3 ls --bash.bashrc.sh eucim
aws s3 ls --bash.bashrc.sh cesar
```

# 3. pasar credenciales por enviroment
Para Linux o Mac
```shell
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-west-2

# para definir que profile usaremos
export AWS_PROFILE=cesar
```
Para  windows
```bash
C:\> setx AWS_ACCESS_KEY_ID AKIAIOSFODNN7EXAMPLE
C:\> setx AWS_SECRET_ACCESS_KEY wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
C:\> setx AWS_DEFAULT_REGION us-west-2
# para definir que profile usaremos
C:\> setx AWS_PROFILE cesar
```

para  powerShell
```powershell
$Env:AWS_ACCESS_KEY_ID="AKIAIOSFODNN7EXAMPLE"
$Env:AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
$Env:AWS_DEFAULT_REGION="us-west-2"
```

### veriicar que usuario estamos trabajando
```shell
aws sts get-caller-identity
# output:

#   {
#       "UserId": "AIDA22BBY3MPMNSJSBRLM",
#       "Account": "743100177182",
#       "Arn": "arn:aws:iam::743100177182:user/userDevops"
#   }
   

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
[bash.bashrc.sh eucim]
region = sa-east-1
output=json

# ------------------------------------------------
[bash.bashrc.sh cesar]
region = us-east-1
output=json
```
