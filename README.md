Bonjour petit Padawan, si tu lis ceci c'est que tu fais surement le rush00 de la piscine PHP, ce script docker va te permettre d'avoir un serveur apache (pour pouvoir faire tourner ton Php ;)) et un serveur mysql (parce que c'est mieux que les CSV ;)) avec phpmyadmin parcequ'on est gentils.

pour te connecter sur ton site tu commences par mettre ton travail (ou un hello world en php pour tester) dans `/Users/ton-login-evidemment-si-tu-met-ca-t'aura-une-erreur/http`

```sh install.sh```

et quand le serveur tourne (les lignes arrêtent de s'afficher tu devrais facilement repérer le truc) dans un nouveau shell tu lances

```docker exec -i lamp mysql -uroot <<< "CREATE USER 'root2'@'localhost' IDENTIFIED BY 'root'; GRANT ALL PRIVILEGES ON * . * TO 'root2'@'localhost'; create database rush00;" && docker-machine --storage-path "/goinfre" ip hmclwd```

ce qui te donne l'ip avec laquel voir ton site, donc si dans une URL tu met `http://mon-ip-en-chiffre-pas-ca-c'est-juste-un-exemple/phpmyadmin`

`login: root2`
`password: root`

et si tu veux arreter le serveur tu fait 

```eval "$(docker-machine --storage-path "/goinfre" env hmclwd)" && docker stop lamp```

si tu te deconnecte et que ca te met une erreure genre `Error checking TLS connection: Host is not running` tu peux essayer

`eval "$(docker-machine --storage-path "/goinfre" env hmclwd)" && docker restart lamp`

sinon recommence depuis le debut
