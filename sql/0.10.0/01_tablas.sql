rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/010_01_TABLAS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

--------------------
-- VERSION 0.10.0 --
--------------------

ALTER TABLE GE_PLAZOS_EXPDTE ADD (PLAEXP_VALDOM_TIPPLA_ID NUMBER(19,0));
ALTER TABLE GE_PLAZOS_EXPDTE_H ADD (PLAEXP_VALDOM_TIPPLA_ID NUMBER(19,0)); 
ALTER TABLE GE_PLAZOS_EXPDTE DROP COLUMN PLAEXP_CFGPLAEXP_ID;
ALTER TABLE GE_PLAZOS_EXPDTE_H DROP COLUMN PLAEXP_CFGPLAEXP_ID;

ALTER TABLE GE_TIPO_TRAMITE ADD (L_INFORMAL NUMBER (1,0) DEFAULT(0));
ALTER TABLE GE_TIPO_TRAMITE_H ADD (L_INFORMAL NUMBER (1,0));

-- --------------------------------------------------------
-- Comportamiento C011

ALTER TABLE GE_DETALLE_EXPDTE_TRAM   ADD (VALDOM_CANAL_INF_ENT_ID NUMBER(19, 0), VALDOM_CANAL_INF_SAL_ID NUMBER(19, 0), D_DATOS_CANAL_ENTRADA VARCHAR2(50 CHAR));
ALTER TABLE GE_DETALLE_EXPDTE_TRAM_H ADD (VALDOM_CANAL_INF_ENT_ID NUMBER(19, 0), VALDOM_CANAL_INF_SAL_ID NUMBER(19, 0), D_DATOS_CANAL_ENTRADA VARCHAR2(50 CHAR));

ALTER TABLE GE_CFG_METADATOS_TRAM   ADD (D_CANAL_INF_ENTRADA VARCHAR2(50 CHAR), D_CANAL_INF_SALIDA VARCHAR2(50 CHAR) );
ALTER TABLE GE_CFG_METADATOS_TRAM_H ADD (D_CANAL_INF_ENTRADA VARCHAR2(50 CHAR), D_CANAL_INF_SALIDA VARCHAR2(50 CHAR) );

-- --------------------------------------------------------
-- Comportamiento C014

ALTER TABLE GE_EXPEDIENTES   ADD (EXP_VALDOM_INSTAPI_ID NUMBER(19, 0));
ALTER TABLE GE_EXPEDIENTES_H ADD (EXP_VALDOM_INSTAPI_ID NUMBER(19, 0));

ALTER TABLE GE_DETALLE_EXPDTE_TRAM   ADD (DET_VALDOM_INSTAPI_ID NUMBER(19, 0), L_API NUMBER(1,0) DEFAULT 0);
ALTER TABLE GE_DETALLE_EXPDTE_TRAM_H ADD (DET_VALDOM_INSTAPI_ID NUMBER(19, 0), L_API NUMBER(1,0));

ALTER TABLE GE_CFG_METADATOS_TRAM   ADD (D_API VARCHAR2(50 CHAR), D_INSTRUCTOR_API VARCHAR2(50 CHAR));
ALTER TABLE GE_CFG_METADATOS_TRAM_H ADD (D_API VARCHAR2(50 CHAR), D_INSTRUCTOR_API VARCHAR2(50 CHAR));

--- -------------------------------------------------------
-- Ampliación de campos de texto largo

ALTER TABLE GE_PLAZOS_EXPDTE MODIFY T_OBSERVACIONES VARCHAR2(4000 CHAR);
ALTER TABLE GE_PLAZOS_EXPDTE_H MODIFY T_OBSERVACIONES VARCHAR2(4000 CHAR);

ALTER TABLE GE_EXPEDIENTES MODIFY T_MOTIVO VARCHAR2(4000 CHAR);
ALTER TABLE GE_EXPEDIENTES_H MODIFY T_MOTIVO VARCHAR2(4000 CHAR);

ALTER TABLE GE_TRAMITE_EXPED MODIFY T_OBSERVACIONES VARCHAR2(4000 CHAR);
ALTER TABLE GE_TRAMITE_EXPED_H MODIFY T_OBSERVACIONES VARCHAR2(4000 CHAR);

ALTER TABLE GE_TAREAS_EXPEDIENTE MODIFY T_OBSERVACIONES VARCHAR2(4000 CHAR);
ALTER TABLE GE_TAREAS_EXPEDIENTE_H MODIFY T_OBSERVACIONES VARCHAR2(4000 CHAR);

ALTER TABLE GE_TAREAS_EXPEDIENTE MODIFY T_INDICACIONES_SIG VARCHAR2(4000 CHAR);
ALTER TABLE GE_TAREAS_EXPEDIENTE_H MODIFY T_INDICACIONES_SIG VARCHAR2(4000 CHAR);

ALTER TABLE GE_OBSERVACIONES_EXPEDIENTES MODIFY T_TEXTO VARCHAR2(4000 CHAR);
ALTER TABLE GE_OBSERVACIONES_EXPEDIENTES_H MODIFY T_TEXTO VARCHAR2(4000 CHAR);



SPOOL OFF;