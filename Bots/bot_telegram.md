fuente: https://bl.ocks.org/dideler/85de4d64f66c1966788c1b2304b9caf1
# bot telegram

### 1 .Create a bot
 como crearlo: https://www.youtube.com/watch?v=Z7aN0xfn5NM

![](https://i.imgur.com/sOkDlbR.png) 


### 2. necesitamos obtener el Id del chat del bot
curl https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/getUpdates
```shell
BOT_TOKEN="5583198940:AAGgiD5jyXD4hhoOd1aCzm0IL2QNssZaP6s"
curl "https://api.telegram.org/bot${BOT_TOKEN}/getUpdates" | jq

#  salida

#{
#  "ok": true,
#  "result": [
#    {
#      "update_id": 372798751,
#      "message": {
#        "message_id": 2,
#        "from": {
#          "id": 963236317,
#          "is_bot": false,
#          "first_name": "Cesar",
#          "language_code": "en"
#        },
#        "chat": {
#          "id": 963236317,
#          "first_name": "Cesar",
#          "type": "private"
#        },
#        "date": 1660178150,
#        "text": "hola"
#      }
#    }
#  ]
#}

```

Ahora que ya tenemos el id `963236317`

```shell
MESSAGE_BOT=" salida"

curl -X POST \
-H 'Content-Type: application/json' \
-d "{\"chat_id\": \"963236317\", \"text\": \"${MESSAGE_BOT}\", \"disable_notification\": true}" \
https://api.telegram.org/bot5583198940:AAGgiD5jyXD4hhoOd1aCzm0IL2QNssZaP6s/sendMessage

```
