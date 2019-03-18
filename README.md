# matricula_descuentos_crud

--Api de matricula descuentos con CI--
CI deploy with lambda - S3
Drone 0.8 
matricula_descuentos_crud master/develop

## Requirements
Go version >= 1.8.

## Preparación:
    Para usar el API, usar el comando:
        - go get github.com/udistrital/matricula_descuentos_crud

## Run

Definir los valores de las siguientes variables de entorno:

 - `API_MATRICULA_DESCUENTOS_HTTP_PORT`: Puerto asignado para la ejecución del API
 - `MATRICULA_DESCUENTOS_CRUD__PGUSER`: Usuario de la base de datos
 - `MATRICULA_DESCUENTOSS_CRUD__PGPASS`: Clave del usuario para la conexión a la base de datos  
 - `MATRICULA_DESCUENTOS_CRUD__PGURLS`: Host de conexión
 - `MATRICULA_DESCUENTOS_CRUD__PGDB`: Nombre de la base de datos
 - `MATRICULA_DESCUENTOS_CRUD__SCHEMA`: Esquema a utilizar en la base de datos

Ejemplo: API_MATRICULA_DESCUENTOS_HTTP_PORT=8083 MATRICULA_DESCUENTOS_CRUD__PGUSER=user MATRICULA_DESCUENTOS_CRUD__PGPASS=password MATRICULA_DESCUENTOS_CRUD__PGURLS=localhost MATRICULA_DESCUENTOS_CRUD__PGDB=udistrital_core_db MATRICULA_DESCUENTOS_CRUD__SCHEMA=core_new bee run

## MODELO
![image](https://github.com/udistrital/matricula_descuentos_crud/blob/develop/Descuentos_Matricula.svg).
