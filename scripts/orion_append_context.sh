#!/bin/bash

# show the usage
if [ $# -ne 5 ]; then
echo "Usage: orion_append_context.sh <orion_host> <orion_port> <auth_token> <chatroom> <message>";
exit 1;
fi

# get the arguments
HOST=$1
PORT=$2
TOKEN=$3
CHATROOM=$4
MSG=$5

# do the append
(curl $HOST:$PORT/v1/updateContext -s -S --header 'X-Auth-Token: $TOKEN' --header 'Content-Type: application/json' --header 'Accept: application/json' -d @-) <<EOF
{
    "contextElements": [
        {
            "type": "ChatMessageLastOnly",
            "isPattern": "false",
            "id": "$CHATROOM",
            "attributes": [
            {
                "name": "msg",
                "type": "string",
                "value": "$MSG"
            }
            ]
        }
    ],
    "updateAction": "APPEND"
}
EOF

