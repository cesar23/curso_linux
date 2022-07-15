
#install
sudo apt install jq


#uso
jq . demo.json

cat demo.json | jq

# minimizar  archivo

cat demo.json | jq -c
jq -c < demo.json
