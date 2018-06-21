#!/usr/bin/bash

sudo -u mongodb rm -rf /var/lib/mongod.lock
sudo -u mongodb mongod --repair --dbpath /var/lib/mongodb
