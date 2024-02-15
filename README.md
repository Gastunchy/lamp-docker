# LAMP - Docker
En este repo, se encuentran los archivos necesarios para desplegar un LAMP Stack en Docker, siguiendo el reto de la [Clase 3](https://www.youtube.com/live/TSaGCXsyVU4?si=qOZiYKkMzcpQVv0x) de [IV Edicion Bootcamp DevOps 2023](https://www.youtube.com/playlist?list=PLNkefP1xaOeyTQuNnd6HYVPqCWMXn-c5P).

<p align="center">
  <img src="https://github.com/Gastunchy/lamp-docker/assets/97688245/5617e114-f08d-420d-9023-2575c986621e">
</p>




## Detalle de Deploy.sh:
1. Valida e instala: docker.io, docker-compose, git y curl
3. Clona el repo: [https://github.com/roxsross/bootcamp-devops-2023 // Branch: ejercicio2-dockeriza](https://github.com/roxsross/bootcamp-devops-2023/tree/ejercicio2-dockeriza)
4. Copia el contenido de 295devops-travel-lamp en public-html
5. Crea archivo init.sql
6. Cambia contenido de config.php
7. Ejecuta docker-compose up -d

## Detalle de docker-compose
- ### MariaDB
  1. Descarga de imagen de MariaDB
  2. Copia archivos de inicio: init.sql y base de datos: devopstravel.sql
  3. Crea contenedor en redes lamp-gaston y control
- ### MYWEB
  1. Ejecuta el archivo Dockerfile para crear la imagen de php-apache
  2. En la creacion de la imagen se copian todos los archivos de la web
  3. Crea contenedor en red lamp-gaston y espone el puerto 80
- ### PHPMYADMIN

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

