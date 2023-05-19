# 1. configuraciond e AZURE  CLI

descarga oficial: https://learn.microsoft.com/en-us/cli/azure/get-started-with-azure-cli

### 1.1 ingresar desde la web
<img src="https://i.imgur.com/cJqIRni.png" alt="My cool logo"/>

-- --


### 1.2 configuracion local
```shell
# ejecutar esto si queremos agregar mas de una cuenta
az config set core.allow_broker=true
az account clear


# esto mandara para que  te  logues en la web
az login
```
<img src="https://i.imgur.com/sW0pTjH.png" alt="My cool logo"/>

-- --

luego de eso ya   estaremos  logeados


<img src="https://i.imgur.com/9iW3r9C.png" alt="My cool logo"/>

-- --

### 1.3 Comandos

Comandos para listar recursos

```powershell
az group list
```
<img src="https://i.imgur.com/bgbwnKg.png" alt="My cool logo"/>

-- --
mas comandos
```powershell
az group list

az group list -o json
az group list -o jsonc
az group list -o tsv 
az group list -o table
az group list -o yaml

az group list --query "[].name"

az group list --query "[].{alias:name}" -o table

az group list --query "[]" (everything)

az group list --query "[?location=='westeurope']"
```



## 2.Configurar  cuenta como principal

primero mirar las cuentas disponibles

```powershell
az account list --output table

# Name                 CloudName    SubscriptionId                        TenantId                              State    IsDefault
# -------------------  -----------  ------------------------------------  ------------------------------------  -------  -----------
# principal            AzureCloud   7d79c5b5-fe5d-4260-bcd8-26ed70a606e7  5f794a2b-fa46-4bb2-956e-7a63393e6721  Enabled  True
# IXComercio-Platform  AzureCloud   665d7b77-2f6a-42d0-8157-c5f343fa2a13  c1eb8a44-807e-4c5c-a4b7-35b1d40f0589  Enabled  False
```

Ahora ya podemos setear las cuentas en las cuales queremos trabajar
```powershell
# -----------------------------------------------------------
# ::::::::::::::: 💊 Setear cuenta INTCOMEX 
# -----------------------------------------------------------
az account set --name IXComercio-Platform


# miramos sus grupo de recursos
az group list --output table
# Name                             Location    Status
# -------------------------------  ----------  ---------
# IXC-ECOM-FEMA-CROCS-180-UAT      eastus2     Succeeded
# IXC-ECOM-FEMA-YUJU-ADAPTER-UAT   eastus2     Succeeded
# IXC-ECOM-FEMA-CROCS-180-PROD     eastus2     Succeeded
# IXC-OMNI-GORD-WEBHOOK-YUJU-DEV   eastus2     Succeeded
# IXC-OMNI-GORD-WEBHOOK-YUJU-PROD  eastus2     Succeeded



# -----------------------------------------------------------
# ::::::::::::::: 💊 Setear cuenta MIA
# -----------------------------------------------------------
az account set --name principal



# miramos sus grupo de recursos
az group list --output table
# Name                      Location    Status
# ------------------------  ----------  ---------
# test                      eastus      Succeeded
# Function                  eastus      Succeeded
# DefaultResourceGroup-EUS  eastus      Succeeded

```