#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: No YAML file provided."
  echo "Usage: $0 <YAML FILE>"
  exit 1
fi

#xdg-open http://localhost:8080 & MY_UID="$(id -u)" MY_GID="$(id -g)" docker compose up
export MY_UID="$(id -u)" 
export MY_GID="$(id -g)" 

mkdir -p ./assets/config
mkdir -p ./assets/recordings
mkdir -p ./assets/masks
mkdir -p ./assets/wsdl
cp $1 ./temp_config.yaml

while :; do 
    #read -p "Select d(efault), c(uda) or r(with rstudio) to specify which compose option to run? " runOption
    read -p "Select d(efault), c(uda) or r(with rstudio) to specify which compose option to run? " runOption
    response_lower=$(echo "$runOption" | tr '[:upper:]' '[:lower:]')
    if [ "$response_lower" = "default" ] || [ "$response_lower" = "d" ]; then
        echo "Running docker compose using Default option"
        docker compose --file ./docker/docker-compose.yaml up  
        break
    elif [ "$response_lower" = "cuda" ] || [ "$response_lower" = "c" ]; then
        echo "Running docker compose using Cuda option"
        docker compose --file ./docker/docker-compose-cuda.yaml up  
        break
    elif [ "$response_lower" = "with rstudio" ] || [ "$response_lower" = "r" ]; then
        echo "Running docker compose using Excl rStudio option"
        docker compose  \
            --file ./docker/docker-compose-rstudio.yaml up
        break
    else
        echo "Invalid response. Please enter 'd(efault)' or 'r(studio)'."
    fi
done

echo ""
