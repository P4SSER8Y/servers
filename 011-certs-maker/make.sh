#!/usr/bin/env sh

mkdir -p `pwd`/data
sudo docker run --env-file .env --rm -it --user=$(id -u):$(id -g) -v `pwd`/data:/ssl soulteary/certs-maker
