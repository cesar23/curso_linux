# Reglas CloudFlare evitar bots en la Paginas Webs


### Google Bot
https://developers.google.com/search/docs/crawling-indexing/overview-google-crawlers#google-inspectiontool


Asi quedaria la regla

<img src="https://i.imgur.com/2zYJTFS.png" >

-- --------------------------


Aqui vermos el contenido del primero

<img src="https://i.imgur.com/4pToSxx.png" >

-- --------------------------

<img src="https://i.imgur.com/hYsv5KG.png" >

-- --------------------------



Este es la expresion que contiene

### Permitir Rastreador Robot de google
```shell
(http.user_agent contains "Google-InspectionTool") or (http.user_agent contains "google.com/mobile/adsbot.html") or (http.user_agent contains "developers.google.com/webmasters/APIs-Google.html") or (http.user_agent contains "Mozilla/5.0 (compatible; Google-Site-Verification/1.0") or (http.user_agent contains "https://support.google.com/webmasters/answer/1061943") or (http.user_agent contains "+http://www.google.com/feedfetcher.html") or (http.user_agent contains "Mediapartners-Google/2.1; +http://www.google.com/bot.html")
```
