rem Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/011_UNDO_04_CONSTRAINTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

--------------------
-- VERSION 0.11.0 --
--------------------


ALTER TABLE GE_DOCUMENTOS_RESOLUCIONES ADD CONSTRAINT DOCRES_DOC_FK FOREIGN KEY (DOCRES_DOC_ID) REFERENCES GE_DOCUMENTOS;



SPOOL OFF;