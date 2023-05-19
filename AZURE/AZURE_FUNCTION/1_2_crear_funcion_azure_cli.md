# creacion de funcion mediante azure client

#### lista de regiones
```powershell
 az functionapp list-consumption-locations --output table
```

#### Comandos para crear Funcion
```powershell
# -------------------------------
# 1. Create a Resource Group
# -------------------------------
$resourceGroup = "AzureFunctionsDemo"
#$location = "East US" #Virginia
$location = "eastus" #Virginia
az group create -n $resourceGroup -l $location


# -------------------------------
# 2. Create a storage account (❌ esto no funciono crearlo manualmente)
# -------------------------------

$rand = Get-Random -Minimum 10000 -Maximum 99999
$storageAccountName = "funcsdemo$rand"

az storage account create `
  -n $storageAccountName `
  -l $location `
  -g $resourceGroup `
  --sku Standard_LRS

# -------------------------------
#  3. Create an Application Insights instance
# -------------------------------
$appInsightsName = "funcsmsi$rand"
az resource create `
  -g $resourceGroup -n $appInsightsName `
  --resource-type "Microsoft.Insights/components" `
  --properties '{\"Application_Type\":\"web\"}'


# -------------------------------
# 4. Create a Function App
# -------------------------------
$functionAppName = "funcs-demo-$rand"

az functionapp create --resource-group $resourceGroup `
    --consumption-plan-location $location `
    --app-insights $appInsightsName `
    --runtime node `
    --runtime-version 18 `
    --functions-version 4 `
    --name $functionAppName `
    --storage-account $storageAccountName


```


