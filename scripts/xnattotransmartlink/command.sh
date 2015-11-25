#!/bin/bash
export TS_DATA="/home/transmart/transmart-data/"
export KETTLE_HOME="${TS_DATA}samples/postgres/kettle-home/"

sh "${TS_DATA}env/data-integration/kitchen.sh" \
-norep=N \
-file="${TS_DATA}env/tranSMART-ETL/Postgres/GPL-1.0/Kettle/Kettle-ETL/create_clinical_data.kjb" \
-log=load_clinical_data.log \
-param:LOAD_TYPE=I \
-param:COLUMN_MAP_FILE=xnat.tmm \
-param:DATA_LOCATION=$2 \
-param:TOP_NODE="\\Public Studies\\$1\\" \
-param:STUDY_ID=$1 \
-param:SORT_DIR=/home/transmart/ETL \
-logging=Rowlevel \
-level=Rowlevel \
> command.out
