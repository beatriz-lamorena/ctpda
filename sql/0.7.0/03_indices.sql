rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/007_03_INDICES.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

ALTER TABLE GE_DETALLE_EXPDTE_TRAM ADD CONSTRAINT GE_DETALLE_EXPDTE_TRAM_PK PRIMARY KEY (DET_EXP_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM_H ADD CONSTRAINT GE_DETALLE_EXPDTE_TRAM_H_PK PRIMARY KEY (DET_EXP_ID, REV) USING INDEX TABLESPACE GESTOR_IND;

ALTER TABLE GE_CFG_METADATOS_TRAM ADD CONSTRAINT GE_CFG_METADATOS_TRAM_PK PRIMARY KEY (CFG_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_CFG_METADATOS_TRAM_H ADD CONSTRAINT GE_CFG_METADATOS_TRAM_H_PK PRIMARY KEY (CFG_ID, REV) USING INDEX TABLESPACE GESTOR_IND;
-------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE GE_CFG_PLAZOS_EXPDTE ADD CONSTRAINT GE_CFG_PLAZOS_EXPDTE_PK PRIMARY KEY (CFG_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_CFG_PLAZOS_EXPDTE_H ADD CONSTRAINT GE_CFG_PLAZOS_EXPDTE_H_PK PRIMARY KEY (CFG_ID, REV) USING INDEX TABLESPACE GESTOR_IND;

ALTER TABLE GE_CFG_PLAZOS_ESTILOS ADD CONSTRAINT GE_CFG_PLAZOS_ESTILOS_PK PRIMARY KEY (CFG_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_CFG_PLAZOS_ESTILOS_H ADD CONSTRAINT GE_CFG_PLAZOS_ESTILOS_H_PK PRIMARY KEY (CFG_ID, REV) USING INDEX TABLESPACE GESTOR_IND;

ALTER TABLE GE_PLAZOS_EXPDTE ADD CONSTRAINT GE_PLAZOS_EXPDTE_PK PRIMARY KEY (PLA_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_PLAZOS_EXPDTE_H ADD CONSTRAINT GE_PLAZOS_EXPDTE_H_PK PRIMARY KEY (PLA_ID, REV) USING INDEX TABLESPACE GESTOR_IND;
-------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE GE_CFG_PLAZOS_AUT ADD CONSTRAINT GE_CFG_PLAZOS_AUT_PK PRIMARY KEY (CFG_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_CFG_PLAZOS_AUT_H ADD CONSTRAINT GE_CFG_PLAZOS_AUT_H_PK PRIMARY KEY (CFG_ID, REV) USING INDEX TABLESPACE GESTOR_IND;
-------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE GE_DOCUMENTOS_EXPED_TRAMITES ADD CONSTRAINT GE_DOCU_EXPED_TRAMITES_PK PRIMARY KEY (DETR_ID) USING INDEX TABLESPACE GESTOR_IND;



SPOOL OFF;