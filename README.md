# tradi-docker

Iniciar contenedor con la base de Datos
haces "docker-compose start" en la dirección del yml
contenedores de tradi


Acceder Base de Datos
Durante el desarrollo, estaremos accediendo a la base de datos por la terminal, con el siguiente comando accederemos a ella.

psql -h 127.0.0.1 -p 10000 -d ProyectoModular -U ProyectoModularUser -W
Debemos tener el cliente psql instalado en nuestra maquina.

Si no lo tenenemos, podremos usar la siguiente técnica para acceder al manejador de la base de datos, utilizaremos el cliente psql que se encuentra en el contenedor. Al tener activo el contenedor ejecutaremos el comando

docker container ls -a
Nos mostrara una lista de contenedores instalados, buscaremos el nombre de nuestro contenedor y ejecutaremos el siguiente comando cambiando el nombre de nuestro contenedor.

Asi para ver la consola de base de datos:

	docker exec -it 677d7e338165 psql -U admin -d tradidb
