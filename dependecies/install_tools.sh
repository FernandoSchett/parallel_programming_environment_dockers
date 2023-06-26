#!/bin/bash

# update
sudo apt update

# VScode
sudo apt install code

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER


