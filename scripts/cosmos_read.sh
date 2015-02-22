#!/bin/bash

# show the usage
if [ $# -ne 3 ]; then
echo "Usage: cosmos_read.sh <cosmos_host> <cosmos_port> <chatroom>";
exit 1;
fi

# get the arguments
HOST=$1
PORT=$2
CHATROOM=$3

# do the read
curl "http://$HOST:$PORT/webhdfs/v1/user/frb/hamburg/chatrooms/"$CHATROOM"_chatmessagelastonly/"$CHATROOM"_chatmessagelastonly.txt?user.name=frb&op=open"
