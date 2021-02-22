# descuento_academico_crud
API de gestión de descuentos académicos

Integración con

 - `CI`
 - `AWS Lambda - S3`
 - `Drone 1.x`
 - `descuento_academico_crud master/develop`

## Requerimientos
Go version >= 1.8.

## Preparación
Para usar el API, usar el comando:

 - `go get github.com/udistrital/descuento_academico_crud`

## Ejecución
Definir los valores de las siguientes variables de entorno:

 - `DESCUENTO_ACADEMICO_CRUD_HTTP_PORT`: Puerto asignado para la ejecución del API
 - `DESCUENTO_ACADEMICO_CRUD__PGUSER`: Usuario de la base de datos
 - `DESCUENTO_ACADEMICO_CRUD__PGPASS`: Clave del usuario para la conexión a la base de datos  
 - `DESCUENTO_ACADEMICO_CRUD__PGURLS`: Host de conexión
 - `DESCUENTO_ACADEMICO_CRUD__PGDB`: Nombre de la base de datos
 - `DESCUENTO_ACADEMICO__SCHEMA`: Esquema a utilizar en la base de datos

## Ejemplo
DESCUENTO_ACADEMICO_CRUD_HTTP_PORT=9013 DESCUENTO_ACADEMICO_CRUD__PGUSER=user DESCUENTO_ACADEMICO_CRUD__PGPASS=password DESCUENTO_ACADEMICO_CRUD__PGURLS=localhost DESCUENTO_ACADEMICO_CRUD__PGDB=bd DESCUENTO_ACADEMICO_CRUD__SCHEMA=schema_new bee run

## Modelo BD
![image](https://github.com/udistrital/descuento_academico_crud/blob/feature/campus/modelo_descuento_academico_crud.png).
