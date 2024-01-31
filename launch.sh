#!/bin/bash

if [[ -z $1 ]];
then 
    echo "Please, give me a pokemon name in the arguments"
else
    curlResponse=$(curl -s https://pokeapi.co/api/v2/pokemon/$1)

    if [[ $curlResponse = "Not Found" ]];
    then
        echo "Who's that pokemon?"
    else
        echo -e "Name = $(echo $curlResponse | jq -r '.name')\nId = $(echo $curlResponse | jq '.id')\nWeight = $(echo $curlResponse | jq '.weight')\nHeight = $(echo $curlResponse | jq '.height')" 
    fi
        
fi