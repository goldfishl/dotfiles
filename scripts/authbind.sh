#!/usr/bin/env bash

sudo apt install authbind

# Configure access to port 80
sudo touch /etc/authbind/byport/80
sudo chmod 777 /etc/authbind/byport/80
