#!/bin/bash

source ~/mktsim/scripts/sim_env.sh

if [[ -ne $SAMPLEDATA_DIR && -d $SAMPLEDATA_DIR/db/db_data ]];then
	if [[ $1 == 'copy' ]];then
		cp $SAMPLEDATA_DIR/db/db_data/* $DB_DIR/db_data/ 
	else
		ln -sf $SAMPLEDATA_DIR/db/ $DB_DIR/db_data/
	fi
fi	
