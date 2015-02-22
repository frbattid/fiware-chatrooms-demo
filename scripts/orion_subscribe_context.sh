#!/bin/bash

# show the usage
if [ $# -ne 6 ]; then
echo "Usage: orion_subscribe_context.sh <orion_host> <orion_port> <auth_token> <cygnus_host> <cygnus_port> <cygnus_target>";
exit 1;
fi

# get the arguments
ORION_HOST=$1
ORION_PORT=$2
TOKEN=$3
CYGNUS_HOST=$4
CYGNUS_PORT=$5
CYGNUS_TARGET=$6

# do the subscribe context
(curl $ORION_HOST:$ORION_PORT/v1/subscribeContext -s -S --header 'X-Auth-Token: '$TOKEN'' --header 'Content-Type: application/json' --header 'Accept: application/json' -d @-) <<EOF
{
    "entities": [
        {
            "type": "ChatMessageLastOnly",
            "isPattern": "true",
            "id": ".*"
        }
    ],
    "reference": "http://$CYGNUS_HOST:$CYGNUS_PORT/$CYGNUS_TARGET",
    "duration": "P5Y",
    "notifyConditions": [
        {
            "type": "ONCHANGE",
            "condValues": [
                "msg"
            ]
        }
    ]
}
EOF

