#!/bin/bash


MKTSIM=~/mktsim

SIM_DIR=$MKTSIM/sim

DB_DIR=$MKTSIM/db

SCRIPT_DIR=$MKTSIM/scripts

DB_DATA=~/db_data


export MKTSIM SIM_DIR DB_DIR SCRIPT_DIR DB_DATA

cds(){
 cd ~/mktsim/scripts/
}

cddb(){
 cd ~/mktsim/db/
}

cdss(){
 cd ~/mktsim/sim/
}

source $SCRIPT_DIR/be_worker.sh
