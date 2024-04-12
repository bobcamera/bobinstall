#!/bin/bash

#xdg-open http://localhost:8080 & MY_UID="$(id -u)" MY_GID="$(id -g)" docker compose up
export MY_UID="$(id -u)" 
export MY_GID="$(id -g)" 

while :; do 
    read -p "Select d(efault), e(xcl rstudio), t(est) or h(eadless) to specify which compose option to run?" runOption
    response_lower=$(echo "$runOption" | tr '[:upper:]' '[:lower:]')
    if [ "$response_lower" = "default" ] || [ "$response_lower" = "d" ]; then
        echo "Running docker compose using Default option"
        docker compose  \
            --file ./docker/docker-compose.yaml  \
            --env-file .env  \
            up
        break
    elif [ "$response_lower" = "excl rstudio" ] || [ "$response_lower" = "e" ]; then
        echo "Running docker compose using Excl rStudio option"
        docker compose  \
            --file ./docker/docker-compose-rstudioless.yaml  \
            --env-file .env  \
            up
        break
    elif [ "$response_lower" = "test" ] || [ "$response_lower" = "t" ]; then
        echo "Running docker compose using Test option"
        docker compose  \
            --file ./docker/docker-compose-demo.yaml  \
            up
        break
    elif [ "$response_lower" = "headless" ] || [ "$response_lower" = "h" ]; then
        echo "Running docker compose using Headless option"
        docker compose  \
            --file ./docker/docker-compose-headless.yaml  \
            --env-file .env  \
            up
        break
    else
        echo "Invalid response. Please enter 'd(efault)', 't(est)' or 'h(eadless)'."
    fi
done

echo ""
