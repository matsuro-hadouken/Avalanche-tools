#!/bin/bash

curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getCurrentValidators",
    "params": {},
    "id": 4
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P | jq '.'
