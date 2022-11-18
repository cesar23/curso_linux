#!/bin/bash
sudoCount=0
url_web=""
url_ssh=""
while read line; do
    sudoBool=0

    # ::::::::::: buscamos (name=web)
    if [[ "$line" = *name=web* ]]; then
        sudoBool=1
        (( sudoCount++ ))
#       let url_fin= $( echo $line | sed  's/^.*=\(.*\).*$/\1/g')
       url_web="$(echo "$line" |sed  's/^.*=\(.*\).*$/\1/g')"
        # do something with sudobool ?
    fi

    # ::::::::::: buscamos (name=ssh)
    if [[ "$line" = *name=ssh* ]]; then
            sudoBool=1
            (( sudoCount++ ))
    #       let url_fin= $( echo $line | sed  's/^.*=\(.*\).*$/\1/g')
           url_ssh="$(echo "$line" |sed  's/^.*=\(.*\).*$/\1/g')"
            # do something with sudobool ?
    fi
done < ngrok.log
echo " url web: $url_web "
echo " url ssh: $url_ssh "


#echo 't=2022-08-11T18:25:51-0500 lvl=info msg="started tunnel" obj=tunnels name=web addr=http://localhost:80 url=https://1493-2800-200-f828-80a1-24cb-859a-8238-72e.sa.ngrok.io' | sed  's/url=+\(.*\)/\1/g'
#echo 't=2022-08-11T18:25:51-0500 lvl=info msg="started tunnel" obj=tunnels name=web addr=http://localhost:80 url=https://1493-2800-200-f828-80a1-24cb-859a-8238-72e.sa.ngrok.io' | sed  's/^.*=\(.*\).*$/\1/g'
#message= 't=2022-08-11T18:25:51-0500 lvl=info msg="started tunnel" obj=tunnels name=web addr=http://localhost:80 url=https://1493-2800-200-f828-80a1-24cb-859a-8238-72e.sa.ngrok.io'
#message='The secret code is 12345'
#echo "${message/'s/^.*,\([0-9][0-9]*\).*$/\1/g}"