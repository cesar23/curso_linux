# creacion de colas 
fuente
- https://learn.microsoft.com/en-us/azure/service-bus-messaging/service-bus-nodejs-how-to-use-queues?tabs=passwordless
- Video : https://www.youtube.com/watch?v=5UfI-o00D2s


<img width="100%" src="https://i.imgur.com/cKYaG7f.png" alt="My cool logo"/>


creamos la cola

<img width="100%" src="https://i.imgur.com/46JwYJ9.png" alt="My cool logo"/>



```javascript
export class ServiceBusMessage {
    body: any;
    contentType: any;
    constructor(data: any) {
        this.body = data;
        this.contentType = 'application/json';
    }
};






export const sendBatchStoreSkuEventQueu: any = async (
) => {
  try {
    const connectionString = "Endpoint=sb://ixc-ecom-fema-crocs-180-uat-bus.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=xxxxxxxxxxxxxxxx";
    const serviceBus = new ServiceBusClient(config.localQueue.host);// cenexion string
    const sender = serviceBus.createSender(config.localQueue.sendEventAvailabilityCountrySku);//name cola

    await sender.sendMessages({
      body: "Hello, world!",
      applicationProperties: {"my-property": "my-value"},
    });
    console.log("Message sent");

    await sender.close();
    await serviceBus.close();
  }catch (e) {
    console.log('>>>>>>>>>Error:')
    console.log(e)

  }
};

```
creamos la cola batch

```javascript
// create a Service Bus client using the passwordless authentication to the Service Bus namespace
    const sbClientLocalQueue = new ServiceBusClient(config.localQueue.host);

    // createSender() can also be used to create a sender for a topic.
    const sender = sbClientLocalQueue.createSender(config.localQueue.sendEventAvailabilityCountrySku);

    let batch = await sender.createMessageBatch();
    for (let i = 0; i < Data.length; i++) {
      const message = new ServiceBusMessage({
        event: event,
        store,
        data: fnProcesData(Data[i]),
      });

      // try to add the message to the batch
      if (!batch.tryAddMessage(message)) {
        await sender.sendMessages(batch);
        // then, create a new batch
        batch = await sender.createMessageBatch();

        // now, add the message failed to be added to the previous batch to this batch
        if (!batch.tryAddMessage(message)) {
          // if it still can't be added to the batch, the message is probably too big to fit in a batch
          logger.error(
              store.customerId,
              { body: { message, msg: 'Message too big to fit in a batch' } },
              false,
              'EVBHL0001',
              store.country,
          );
        }
      }
    }

    // Send the last created batch of messages to the queue
    await sender.sendMessages(batch);
    logger.trace(
        store.customerId,
        {
          msg: `Sent a batch of messages to the queue: ${store.customerId} cantidad: ${Data.length}`,
        },
        false,
        'EVBHL0000',
        store.country,
    );
    // Close the sender
    await sender.close();
    await sbClientLocalQueue.close();


```
