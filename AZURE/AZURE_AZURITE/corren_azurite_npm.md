# instlacion y configuracion azurite

fuentes: 
- https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azurite?tabs=npm
- https://marketplace.visualstudio.com/items?itemName=Azurite.azurite


## instalar
```shell
npm install -g azurite

npm i -g azure-functions-core-tools
```
## Correr azurite
```shell
# Launch Azurite for Windows
azurite --silent --location c:\azurite --debug c:\azurite\debug.log

#Launch Azurite for MacOs or Linux:
azurite -s -l /usr/local/lib/node_modules/azurite -d /usr/local/lib/node_modules/azurite/debug.log

# :::::::::::::::::::::::::::: otro
# configiurar puertos
# :::fuente: https://dev.to/kkoziarski/running-azurite-emulator-in-background-on-windows-startup-1nke
start /B /MIN azurite -l "C:\dev\data\Azurite" --blobHost 0.0.0.0 --blobPort 10000 --queueHost 0.0.0.0 --queuePort 10001 --tableHost 0.0.0.0 --tablePort 10002 > "C:\dev\data\Azurite\azurite.log" 2>&1


```
