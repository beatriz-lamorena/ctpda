rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/016_UNDO_01_TABLAS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

--------------------
-- VERSION 0.16.0 --
--------------------


ALTER TABLE GE_CFG_TAREAS   DROP ( 
	L_CAMBIO_AUT_TRAMITE,
	CFGTAR_RESP_CAMBIO_AUT_ID
);

ALTER TABLE GE_CFG_TAREAS_H DROP ( 
	L_CAMBIO_AUT_TRAMITE,
	CFGTAR_RESP_CAMBIO_AUT_ID
);

-- -------------

ALTER TABLE GE_TIPO_TRAMITE DROP COLUMN D_SUBSITUACION;
ALTER TABLE GE_TIPO_TRAMITE_H DROP COLUMN D_SUBSITUACION;

ALTER TABLE GE_CFG_TIPOEXPEDIENTE DROP COLUMN CFG_VALDOM_SERIERESREC_ID;
ALTER TABLE GE_CFG_TIPOEXPEDIENTE_H DROP COLUMN CFG_VALDOM_SERIERESREC_ID;
ALTER TABLE GE_CFG_TIPOEXPEDIENTE DROP COLUMN CFG_VALDOM_TIPRESREC_ID;
ALTER TABLE GE_CFG_TIPOEXPEDIENTE_H DROP COLUMN CFG_VALDOM_TIPRESREC_ID;

ALTER TABLE GE_TIPO_TRAMITE DROP COLUMN L_SUBSITUACION_SUP;
ALTER TABLE GE_TIPO_TRAMITE_H DROP COLUMN L_SUBSITUACION_SUP;

-- -------------

ALTER TABLE GE_DETALLE_EXPDTE_TRAM DROP COLUMN DETEXPTRAM_VDOM_ACTREC_ID;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM_H DROP COLUMN DETEXPTRAM_VDOM_ACTREC_ID;

ALTER TABLE GE_CFG_METADATOS_TRAM DROP COLUMN D_ACTO_REC;
ALTER TABLE GE_CFG_METADATOS_TRAM_H DROP COLUMN D_ACTO_REC;

-- -------------

ALTER TABLE GE_AGRUP_DOCUMENTOS   DROP (L_VINCULADO);
ALTER TABLE GE_AGRUP_DOCUMENTOS_H DROP (L_VINCULADO);

ALTER TABLE GE_TIPO_TRAMITE   DROP (L_TRAT_VINCULADOS);
ALTER TABLE GE_TIPO_TRAMITE_H DROP (L_TRAT_VINCULADOS);

---------------------

ALTER TABLE GE_CFG_TIPOEXPEDIENTE DROP COLUMN N_DIASFINALIZACION;
ALTER TABLE GE_CFG_TIPOEXPEDIENTE_H DROP COLUMN N_DIASFINALIZACION;

DROP TABLE GE_LOG_CRON;

---------------------

ALTER TABLE GE_CFG_TAREAS   DROP ( 
	D_CIERRE_AUTO_TRAMITE
);

ALTER TABLE GE_CFG_TAREAS_H DROP ( 
	D_CIERRE_AUTO_TRAMITE
);

--------------------

ALTER TABLE GE_SITUACIONES_EXPEDIENTES DROP COLUMN L_NO_SUPERVISADA;
ALTER TABLE GE_SITUACIONES_EXPEDIENTES_H DROP COLUMN L_NO_SUPERVISADA;

-----------------------

ALTER TABLE GE_CFG_TIPOEXPEDIENTE DROP COLUMN N_DIASALEGACIONES;
ALTER TABLE GE_CFG_TIPOEXPEDIENTE_H DROP COLUMN N_DIASALEGACIONES;

---------------

ALTER TABLE GE_CFG_TAREAS DROP COLUMN L_CIERRE_SUBTRA;
ALTER TABLE GE_CFG_TAREAS_H DROP COLUMN L_CIERRE_SUBTRA;

-- -------------

ALTER TABLE GE_CFG_TAREAS   DROP ( 
	D_PLAZO_REFERENCIA,
	N_DIAS_PLAZO_REFERENCIA
);

ALTER TABLE GE_CFG_TAREAS_H DROP ( 
	D_PLAZO_REFERENCIA,
	N_DIAS_PLAZO_REFERENCIA
);

ALTER TABLE GE_TAREAS_EXPEDIENTE   DROP ( 
	D_PLAZO_REFERENCIA
);

ALTER TABLE GE_TAREAS_EXPEDIENTE_H DROP ( 
	D_PLAZO_REFERENCIA
);

-------------------

ALTER TABLE GE_PERSONAS_EXPEDIENTES DROP COLUMN L_INTERESADO;
ALTER TABLE GE_PERSONAS_EXPEDIENTES_H DROP COLUMN L_INTERESADO;

-------------------

ALTER TABLE GE_CFG_METADATOS_TRAM   DROP (D_BT_EMPUJAR_DOC);
ALTER TABLE GE_CFG_METADATOS_TRAM_H DROP (D_BT_EMPUJAR_DOC);

------------------------------

ALTER TABLE GE_CFG_TIPOEXPEDIENTE DROP COLUMN CFGTIPOEXP_RESPTRAMITACION_ID;
ALTER TABLE GE_CFG_TIPOEXPEDIENTE DROP COLUMN CFGTIPOEXP_PERSONAS_ID;
ALTER TABLE GE_CFG_TIPOEXPEDIENTE DROP COLUMN CFGTIPOEXP_SUJETOSOBLIGADOS_ID;

ALTER TABLE GE_CFG_TIPOEXPEDIENTE_H DROP COLUMN CFGTIPOEXP_RESPTRAMITACION_ID;
ALTER TABLE GE_CFG_TIPOEXPEDIENTE_H DROP COLUMN CFGTIPOEXP_PERSONAS_ID;
ALTER TABLE GE_CFG_TIPOEXPEDIENTE_H DROP COLUMN CFGTIPOEXP_SUJETOSOBLIGADOS_ID;




SPOOL OFF;
