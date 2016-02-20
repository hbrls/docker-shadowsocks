#!/bin/sh -e


CONFIG="shadowsocks.json"


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

{
  echo "{"
  echo "  \"server\": \"0.0.0.0\","
  echo "  \"server_port\": $PORT,"
  echo "  \"password\": \"$PASSWORD\","
  echo "  \"timeout\": $TIMEOUT,"
  echo "  \"method\": \"$METHOD\","
  echo "  \"fast_open\": false,"
  echo "  \"workers\": 1"
  echo "}"
} > $CONFIG

exec /usr/bin/supervisord -c /etc/supervisord.conf

