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
        printf "Nombre:%s\nID: %d\nWeight: %d\nHeight: %d\n" $(echo "$curlResponse" | jq -r '.name, .id, .weight, .height')
    fi
        
fi