# Descuento_academico_crud

API CRUD para los descuento en academica del proceso de admiciones

## Requirements
Go version >= 1.8.

## Preparación:
    Para usar el API, usar el comando:
        - go get github.com/udistrital/descuento_academico_crud

## Run

Definir los valores de las siguientes variables de entorno:

 - `API_DESCUENTO_ACADEMICO_CRUD_HTTP_PORT`: Puerto asignado para la ejecución del API
 - `DESCUENTO_ACADEMICO_CRUD__PGUSER`: Usuario de la base de datos
 - `DESCUENTO_ACADEMICO_CRUD__PGPASS`: Clave del usuario para la conexión a la base de datos  
 - `DESCUENTO_ACADEMICO_CRUD__PGURLS`: Host de conexión
 - `DESCUENTO_ACADEMICO_CRUD__PGDB`: Nombre de la base de datos
 - `DESCUENTO_ACADEMICO_CRUD__SCHEMA`: Esquema a utilizar en la base de datos

Ejemplo: API_DESCUENTO_ACADEMICO_CRUD_HTTP_PORT=8080 DESCUENTO_ACADEMICO_CRUD__PGUSER=postgres DESCUENTO_ACADEMICO_CRUD__PGPASS=12345678 DESCUENTO_ACADEMICO_CRUD__PGURLS=localhost DESCUENTO_ACADEMICO_CRUD__PGDB=descuentos DESCUENTO_ACADEMICO_CRUD__SCHEMA=descuentos_academicos bee run

## MODELO DE DATOS

Como modelos de datos del Api se utilizo el siguiente [Modelo](https://drive.google.com/drive/folders/1oHPdamuQ1XukHKz34DrqVioziOlUe9hF)

![image](https://github.com/udistrital/descuento_academico_crud/blob/Version11/descuento_matriculaV2.png)