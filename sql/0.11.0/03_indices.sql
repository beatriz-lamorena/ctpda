rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/011_03_INDICES.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;


-------------------
-- VERSION 0.11.0 --
-------------------

ALTER TABLE GE_RESOLUCIONES ADD CONSTRAINT GE_RESOLUCIONES_PK PRIMARY KEY (RES_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_RESOLUCIONES_H ADD CONSTRAINT GE_RESOLUCIONES_H_PK PRIMARY KEY (RES_ID, REV) USING INDEX TABLESPACE GESTOR_IND;

ALTER TABLE GE_RESOL_EXPEDIENTES ADD CONSTRAINT GE_RESOL_EXPEDIENTES_PK PRIMARY KEY (RESEXP_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_RESOL_EXPEDIENTES_H ADD CONSTRAINT GE_RESOL_EXPEDIENTES_H_PK PRIMARY KEY (RESEXP_ID, REV) USING INDEX TABLESPACE GESTOR_IND;

ALTER TABLE GE_RESOL_SUJOBL ADD CONSTRAINT GE_RESOL_SUJOBL_PK PRIMARY KEY (RESSUJOBL_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_RESOL_SUJOBL_H ADD CONSTRAINT GE_RESOL_SUJOBL_H_PK PRIMARY KEY (RESSUJOBL_ID, REV) USING INDEX TABLESPACE GESTOR_IND;

ALTER TABLE GE_RESOL_PERSONA ADD CONSTRAINT GE_RESOL_PERSONA_PK PRIMARY KEY (RESPER_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_RESOL_PERSONA_H ADD CONSTRAINT GE_RESOL_PERSONA_H_PK PRIMARY KEY (RESPER_ID, REV) USING INDEX TABLESPACE GESTOR_IND;

ALTER TABLE GE_ARTICULOS_AFECTAD_RESOL ADD CONSTRAINT GE_ARTICUL_AFECTAD_RESOL_PK PRIMARY KEY (ART_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_ARTICULOS_AFECTAD_RESOL_H ADD CONSTRAINT GE_ARTICUL_AFECTAD_RESOL_H_PK PRIMARY KEY (ART_ID, REV) USING INDEX TABLESPACE GESTOR_IND;

ALTER TABLE GE_DERECH_RECLAM_RESOL ADD CONSTRAINT GE_DERECH_RECLAM_RESOL_PK PRIMARY KEY (DER_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_DERECH_RECLAM_RESOL_H ADD CONSTRAINT GE_DERECH_RECLAM_RESOL_H_PK PRIMARY KEY (DER_ID, REV) USING INDEX TABLESPACE GESTOR_IND;

ALTER TABLE GE_DOCUMENTOS_RESOLUCIONES ADD CONSTRAINT GE_DOCUMENT_RESOLUCIONES_PK PRIMARY KEY (DOCRES_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_DOCUMENTOS_RESOLUCIONES_H ADD CONSTRAINT GE_DOCUMENT_RESOLUCIONES_H_PK PRIMARY KEY (DOCRES_ID, REV) USING INDEX TABLESPACE GESTOR_IND;


ALTER TABLE GE_ACCESOS_DOCS   ADD CONSTRAINT GE_ACCESOS_DOCS_PK   PRIMARY KEY (ACD_ID)      USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_ACCESOS_DOCS_H ADD CONSTRAINT GE_ACCESOS_DOCS_H_PK PRIMARY KEY (ACD_ID, REV) USING INDEX TABLESPACE GESTOR_IND;

CREATE INDEX GE_ACC_DOC_DOC_IDX ON GE_ACCESOS_DOCS (ACD_DOC_ID) TABLESPACE GESTOR_IND;


SPOOL OFF;
