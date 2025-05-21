#!/bin/bash

set -o errexit
set -o nounset
IFS=$(printf '\n\t')

# Docker

# Check if Docker is installed
if command -v docker &> /dev/null; then
    echo 'Docker is already installed, skipping.'
else
    echo 'Docker is not installed, installing...\n\n'
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    printf '\nDocker installed successfully\n\n'

    printf 'Waiting for Docker to start...\n\n'
    sleep 5

    printf 'Adding user to the docker group...\n\n'
    sudo usermod -aG docker $USER
fi

# Docker Compose

# Check if Docker Compose is installed
if command -v docker compose &> /dev/null; then
    echo 'Docker Compose is already installed, skipping.'
else
    echo 'Docker Compose is not installed, installing...\n\n'
    mkdir -p ~/.docker/cli-plugins/
    COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
    curl -SL https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
    chmod +x ~/.docker/cli-plugins/docker-compose
    printf '\nDocker Compose installed successfully\n\n'
fi

# Check if the .yaml file exists
if [ -f "my_config.yaml" ]; then
    echo -e "A my_config.yaml file exists already! Type y(es), if you want to retain the existing .yaml file," 
    while true; do
        read -p "type n(o) if you want to have it overwritten by the default .yaml. y/n?" retain_env
        response_lower=$(echo "$retain_env" | tr '[:upper:]' '[:lower:]')
        if [ "$response_lower" = "no" ] || [ "$response_lower" = "n" ]; then
            echo "File will be overwritten."
            cp dual_camera_config_example.yaml my_config.yaml
            break
        elif [ "$response_lower" = "yes" ] || [ "$response_lower" = "y" ]; then
            echo "File will be kept."
            break
        else
            echo "Invalid response. Please enter 'yes' or 'no'."
            pause 1
            continue
        fi
    done
else
    # Copy the .yaml file
    cp dual_camera_config_example.yaml my_config.yaml
fi
sleep 2

