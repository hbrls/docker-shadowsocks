#!/bin/bash -e


CONFIG="shadowsocks.json"


if [[ -f $CONFIG ]]
  then
    rm $CONFIG
fi


PORT=3108
if [[ -n "$SS_PORT" ]]
  then PORT=$SS_PORT
fi


TIMEOUT=300
if [[ -n "$SS_TIMEOUT" ]]
  then TIMEOUT=$SS_TIMEOUT
fi


METHOD="aes-256-cfb"
if [[ -n "$SS_METHOD" ]]
  then METHOD=$SS_METHOD
fi


PASSWORD="youshallnotpass"
if [[ -n "$SS_PASSWORD" ]]
  then PASSWORD=$SS_PASSWORD
fi


echo "{" >> $CONFIG
echo "  \"server\": \"0.0.0.0\"," >> $CONFIG
echo "  \"server_port\": $PORT," >> $CONFIG
echo "  \"password\": \"$PASSWORD\"," >> $CONFIG
echo "  \"timeout\": $TIMEOUT," >> $CONFIG
echo "  \"method\": \"$METHOD\"," >> $CONFIG
echo "  \"fast_open\": false," >> $CONFIG
echo "  \"workers\": 1" >> $CONFIG
echo "}" >> $CONFIG

ssserver -c $CONFIG

