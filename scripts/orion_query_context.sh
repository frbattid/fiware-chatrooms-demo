#!/bin/bash

# show the usage
if [ $# -ne 4 ]; then
echo "Usage: cosmos_read.sh <orion_host> <orion_port> <auth_token> <chatroom>";
exit 1;
fi

# get the arguments
HOST=$1
PORT=$2
TOKEN=$3
CHATROOM=$4

# do the query context
(curl $HOST:$PORT/v1/queryContext -s -S --header 'X-Auth-Token: '$TOKEN'' --header 'Content-Type: application/json' --header 'Accept: application/json' -d @-) <<EOF
{
    "entities": [
        {
            "type": "ChatMessageLastOnly",
            "isPattern": "false",
            "id": "$CHATROOM"
        }
    ]
}
EOF

