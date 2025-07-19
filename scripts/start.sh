#!/bin/bash

if [[ $# != 1 ]]; then
        echo "Please specify 1 compoent to start"
        exit 1
fi





#Check if docker network exists
        if ! docker network ls --format '{{.Name}}' | grep -wq market-simulator-net; then
                echo "Network does not exist, creating..."
                docker network create my-shared-network
        else
                echo "Network already exists."
        fi



if [[ $1 == 'db' ]];then

        cd $DB_DIR
        docker compose up
else
        if [[ -f $START_DIR/$1 ]];then
                cd $SIM_DIR/$1;docker-compose up
        else
                echo "Simulator haven't been found"
                exit 1
        fi
fi
