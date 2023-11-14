### Reglas CloudFlare evitar bots en la Paginas Webs

---

<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYmPoiiWtHTKkku-xmz8IYtxbhvvdJSsGrk-2-qdgtMU2yoDi2MjfEfv-G-e15dzJ-wJg&usqp=CAU" >

-- --------------------------


# Google Bot (Google crawlers)
https://developers.google.com/search/docs/crawling-indexing/overview-google-crawlers#google-inspectiontool


Asi quedaria la regla

<img src="https://i.imgur.com/W0gFiBx.png" >

-- --------------------------


Aqui vermos el contenido del primero

<img src="img_cloud_flare/ckloudflare_demo_waf_user-agent.png" >



-- --------------------------



Este es la expresion que contiene

### Permitir Rastreador Robot (Google y Bing)
```shell
(http.user_agent contains "Google-InspectionTool") or (http.user_agent contains "google.com/mobile/adsbot.html") or (http.user_agent contains "developers.google.com/webmasters/APIs-Google.html") or (http.user_agent contains "Mozilla/5.0 (compatible; Google-Site-Verification/1.0") or (http.user_agent contains "https://support.google.com/webmasters/answer/1061943") or (http.user_agent contains "+http://www.google.com/feedfetcher.html") or (http.user_agent contains "Mediapartners-Google/2.1; +http://www.google.com/bot.html") or (http.user_agent contains "bingbot/2.0; +http://www.bing.com/bingbot.htm") or (http.user_agent contains "compatible; MicrosoftPreview/2.0; +https://aka.ms/MicrosoftPreview")```
```
---

<img src="https://www.bing.com/rp/QO12R6eZz9WMzJPOio-qN8bXJZ4.png" width="50%" >



# Bing Bot (Bing crawlers)
https://www.bing.com/webmasters/help/which-crawlers-does-bing-use-8c184ec0


[//]: # (-------------------------------------------------------------------&#41;)
[//]: # (-------------------------------------------------------------------&#41;)
[//]: # (-------------------------------------------------------------------&#41;)



# Otra forma de filtro y bloqueo es por ASN

https://ipinfo.io/AS15169#block-ranges



<img src="https://i.imgur.com/CQrvHm7.png" >

-- --------------------------


ver los `ASN`

<img src="https://i.imgur.com/GhkKEB6.png" >

-- --------------------------
