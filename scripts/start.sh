#!/bin/bash 

if [[ $# != 1 ]]; then
	echo "Please specify 1 compoent to start"
	exit 1
fi

if [[ $1 == 'db' ]]lthen
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
