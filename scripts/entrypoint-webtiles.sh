#!/usr/bin/env bash

# Variables
APPDIR=${APPDIR:-"/app"}
DATA_DIR=${DATA_DIR:-"/data"}

# Functions

## Create server directories if they do not exist
create_server_dirs()
{
  if ! [[ -d ${DATA_DIR}/rcs ]]; then
    echo "${DATA_DIR}/rcs didn't exist, creating it now..."
    mkdir -p ${DATA_DIR}/rcs
  fi

  if ! [[ -d ${DATA_DIR}/webserver ]]; then
    echo "${DATA_DIR}/webserver didn't exist, creating it now..."
    mkdir -p ${DATA_DIR}/webserver
  fi
}

# Logic

create_server_dirs

cd ${APPDIR}
./webserver/server.py $@
