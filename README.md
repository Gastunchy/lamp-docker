# LAMP - Docker
En este repo, se encuentran los archivos necesarios para desplegar un LAMP Stack en Docker, siguiendo el reto de la [Clase 3](https://www.youtube.com/live/TSaGCXsyVU4?si=qOZiYKkMzcpQVv0x) de [IV Edicion Bootcamp DevOps 2023](https://www.youtube.com/playlist?list=PLNkefP1xaOeyTQuNnd6HYVPqCWMXn-c5P)
![image](https://github.com/Gastunchy/lamp-docker/assets/97688245/1ed1f3f3-aa16-4e16-b0d5-f3243f85f582)


lamp-docker 
chmod +x Deploy.sh 
./Deploy.sh 

 docker.io ya está instalado ...

 docker-compose ya está instalado ...

 git ya está instalado ...

 curl ya está instalado ...

 CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS          PORTS                                   NAMES
1ce2962d367f   phpmyadmin:latest     "/docker-entrypoint.…"   12 seconds ago   Up 10 seconds   0.0.0.0:8081->80/tcp, :::8081->80/tcp   phpmyadmin
5c0e1e565763   lamp-docker_web-php   "docker-php-entrypoi…"   12 seconds ago   Up 10 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp       myweb
22421b4171bb   mariadb:latest        "docker-entrypoint.s…"   13 seconds ago   Up 11 seconds   3306/tcp                                server_db

