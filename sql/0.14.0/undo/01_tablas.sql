rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/014_UNDO_01_TABLAS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

--------------------
-- VERSION 0.14.0 --
--------------------

ALTER TABLE GE_OBSERVACIONES_EXPEDIENTES DROP COLUMN OBSEXP_PLA_ID;
ALTER TABLE GE_OBSERVACIONES_EXPEDIENTES DROP COLUMN OBSEXP_TAR_ID;
ALTER TABLE GE_OBSERVACIONES_EXPEDIENTES DROP COLUMN OBSEXP_TRAM_ID;

ALTER TABLE GE_OBSERVACIONES_EXPEDIENTES_H DROP COLUMN OBSEXP_PLA_ID;
ALTER TABLE GE_OBSERVACIONES_EXPEDIENTES_H DROP COLUMN OBSEXP_TAR_ID;
ALTER TABLE GE_OBSERVACIONES_EXPEDIENTES_H DROP COLUMN OBSEXP_TRAM_ID;

ALTER TABLE GE_TRAMITE_EXPED DROP COLUMN TRAM_EXP_OBSEXP_ID;
ALTER TABLE GE_TRAMITE_EXPED_H DROP COLUMN TRAM_EXP_OBSEXP_ID;

ALTER TABLE GE_TAREAS_EXPEDIENTE DROP COLUMN TAR_EXP_OBSEXP_ID;
ALTER TABLE GE_TAREAS_EXPEDIENTE_H DROP COLUMN TAR_EXP_OBSEXP_ID;

ALTER TABLE GE_PLAZOS_EXPDTE DROP COLUMN PLA_EXP_OBSEXP_ID;
ALTER TABLE GE_PLAZOS_EXPDTE_H DROP COLUMN PLA_EXP_OBSEXP_ID;


--ALTER TABLE GE_TRAMITE_EXPED ADD (T_OBSERVACIONES VARCHAR2(4000 CHAR));
--ALTER TABLE GE_TRAMITE_EXPED_H ADD (T_OBSERVACIONES VARCHAR2(4000 CHAR));
--ALTER TABLE GE_TAREAS_EXPEDIENTE ADD (T_OBSERVACIONES VARCHAR2(4000 CHAR));
--ALTER TABLE GE_TAREAS_EXPEDIENTE_H ADD (T_OBSERVACIONES VARCHAR2(4000 CHAR));
--ALTER TABLE GE_PLAZOS_EXPDTE ADD (T_OBSERVACIONES VARCHAR2(4000 CHAR));
--ALTER TABLE GE_PLAZOS_EXPDTE_H ADD (T_OBSERVACIONES VARCHAR2(4000 CHAR));

ALTER TABLE GE_OBSERVACIONES_EXPEDIENTES MODIFY F_ENTRADA TIMESTAMP NOT NULL;
ALTER TABLE GE_OBSERVACIONES_EXPEDIENTES MODIFY  T_TEXTO VARCHAR2(4000 CHAR) NOT NULL;

-- -------------------

ALTER TABLE GE_SUJETOS_OBLIGADOS_EXPDT DROP COLUMN T_NOMBRE_RAZONSOCIAL;
ALTER TABLE GE_SUJETOS_OBLIGADOS_EXPDT DROP COLUMN N_TELEFONO;
ALTER TABLE GE_SUJETOS_OBLIGADOS_EXPDT DROP COLUMN T_APELLIDOS;
ALTER TABLE GE_SUJETOS_OBLIGADOS_EXPDT DROP COLUMN L_DPD;
ALTER TABLE GE_SUJETOS_OBLIGADOS_EXPDT DROP COLUMN T_EMAIL;

ALTER TABLE GE_SUJETOS_OBLIGADOS_EXPDT_H DROP COLUMN T_NOMBRE_RAZONSOCIAL;
ALTER TABLE GE_SUJETOS_OBLIGADOS_EXPDT_H DROP COLUMN N_TELEFONO;
ALTER TABLE GE_SUJETOS_OBLIGADOS_EXPDT_H DROP COLUMN T_APELLIDOS;
ALTER TABLE GE_SUJETOS_OBLIGADOS_EXPDT_H DROP COLUMN L_DPD;
ALTER TABLE GE_SUJETOS_OBLIGADOS_EXPDT_H DROP COLUMN T_EMAIL;
-- ------------------

DROP TABLE GE_CONEXIONES_USUARIOS CASCADE CONSTRAINTS;

-- ------------------

ALTER TABLE GE_CFG_METADATOS_TRAM DROP COLUMN D_BT_VINCULAR_DOC;

-- -------------------

ALTER TABLE GE_DETALLE_EXPDTE_TRAM DROP COLUMN L_ACUSE_RECIBO;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM DROP COLUMN DETEXPTRAM_FIRMANTE_ID;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM DROP COLUMN DETEXPTRAM_VDOM_TIPFIRM_ID;

ALTER TABLE GE_DETALLE_EXPDTE_TRAM_H DROP COLUMN L_ACUSE_RECIBO;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM_H DROP COLUMN DETEXPTRAM_FIRMANTE_ID;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM_H DROP COLUMN DETEXPTRAM_VDOM_TIPFIRM_ID;

ALTER TABLE GE_CFG_METADATOS_TRAM DROP COLUMN D_ACUSE_RECIBO;
ALTER TABLE GE_CFG_METADATOS_TRAM DROP COLUMN D_FIRMANTE;
ALTER TABLE GE_CFG_METADATOS_TRAM DROP COLUMN D_TIPO_FIRMA;

ALTER TABLE GE_CFG_METADATOS_TRAM_H DROP COLUMN D_ACUSE_RECIBO;
ALTER TABLE GE_CFG_METADATOS_TRAM_H DROP COLUMN D_FIRMANTE;
ALTER TABLE GE_CFG_METADATOS_TRAM_H DROP COLUMN D_TIPO_FIRMA;

ALTER TABLE GE_USUARIOS DROP COLUMN L_FIRMANTE;
ALTER TABLE GE_USUARIOS_H DROP COLUMN L_FIRMANTE;



SPOOL OFF;
