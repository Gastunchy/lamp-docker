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
  1. Descarga imagen de MariaDB
  2. Copia archivos de inicio: init.sql y base de datos: devopstravel.sql
  3. Crea contenedor en redes lamp-gaston y control
- ### MYWEB
  1. Ejecuta el archivo Dockerfile para crear la imagen de php-apache
  2. En la creacion de la imagen se copian todos los archivos de la web
  3. Crea contenedor en red lamp-gaston y espone el puerto 80
- ### PHPMYADMIN
  1. Descarga imagen de PHPMYADMIN
  2. Crea contenedor en red control y expone el puerto 8081

## Informacion extra
- El contenedor/servidor de MariaDB no esta expuesto a internet
- Los contenedores de MYWEB y PHPMYADMIN estan en dos redes diferentes pero los dos si pueden acceder a la base de datos
- Al finalizar el despliegue envia una notificacion a Discord (En este caso a un canal personal)
- Tanto el script como los archivos docker estan testeados en UBUNTU
- Pueden testear en https://killercoda.com/playgrounds/scenario/ubuntu

## Ejecusion sugerida
1. Clonar este repo (https://github.com/Gastunchy/lamp-docker)
2. Ingresar al directorio "lamp-docker"
3. Ejecutar "sudo chmod +x Deploy.sh" para hacer ejecutable el script
4. ejecutar "./Deploy.sh"ocker.io"
