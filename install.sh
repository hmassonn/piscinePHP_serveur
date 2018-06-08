#!/bin/sh

mkdir $HOME/goinfre/.docker
ln -s $HOME/goinfre/.docker $HOME/.docker
docker-machine --storage-path "/goinfre" rm hmclwd -y
docker-machine --storage-path "/goinfre" create --driver virtualbox --virtualbox-memory 2000 hmclwd
eval "$(docker-machine --storage-path "/goinfre" env hmclwd)"
docker rm lamp
docker run -p "80:80" -v $HOME/http:/var/www/html --name lamp mattrayner/lamp:latest-1604
