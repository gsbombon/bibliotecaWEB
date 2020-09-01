--------------------------------------------------------
-- Archivo creado  - martes-agosto-25-2020
-- Autor - jazamora4Win
-- Tablespace - PROYECTO
-- Schema - PROYECTO
-- Usuario - PROYECTO   
--------------------------------------------------------



--------------------------------------------------------
--  INICIO SECCION SECUENCIAS 
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence AUTOR_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "AUTOR_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LIBRO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LIBRO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SOCIO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SOCIO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USUARIO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USUARIO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  FIN SECCION DE DISPARADORES (TRIGGERS)
--------------------------------------------------------


--------------------------------------------------------
--  DDL for Table AUTOR
--------------------------------------------------------

  CREATE TABLE "AUTOR" 
   (	"CODIGO_AUTOR" NUMBER(6,0), 
	"NOMBRE_AUTOR" VARCHAR2(50 BYTE)
   );
--------------------------------------------------------
--  DDL for Table EJEMPLAR
--------------------------------------------------------

  CREATE TABLE "EJEMPLAR" 
   (	"CODIGO_LIBRO" NUMBER(6,0), 
	"CODIGO_EJEMPLAR" NUMBER(*,0), 
	"DETERIORADO" NUMBER(*,0)
   );
--------------------------------------------------------
--  DDL for Table LIBRO
--------------------------------------------------------

  CREATE TABLE "LIBRO" 
   (	"CODIGO_LIBRO" NUMBER(6,0), 
	"TITULO_LIBRO" VARCHAR2(100 BYTE), 
	"EDITORIAL_LIBRO" VARCHAR2(50 BYTE), 
	"ANIO_ESCRITO" NUMBER(4,0), 
	"ANIO_EDICION" NUMBER(4,0), 
	"ISBN" NUMBER(*,0)
   );
--------------------------------------------------------
--  DDL for Table LIBRO_AUTOR
--------------------------------------------------------

  CREATE TABLE "LIBRO_AUTOR" 
   (	"CODIGO_AUTOR" NUMBER(6,0), 
	"CODIGO_LIBRO" NUMBER(6,0)
   );
--------------------------------------------------------
--  DDL for Table PRESTAMO
--------------------------------------------------------

  CREATE TABLE "PRESTAMO" 
   (	"CODIGO_LIBRO" NUMBER(6,0), 
	"CODIGO_EJEMPLAR" NUMBER(*,0), 
	"CODIGO_SOCIO" NUMBER(6,0), 
	"FECHA_PRESTAMO" DATE, 
	"FECHA_DEVOLUCION_REAL" DATE, 
	"FECHA_DEVOLVER" DATE
   );
--------------------------------------------------------
--  DDL for Table SOCIO
--------------------------------------------------------

  CREATE TABLE "SOCIO" 
   (	"CODIGO_SOCIO" NUMBER(6,0), 
	"CEDULA_SOCIO" VARCHAR2(10 BYTE), 
	"USUARIO_SOCIO" VARCHAR2(50 BYTE), 
	"NOMBRE_SOCIO" VARCHAR2(50 BYTE), 
	"APELLIDO_SOCIO" VARCHAR2(50 BYTE), 
	"TELEFONO_SOCIO" VARCHAR2(9 BYTE)
   );
--------------------------------------------------------
--  DDL for Table USUARIO
--------------------------------------------------------

  CREATE TABLE "USUARIO" 
   (	"CODIGO_USUARIO" NUMBER(6,0), 
	"CODIGO_SOCIO" NUMBER(6,0), 
	"CLAVE" VARCHAR2(10 BYTE)
   );
--------------------------------------------------------
--  DDL for Index FK_EJEMPLAR_LIBRO_FK
--------------------------------------------------------

  CREATE INDEX "FK_EJEMPLAR_LIBRO_FK" ON "EJEMPLAR" ("CODIGO_LIBRO");
--------------------------------------------------------
--  DDL for Index FK_LIBRO_AUTOR_AUTOR_FK
--------------------------------------------------------

  CREATE INDEX "FK_LIBRO_AUTOR_AUTOR_FK" ON "LIBRO_AUTOR" ("CODIGO_LIBRO");
--------------------------------------------------------
--  DDL for Index FK_LIBRO_AUTOR_LIBRO_FK
--------------------------------------------------------

  CREATE INDEX "FK_LIBRO_AUTOR_LIBRO_FK" ON "LIBRO_AUTOR" ("CODIGO_AUTOR");
--------------------------------------------------------
--  DDL for Index FK_PRESTAMO_EJEMPLAR_FK
--------------------------------------------------------

  CREATE INDEX "FK_PRESTAMO_EJEMPLAR_FK" ON "PRESTAMO" ("CODIGO_LIBRO", "CODIGO_EJEMPLAR");
--------------------------------------------------------
--  DDL for Index FK_PRESTAMO_SOCIO_FK
--------------------------------------------------------

  CREATE INDEX "FK_PRESTAMO_SOCIO_FK" ON "PRESTAMO" ("CODIGO_SOCIO");
--------------------------------------------------------
--  DDL for Index FK_USUARIO_SOCIO_FK
--------------------------------------------------------

  CREATE INDEX "FK_USUARIO_SOCIO_FK" ON "USUARIO" ("CODIGO_SOCIO");
--------------------------------------------------------
--  DDL for Index PK_AUTOR
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_AUTOR" ON "AUTOR" ("CODIGO_AUTOR");
--------------------------------------------------------
--  DDL for Index PK_EJEMPLAR
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_EJEMPLAR" ON "EJEMPLAR" ("CODIGO_LIBRO", "CODIGO_EJEMPLAR");
--------------------------------------------------------
--  DDL for Index PK_LIBRO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LIBRO" ON "LIBRO" ("CODIGO_LIBRO");
--------------------------------------------------------
--  DDL for Index PK_LIBRO_AUTOR
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LIBRO_AUTOR" ON "LIBRO_AUTOR" ("CODIGO_AUTOR", "CODIGO_LIBRO");
--------------------------------------------------------
--  DDL for Index PK_PRESTAMO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PRESTAMO" ON "PRESTAMO" ("CODIGO_LIBRO", "CODIGO_EJEMPLAR", "CODIGO_SOCIO", "FECHA_PRESTAMO");
--------------------------------------------------------
--  DDL for Index PK_SOCIO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SOCIO" ON "SOCIO" ("CODIGO_SOCIO");
--------------------------------------------------------
--  DDL for Index PK_USUARIO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_USUARIO" ON "USUARIO" ("CODIGO_USUARIO");



--------------------------------------------------------
-- INICIO SECCION DE DISPARADORES (TRIGGERS)
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger AUTOR_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "AUTOR_TRIG" 
  BEFORE INSERT ON AUTOR
  FOR EACH ROW
BEGIN
  SELECT autor_seq.nextval
    INTO :new.CODIGO_AUTOR
    FROM dual;
END;
/
ALTER TRIGGER "AUTOR_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LIBRO_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LIBRO_TRIG" 
  BEFORE INSERT ON LIBRO
  FOR EACH ROW
BEGIN
  SELECT libro_seq.nextval
    INTO :new.CODIGO_LIBRO
    FROM dual;
END;
/
ALTER TRIGGER "LIBRO_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SOCIO_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SOCIO_TRIG" 
  BEFORE INSERT ON SOCIO
  FOR EACH ROW
BEGIN
  SELECT socio_seq.nextval
    INTO :new.CODIGO_SOCIO
    FROM dual;
END;
/
ALTER TRIGGER "SOCIO_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USUARIO_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USUARIO_TRIG" 
  BEFORE INSERT ON USUARIO
  FOR EACH ROW
BEGIN
  SELECT usuario_seq.nextval
    INTO :new.CODIGO_USUARIO
    FROM dual;
END;
/
ALTER TRIGGER "USUARIO_TRIG" ENABLE;
--------------------------------------------------------
-- FIN SECCION DE DISPARADORES (TRIGGERS)
--------------------------------------------------------



--------------------------------------------------------
--  Constraints for Table AUTOR
--------------------------------------------------------

  ALTER TABLE "AUTOR" ADD CONSTRAINT "PK_AUTOR" PRIMARY KEY ("CODIGO_AUTOR");
  ALTER TABLE "AUTOR" MODIFY ("NOMBRE_AUTOR" NOT NULL ENABLE);
  ALTER TABLE "AUTOR" MODIFY ("CODIGO_AUTOR" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EJEMPLAR
--------------------------------------------------------

  ALTER TABLE "EJEMPLAR" ADD CONSTRAINT "PK_EJEMPLAR" PRIMARY KEY ("CODIGO_LIBRO", "CODIGO_EJEMPLAR");
  ALTER TABLE "EJEMPLAR" MODIFY ("DETERIORADO" NOT NULL ENABLE);
  ALTER TABLE "EJEMPLAR" MODIFY ("CODIGO_EJEMPLAR" NOT NULL ENABLE);
  ALTER TABLE "EJEMPLAR" MODIFY ("CODIGO_LIBRO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LIBRO
--------------------------------------------------------

  ALTER TABLE "LIBRO" ADD CONSTRAINT "PK_LIBRO" PRIMARY KEY ("CODIGO_LIBRO");
  ALTER TABLE "LIBRO" MODIFY ("ANIO_ESCRITO" NOT NULL ENABLE);
  ALTER TABLE "LIBRO" MODIFY ("TITULO_LIBRO" NOT NULL ENABLE);
  ALTER TABLE "LIBRO" MODIFY ("CODIGO_LIBRO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LIBRO_AUTOR
--------------------------------------------------------

  ALTER TABLE "LIBRO_AUTOR" ADD CONSTRAINT "PK_LIBRO_AUTOR" PRIMARY KEY ("CODIGO_AUTOR", "CODIGO_LIBRO");
  ALTER TABLE "LIBRO_AUTOR" MODIFY ("CODIGO_LIBRO" NOT NULL ENABLE);
  ALTER TABLE "LIBRO_AUTOR" MODIFY ("CODIGO_AUTOR" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRESTAMO
--------------------------------------------------------

  ALTER TABLE "PRESTAMO" ADD CONSTRAINT "PK_PRESTAMO" PRIMARY KEY ("CODIGO_LIBRO", "CODIGO_EJEMPLAR", "CODIGO_SOCIO", "FECHA_PRESTAMO");
  ALTER TABLE "PRESTAMO" MODIFY ("FECHA_PRESTAMO" NOT NULL ENABLE);
  ALTER TABLE "PRESTAMO" MODIFY ("CODIGO_SOCIO" NOT NULL ENABLE);
  ALTER TABLE "PRESTAMO" MODIFY ("CODIGO_EJEMPLAR" NOT NULL ENABLE);
  ALTER TABLE "PRESTAMO" MODIFY ("CODIGO_LIBRO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SOCIO
--------------------------------------------------------

  ALTER TABLE "SOCIO" ADD CONSTRAINT "PK_SOCIO" PRIMARY KEY ("CODIGO_SOCIO");
  ALTER TABLE "SOCIO" MODIFY ("TELEFONO_SOCIO" NOT NULL ENABLE);
  ALTER TABLE "SOCIO" MODIFY ("APELLIDO_SOCIO" NOT NULL ENABLE);
  ALTER TABLE "SOCIO" MODIFY ("NOMBRE_SOCIO" NOT NULL ENABLE);
  ALTER TABLE "SOCIO" MODIFY ("CEDULA_SOCIO" NOT NULL ENABLE);
  ALTER TABLE "SOCIO" MODIFY ("CODIGO_SOCIO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USUARIO
--------------------------------------------------------

  ALTER TABLE "USUARIO" ADD CONSTRAINT "PK_USUARIO" PRIMARY KEY ("CODIGO_USUARIO");
  ALTER TABLE "USUARIO" MODIFY ("CLAVE" NOT NULL ENABLE);
  ALTER TABLE "USUARIO" MODIFY ("CODIGO_SOCIO" NOT NULL ENABLE);
  ALTER TABLE "USUARIO" MODIFY ("CODIGO_USUARIO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table EJEMPLAR
--------------------------------------------------------

  ALTER TABLE "EJEMPLAR" ADD CONSTRAINT "FK_EJEMPLAR_FK_EJEMPL_LIBRO" FOREIGN KEY ("CODIGO_LIBRO")
	  REFERENCES "LIBRO" ("CODIGO_LIBRO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LIBRO_AUTOR
--------------------------------------------------------

  ALTER TABLE "LIBRO_AUTOR" ADD CONSTRAINT "FK_LIBRO_AU_FK_LIBRO__AUTOR" FOREIGN KEY ("CODIGO_AUTOR")
	  REFERENCES "AUTOR" ("CODIGO_AUTOR") ENABLE;
  ALTER TABLE "LIBRO_AUTOR" ADD CONSTRAINT "FK_LIBRO_AU_FK_LIBRO__LIBRO" FOREIGN KEY ("CODIGO_LIBRO")
	  REFERENCES "LIBRO" ("CODIGO_LIBRO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRESTAMO
--------------------------------------------------------

  ALTER TABLE "PRESTAMO" ADD CONSTRAINT "FK_PRESTAMO_FK_PRESTA_EJEMPLAR" FOREIGN KEY ("CODIGO_LIBRO", "CODIGO_EJEMPLAR")
	  REFERENCES "EJEMPLAR" ("CODIGO_LIBRO", "CODIGO_EJEMPLAR") ENABLE;
  ALTER TABLE "PRESTAMO" ADD CONSTRAINT "FK_PRESTAMO_FK_PRESTA_SOCIO" FOREIGN KEY ("CODIGO_SOCIO")
	  REFERENCES "SOCIO" ("CODIGO_SOCIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table USUARIO
--------------------------------------------------------

  ALTER TABLE "USUARIO" ADD CONSTRAINT "FK_USUARIO_FK_USUARI_SOCIO" FOREIGN KEY ("CODIGO_SOCIO")
	  REFERENCES "SOCIO" ("CODIGO_SOCIO") ON DELETE CASCADE ENABLE;

REM INSERTING into AUTOR
SET DEFINE OFF;
Insert into AUTOR (CODIGO_AUTOR,NOMBRE_AUTOR) values (NULL,'Elvia Sanchez');
Insert into AUTOR (CODIGO_AUTOR,NOMBRE_AUTOR) values (NULL,'Lidia Romero');
Insert into AUTOR (CODIGO_AUTOR,NOMBRE_AUTOR) values (NULL,'Lili Marquez');
Insert into AUTOR (CODIGO_AUTOR,NOMBRE_AUTOR) values (NULL,'Luis Perez');
REM INSERTING into LIBRO
SET DEFINE OFF;
Insert into LIBRO (CODIGO_LIBRO,TITULO_LIBRO,EDITORIAL_LIBRO,ANIO_ESCRITO,ANIO_EDICION,ISBN) values (NULL,'Metodologias Web','Norma','1830','2010','235');
Insert into LIBRO (CODIGO_LIBRO,TITULO_LIBRO,EDITORIAL_LIBRO,ANIO_ESCRITO,ANIO_EDICION,ISBN) values (NULL,'Matematica Aplicada 1','Norma','1976','2012','334');
Insert into LIBRO (CODIGO_LIBRO,TITULO_LIBRO,EDITORIAL_LIBRO,ANIO_ESCRITO,ANIO_EDICION,ISBN) values (NULL,'Ingenieria WEB','Norma','1999','2015','983');
Insert into LIBRO (CODIGO_LIBRO,TITULO_LIBRO,EDITORIAL_LIBRO,ANIO_ESCRITO,ANIO_EDICION,ISBN) values (NULL,'Base de Datos','LNS','1996','2013','953');
REM INSERTING into EJEMPLAR
SET DEFINE OFF;
Insert into EJEMPLAR (CODIGO_LIBRO,CODIGO_EJEMPLAR,DETERIORADO) values ('1','1','0');
Insert into EJEMPLAR (CODIGO_LIBRO,CODIGO_EJEMPLAR,DETERIORADO) values ('1','2','1');
Insert into EJEMPLAR (CODIGO_LIBRO,CODIGO_EJEMPLAR,DETERIORADO) values ('3','1','0');
Insert into EJEMPLAR (CODIGO_LIBRO,CODIGO_EJEMPLAR,DETERIORADO) values ('3','2','0');
Insert into EJEMPLAR (CODIGO_LIBRO,CODIGO_EJEMPLAR,DETERIORADO) values ('4','1','1');
REM INSERTING into LIBRO_AUTOR
SET DEFINE OFF;
Insert into LIBRO_AUTOR (CODIGO_AUTOR,CODIGO_LIBRO) values ('3','2');
Insert into LIBRO_AUTOR (CODIGO_AUTOR,CODIGO_LIBRO) values ('3','3');
Insert into LIBRO_AUTOR (CODIGO_AUTOR,CODIGO_LIBRO) values ('4','1');
REM INSERTING into SOCIO
SET DEFINE OFF;
Insert into SOCIO (CODIGO_SOCIO,CEDULA_SOCIO,USUARIO_SOCIO,NOMBRE_SOCIO,APELLIDO_SOCIO,TELEFONO_SOCIO) values (NULL,'1234567890','ADM','Administrador','S/N','6666666');
Insert into SOCIO (CODIGO_SOCIO,CEDULA_SOCIO,USUARIO_SOCIO,NOMBRE_SOCIO,APELLIDO_SOCIO,TELEFONO_SOCIO) values (NULL,'1720241064','arosero','Angelica','Rosero','2646825');
Insert into SOCIO (CODIGO_SOCIO,CEDULA_SOCIO,USUARIO_SOCIO,NOMBRE_SOCIO,APELLIDO_SOCIO,TELEFONO_SOCIO) values (NULL,'1710106079','jaltamirano','Jose','Altamirano','2789352');
Insert into SOCIO (CODIGO_SOCIO,CEDULA_SOCIO,USUARIO_SOCIO,NOMBRE_SOCIO,APELLIDO_SOCIO,TELEFONO_SOCIO) values (NULL,'0400473740','erosero','Ernesto','Rosero','2789341');
Insert into SOCIO (CODIGO_SOCIO,CEDULA_SOCIO,USUARIO_SOCIO,NOMBRE_SOCIO,APELLIDO_SOCIO,TELEFONO_SOCIO) values (NULL,'1720241056','mmejia','Marcela','Mejia','2874391');
REM INSERTING into USUARIO
SET DEFINE OFF;
Insert into USUARIO (CODIGO_USUARIO,CODIGO_SOCIO,CLAVE) values (NULL,'1','123');
Insert into USUARIO (CODIGO_USUARIO,CODIGO_SOCIO,CLAVE) values (NULL,'2','123');
Insert into USUARIO (CODIGO_USUARIO,CODIGO_SOCIO,CLAVE) values (NULL,'3','123');
Insert into USUARIO (CODIGO_USUARIO,CODIGO_SOCIO,CLAVE) values (NULL,'4','123');
Insert into USUARIO (CODIGO_USUARIO,CODIGO_SOCIO,CLAVE) values (NULL,'5','123');
REM INSERTING into PRESTAMO
SET DEFINE OFF;
Insert into PRESTAMO (CODIGO_LIBRO,CODIGO_EJEMPLAR,CODIGO_SOCIO,FECHA_PRESTAMO,FECHA_DEVOLUCION_REAL,FECHA_DEVOLVER) values ('1','2','2',to_date('07/02/18','DD/MM/RR'),to_date('16/02/18','DD/MM/RR'),to_date('06/02/18','DD/MM/RR'));
Insert into PRESTAMO (CODIGO_LIBRO,CODIGO_EJEMPLAR,CODIGO_SOCIO,FECHA_PRESTAMO,FECHA_DEVOLUCION_REAL,FECHA_DEVOLVER) values ('3','1','2',to_date('20/02/18','DD/MM/RR'),to_date('25/02/18','DD/MM/RR'),to_date('28/02/18','DD/MM/RR'));
Insert into PRESTAMO (CODIGO_LIBRO,CODIGO_EJEMPLAR,CODIGO_SOCIO,FECHA_PRESTAMO,FECHA_DEVOLUCION_REAL,FECHA_DEVOLVER) values ('4','1','1',to_date('26/02/18','DD/MM/RR'),to_date('21/02/18','DD/MM/RR'),to_date('25/02/18','DD/MM/RR'));
Insert into PRESTAMO (CODIGO_LIBRO,CODIGO_EJEMPLAR,CODIGO_SOCIO,FECHA_PRESTAMO,FECHA_DEVOLUCION_REAL,FECHA_DEVOLVER) values ('1','1','2',to_date('13/02/18','DD/MM/RR'),to_date('25/02/18','DD/MM/RR'),to_date('30/03/18','DD/MM/RR'));