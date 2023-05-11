# 1. configuraciond e AZURE  CLI

descarga oficial: https://learn.microsoft.com/en-us/cli/azure/get-started-with-azure-cli

### 1.1 ingresar desde la web
<img src="https://i.imgur.com/cJqIRni.png" alt="My cool logo"/>

-- --


### 1.2 configuracion local
```shell
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
