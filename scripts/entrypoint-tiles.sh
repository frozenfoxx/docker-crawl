#!/usr/bin/env ash

# Variables
APPDIR=${APPDIR:-"/app"}
DATA_DIR=${DATA_DIR:-"/data"}

# Functions

# Logic

cd ${APPDIR}
./webserver/server.py $@
