#!/bin/bash
#Check if docker network exists
network_checkCreate(){
        if ! docker network ls --format '{{.Name}}' | grep -wq market-simulator-net; then
                echo "Network does not exist, creating..."
                docker network create my-shared-network
        else
                echo "Network already exists."
        fi
}

qstart(){
if [[ $1 == 'db' ]];then
        network_checkCreate
        docker compose -f $DB_DIR/docker-compose.yml up -d
else
        if [[ -f $START_DIR/$1 ]];then
                docker compose -f  cd $SIM_DIR/$1/docker-compose up -d
        else
                echo "Simulator haven't been found"
                exit 1
        fi
fi
}

qstop(){
        if [[ $1 == 'db' ]];then
                docker compose -f $DB_DIR/docker-compose.yml down
        fi
}

