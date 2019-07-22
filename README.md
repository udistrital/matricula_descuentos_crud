# descuento_academico_crud

--Api de descuentos con CI--
CI deploy with lambda - S3
Drone 0.8 
descuento_academico_crud master/develop

## Requirements
Go version >= 1.8.

## Preparación:
    Para usar el API, usar el comando:
        - go get github.com/planesticud/descuento_academico_crud

## Run

Definir los valores de las siguientes variables de entorno:

 - `DESCUENTO_ACADEMICO_CRUD_HTTP_PORT`: Puerto asignado para la ejecución del API
 - `DESCUENTO_ACADEMICO_CRUD__PGUSER`: Usuario de la base de datos
 - `DESCUENTO_ACADEMICO_CRUD__PGPASS`: Clave del usuario para la conexión a la base de datos  
 - `DESCUENTO_ACADEMICO_CRUD__PGURLS`: Host de conexión
 - `DESCUENTO_ACADEMICO_CRUD__PGDB`: Nombre de la base de datos
 - `DESCUENTO_ACADEMICO__SCHEMA`: Esquema a utilizar en la base de datos

Ejemplo: DESCUENTO_ACADEMICO_CRUD_HTTP_PORT=8083 DESCUENTO_ACADEMICO_CRUD__PGUSER=user DESCUENTO_ACADEMICO_CRUD__PGPASS=password DESCUENTO_ACADEMICO_CRUD__PGURLS=localhost DESCUENTO_ACADEMICO_CRUD__PGDB=planesticud_core_db DESCUENTO_ACADEMICO_CRUD__SCHEMA=core_new bee run

## MODELO
![descuentos](https://user-images.githubusercontent.com/14035745/61604646-fd8aee80-ac07-11e9-933a-8a8e8d6cfed9.png)
