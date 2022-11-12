
### GET
```shell
URL_API=http://localhost:3000

curl -i \
-H "Accept: application/json" \
-H "Content-Type: application/json" \
-X GET "${URL_API}/countries"
```


### POST

```shell
URL_API=http://localhost:3000

 generate_post_data()
 {
   cat <<EOF
 {
   "country": "Chile",
   "year" :"2017",
   "days":"30"
 }
 EOF
 }



curl -i \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-X POST --data "$(generate_post_data)" "${URL_API}/country"
```


### GET parametro

```shell
URL_API=http://localhost:3000

curl -i \
-H "Accept: application/json" \
-H "Content-Type: application/json" \
-X GET "${URL_API}/country/1"
```


