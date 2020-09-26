-- object: descuentos_academicos | type: SCHEMA --
-- DROP SCHEMA IF EXISTS descuentos_academicos CASCADE;
CREATE SCHEMA descuentos_academicos;
-- ddl-end --
COMMENT ON SCHEMA descuentos_academicos IS 'Esquema para el módulo de descuentos del campus';
-- ddl-end --

SET search_path TO pg_catalog,public,descuentos_academicos;
-- ddl-end --

-- object: descuentos_academicos.solicitud_descuento | type: TABLE --
-- DROP TABLE IF EXISTS descuentos_academicos.solicitud_descuento CASCADE;
CREATE TABLE descuentos_academicos.solicitud_descuento (
	id serial NOT NULL,
	persona_id integer,
	periodo_id integer NOT NULL,
	estado varchar(50) NOT NULL,
	activo boolean NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	descuentos_dependencia_id integer NOT NULL,
	CONSTRAINT pk_solicitud_descuento PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.solicitud_descuento.persona_id IS 'Identificador que referencia la persona que solicita el descuento';
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.solicitud_descuento.fecha_creacion IS 'Fecha de creación del registro';
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.solicitud_descuento.fecha_modificacion IS 'Fecha de la modificación del registro';
-- ddl-end --

-- object: descuentos_academicos.tipo_descuento | type: TABLE --
-- DROP TABLE IF EXISTS descuentos_academicos.tipo_descuento CASCADE;
CREATE TABLE descuentos_academicos.tipo_descuento (
	id serial NOT NULL,
	nombre character varying(50) NOT NULL,
	codigo_abreviacion character varying(20),
	activo boolean NOT NULL,
	numero_orden numeric(5,2),
	descripcion character varying(250),
	general boolean NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	concepto_academico_id integer NOT NULL,
	CONSTRAINT pk_tipo_descuento PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE descuentos_academicos.tipo_descuento IS 'Nombre descuento';
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.tipo_descuento.codigo_abreviacion IS 'identificador certificado';
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.tipo_descuento.descripcion IS 'Descripcion certificado';
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.tipo_descuento.general IS 'Campo que definice si el tipo de descuento es general o se especifica a una persona o una comunidad
';
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.tipo_descuento.concepto_academico_id IS 'Concepto académico ';
-- ddl-end --

-- object: descuentos_academicos.descuentos_dependencia | type: TABLE --
-- DROP TABLE IF EXISTS descuentos_academicos.descuentos_dependencia CASCADE;
CREATE TABLE descuentos_academicos.descuentos_dependencia (
	id serial NOT NULL,
	dependencia_id integer NOT NULL,
	periodo_id integer NOT NULL,
	porcentaje_descuento numeric(5,2) NOT NULL,
	activo boolean NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	tipo_descuento_id integer NOT NULL,
	CONSTRAINT pk_descuentos_dependencia PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.descuentos_dependencia.fecha_creacion IS 'Fecha en la que se hace el registro';
-- ddl-end --

-- object: descuentos_academicos.validacion_descuento | type: TABLE --
-- DROP TABLE IF EXISTS descuentos_academicos.validacion_descuento CASCADE;
CREATE TABLE descuentos_academicos.validacion_descuento (
	id serial NOT NULL,
	recibo_matricula_id integer NOT NULL,
	autorizado boolean NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	activo boolean NOT NULL,
	valor_base numeric(20,7) NOT NULL,
	valor_con_decuento numeric(20,7) NOT NULL,
	tipo_duracion_id integer NOT NULL,
	solicitud_descuento_id integer NOT NULL,
	CONSTRAINT pk_validacion_descuento PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.validacion_descuento.recibo_matricula_id IS 'Se referencia del modelo actual de académica';
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.validacion_descuento.valor_base IS 'Valor original del concepto';
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.validacion_descuento.valor_con_decuento IS 'Corresponde al valor original menos el valor del descuento';
-- ddl-end --

-- object: descuentos_academicos.tipo_duracion | type: TABLE --
-- DROP TABLE IF EXISTS descuentos_academicos.tipo_duracion CASCADE;
CREATE TABLE descuentos_academicos.tipo_duracion (
	id serial NOT NULL,
	nombre character varying(50) NOT NULL,
	codigo_abreviacion character varying(20),
	activo boolean NOT NULL,
	numero_orden numeric(5,2),
	descripcion character varying(250),
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_tipo_duracion PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE descuentos_academicos.tipo_duracion IS 'Tabla parametrica para definir si la duracion del descuento, si es permanten o semestral, anual, etc';
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.tipo_duracion.codigo_abreviacion IS 'identificador certificado';
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.tipo_duracion.descripcion IS 'Descripcion certificado';
-- ddl-end --

-- object: descuentos_academicos.soporte_descuento | type: TABLE --
-- DROP TABLE IF EXISTS descuentos_academicos.soporte_descuento CASCADE;
CREATE TABLE descuentos_academicos.soporte_descuento (
	id serial NOT NULL,
	documento_id integer NOT NULL,
	activo boolean NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	solicitud_descuento_id integer NOT NULL,
	CONSTRAINT pk_soporte_descuento PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE descuentos_academicos.soporte_descuento IS 'Documentos que soportan la solicitud realizada';
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.soporte_descuento.documento_id IS 'Identificador del documento adjunto';
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.soporte_descuento.activo IS 'Indica el estado del registro';
-- ddl-end --

-- object: descuentos_academicos.requisito | type: TABLE --
-- DROP TABLE IF EXISTS descuentos_academicos.requisito CASCADE;
CREATE TABLE descuentos_academicos.requisito (
	id serial NOT NULL,
	nombre character varying(50) NOT NULL,
	codigo_abreviacion character varying(20),
	activo boolean NOT NULL,
	numero_orden numeric(5,2),
	descripcion character varying(250),
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_requisito PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE descuentos_academicos.requisito IS 'Tabla parametrica para definir los requisitos para optar por un descuento';
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.requisito.codigo_abreviacion IS 'identificador certificado';
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.requisito.descripcion IS 'Descripcion certificado';
-- ddl-end --

-- object: descuentos_academicos.requisito_tipo_descuento | type: TABLE --
-- DROP TABLE IF EXISTS descuentos_academicos.requisito_tipo_descuento CASCADE;
CREATE TABLE descuentos_academicos.requisito_tipo_descuento (
	id serial NOT NULL,
	activo boolean NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	requisito_id integer NOT NULL,
	tipo_descuento_id integer NOT NULL,
	CONSTRAINT pk_requisito_tipo_descuento PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN descuentos_academicos.requisito_tipo_descuento.activo IS 'Indica el estado del registro';
-- ddl-end --

-- object: fk_requisito_tipo_descuento_requisito | type: CONSTRAINT --
-- ALTER TABLE descuentos_academicos.requisito_tipo_descuento DROP CONSTRAINT IF EXISTS fk_requisito_tipo_descuento_requisito CASCADE;
ALTER TABLE descuentos_academicos.requisito_tipo_descuento ADD CONSTRAINT fk_requisito_tipo_descuento_requisito FOREIGN KEY (requisito_id)
REFERENCES descuentos_academicos.requisito (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_requisito_tipo_descuento_tipo_descuento | type: CONSTRAINT --
-- ALTER TABLE descuentos_academicos.requisito_tipo_descuento DROP CONSTRAINT IF EXISTS fk_requisito_tipo_descuento_tipo_descuento CASCADE;
ALTER TABLE descuentos_academicos.requisito_tipo_descuento ADD CONSTRAINT fk_requisito_tipo_descuento_tipo_descuento FOREIGN KEY (tipo_descuento_id)
REFERENCES descuentos_academicos.tipo_descuento (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_validacion_descuento_tipo_duracion | type: CONSTRAINT --
-- ALTER TABLE descuentos_academicos.validacion_descuento DROP CONSTRAINT IF EXISTS fk_validacion_descuento_tipo_duracion CASCADE;
ALTER TABLE descuentos_academicos.validacion_descuento ADD CONSTRAINT fk_validacion_descuento_tipo_duracion FOREIGN KEY (tipo_duracion_id)
REFERENCES descuentos_academicos.tipo_duracion (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_validacion_descuento_solicitud_descuento | type: CONSTRAINT --
-- ALTER TABLE descuentos_academicos.validacion_descuento DROP CONSTRAINT IF EXISTS fk_validacion_descuento_solicitud_descuento CASCADE;
ALTER TABLE descuentos_academicos.validacion_descuento ADD CONSTRAINT fk_validacion_descuento_solicitud_descuento FOREIGN KEY (solicitud_descuento_id)
REFERENCES descuentos_academicos.solicitud_descuento (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_soporte_descuento_solicitud_descuento | type: CONSTRAINT --
-- ALTER TABLE descuentos_academicos.soporte_descuento DROP CONSTRAINT IF EXISTS fk_soporte_descuento_solicitud_descuento CASCADE;
ALTER TABLE descuentos_academicos.soporte_descuento ADD CONSTRAINT fk_soporte_descuento_solicitud_descuento FOREIGN KEY (solicitud_descuento_id)
REFERENCES descuentos_academicos.solicitud_descuento (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_solicitud_descuento_descuentos_dependencia | type: CONSTRAINT --
-- ALTER TABLE descuentos_academicos.solicitud_descuento DROP CONSTRAINT IF EXISTS fk_solicitud_descuento_descuentos_dependencia CASCADE;
ALTER TABLE descuentos_academicos.solicitud_descuento ADD CONSTRAINT fk_solicitud_descuento_descuentos_dependencia FOREIGN KEY (descuentos_dependencia_id)
REFERENCES descuentos_academicos.descuentos_dependencia (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_tipo_descuento_descuentos_dependencia | type: CONSTRAINT --
-- ALTER TABLE descuentos_academicos.descuentos_dependencia DROP CONSTRAINT IF EXISTS fk_tipo_descuento_descuentos_dependencia CASCADE;
ALTER TABLE descuentos_academicos.descuentos_dependencia ADD CONSTRAINT fk_tipo_descuento_descuentos_dependencia FOREIGN KEY (tipo_descuento_id)
REFERENCES descuentos_academicos.tipo_descuento (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- Permisos de usuario
GRANT USAGE ON SCHEMA descuentos_academicos TO desarrollooas;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA descuentos_academicos TO desarrollooas;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA descuentos_academicos TO desarrollooas;
