# creamos  una funcion para recepcionar las colas


desde visual code

<img width="100%" src="https://i.imgur.com/CuwfN45.png" alt="My cool logo"/>

<img width="100%" src="https://i.imgur.com/OhaEWme.png" alt="My cool logo"/>

Aqui le  ponemos el nombre que ira  a tener nuestro servis bus que  consumira la cola

<img width="100%" src="https://i.imgur.com/pcjtEPr.png" alt="My cool logo"/>


Ahora aqu viene la parte donde nos preguntara cual es  la variable de entorno que
contiene el nombre de la cola

<img width="100%" src="https://i.imgur.com/n8j1b2A.png" alt="My cool logo"/>


como se  muestra en al imagen

<img width="100%" src="https://i.imgur.com/2TWlgIw.png" alt="My cool logo"/>


ahora  solo pulsamos  enter y  ya  estara creada
Aqui le  decimos 😎 permiso para crear y leer

<img width="100%" src="https://i.imgur.com/ENlPZ9t.png" alt="My cool logo"/>

## Como esta estructurado

<img src="https://i.imgur.com/mgXHLw6.png" >

-- --------------------------

fichero `index.ts` esto

```typescript
import { AzureFunction, Context } from '@azure/functions';
// import sendCountrySkuPush from '../src/services/serviceBus/sendCountrySkuPush';
const sendCountrySkuPush = require('../src/services/serviceBus/sendCountrySkuPush');

const handler: AzureFunction = async (context, item) => {
  return await sendCountrySkuPush.handler(context, item);
};
export { handler };

```
fichero `function.json` esto

```json
{
  "bindings": [
    {
      "name": "mySbMsg",
      "type": "serviceBusTrigger",
      "direction": "in",
      "queueName": "send-availability-country-sku",
      "connection": "AZURE_SERVICEBUS_LOCALQUEUE_CONNECTION_STRING"
    }
  ],
  "scriptFile": "../dist/send_event_country_sku/index.js"
}

```
fichero `sendCountrySkuPush.ts` esto


```typescript
import config from '../../repository/endpoints/config';
import ProductsSkuCosmos from '../../repository/cosmos/productsSkuCosmos';
import Logger from '../../helpers/logger.helpers';
const logger = new Logger();
export const handler: any = async (context: any, item: any) => {
  try {
    let result;

    const productsSkuDb = ProductsSkuCosmos.getInstance();
    await productsSkuDb.init();
    await productsSkuDb.upsertProductSku(item.data.sku, item.store.country, item.store.customerId);
    logger.trace(item.store.customerId, { body: item.data }, false, 'SSB0002', item.store.country);
  } catch (error) {
    logger.error(
      item.store.customerId,
      { body: { item, msg: 'an error ocurred while saving' } },
      false,
      'SSBE003',
      item.store.country,
    );
    context.log.error('ERROR sending country sku', error);
  }
};

```
