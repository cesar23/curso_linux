#--------------------------------------------------------------------------------------
#--------------------------------- comando - SED (string editor) -----------------------
#----------------------------------tambien conexpresiones regulares----------------------------
#--------------------------------------------------------------------------------------

echo "---------------------------------------------"
echo "------------ ejemplo : 001-------------------"
echo ""
message='The secret code is 12345'
echo "${message//[0-9]/X}"



echo "---------------------------------------------"
echo "------------ ejemplo : 001-------------------"
echo ""
search="font-family:'Adobe Garamond Pro'"
replace="font-family: 'EB Garamond'"
echo "${search//[0-9]/X}"



echo "---------------------------------------------"
echo "------------ ejemplo : 002-------------------"
echo ""
REPO="D:\repos\curso_mongodb"
echo "repositorio: ${REPO//\\//}"


echo "---------------------------------------------"
echo "------------ ejemplo : 003-------------------"
echo ""
echo "obetner la url"
echo ""
echo 't=2022-08-11T18:25:51-0500 lvl=info msg="started tunnel" obj=tunnels name=web addr=http://localhost:80 url=https://1493-2800-200-f828-80a1-24cb-859a-8238-72e.sa.ngrok.io' | sed  's/^.*=\(.*\).*$/\1/g'
  read 
