rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/014_03_INDICES.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;


-------------------
-- VERSION 0.14.0 --
-------------------

ALTER TABLE GE_CONEXIONES_USUARIOS ADD CONSTRAINT GE_CONEXIONES_USU_PK PRIMARY KEY (CON_ID) USING INDEX TABLESPACE GESTOR_IND;


SPOOL OFF;
