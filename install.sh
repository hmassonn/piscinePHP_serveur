#!/bin/sh

mkdir $HOME/goinfre/.docker
ln -s $HOME/goinfre/.docker $HOME/.docker
docker-machine --storage-path "/goinfre" create --driver virtualbox --virtualbox-memory 2000 hmclwd
eval "$(docker-machine --storage-path "/goinfre" env hmclwd)"

docker run -p "80:80" -v $HOME/http:/var/www/html --name lamp mattrayner/lamp:latest-1604

#docker build -t mylampserver .

# docker run --name myadmin -d --link lamp:db -p 8080:80 phpmyadmin/phpmyadmin

# docker run --rm -p 8080:80 -p 3306:3306 -e LOG_STDOUT=true -e LOG_STDERR=true -e LOG_LEVEL=debug -v $HOME/http:/var/www/html --name lamp fauria/lamp

# docker exec -i lamp mysql -uroot <<< "CREATE USER 'root2'@'localhost' IDENTIFIED BY 'root'; GRANT ALL PRIVILEGES ON * . * TO 'root2'@'localhost'; create database rush00;"
