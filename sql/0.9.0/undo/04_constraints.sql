rem Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/009_UNDO_04_CONSTRAINTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

-------------------
-- VERSION 0.9.0 --
-------------------

ALTER TABLE GE_EXPEDIENTES ADD CONSTRAINT GE_EXP_VALDOM_MAT_FK FOREIGN KEY (EXP_VALDOM_MAT_ID) REFERENCES GE_VALORES_DOMINIOS;



SPOOL OFF;