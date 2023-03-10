rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/002_03_INDICES.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;


ALTER TABLE GE_TIPOS_AGRUPACIONES ADD CONSTRAINT GE_TIPOS_AGRUPACIONES_PK PRIMARY KEY (TIP_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_TIPOS_AGRUPACIONES_H ADD CONSTRAINT GE_TIPOS_AGRUPACIONES_H_PK PRIMARY KEY (TIP_ID, REV) USING INDEX TABLESPACE GESTOR_IND;

ALTER TABLE GE_SUJETOS_OBLIGADOS ADD CONSTRAINT GE_SUJETOS_OBLIGADOS_PK PRIMARY KEY (SUJ_ID) USING INDEX TABLESPACE GESTOR_IND;
ALTER TABLE GE_SUJETOS_OBLIGADOS_H ADD CONSTRAINT GE_SUJETOS_OBLIGADOS_H_PK PRIMARY KEY (SUJ_ID, REV) USING INDEX TABLESPACE GESTOR_IND;

SPOOL OFF;
