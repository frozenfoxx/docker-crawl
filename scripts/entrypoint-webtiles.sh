#!/usr/bin/env ash

# Variables
APPDIR=${APPDIR:-"/app"}
DATA_DIR=${DATA_DIR:-"/data"}

# Functions

## Create server directories if they do not exist
create_server_dirs()
{
  mkdir -p ${DATA_DIR}/rcs
  mkdir -p ${DATA_DIR}/webserver
}

# Logic

cd ${APPDIR}
./webserver/server.py $@
