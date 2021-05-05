#!/bin/bash

# start mysql, create the scoring database and tables
service mysql start

echo "create database scoring;create user scoring;grant all privileges on scoring.* to scoring;" | mysql

mysql -uscoring scoring < database.sql

python ./scoresd.py &

nginx -g "daemon off;"