#!/bin/bash

echo

NODE_ID=$(curl -s -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"info.getNodeID"
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/info | jq -r '.result | .nodeID')

echo "$NODE_ID" && echo

echo & echo "https://avascan.info/staking/validator/$NODE_ID"
