rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/FORMACION_UNDO.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

-----------------------
-- VERSION FORMACION --
-----------------------

DROP TABLE FOR_PRUEBAS CASCADE CONSTRAINTS;
DROP TABLE FOR_PRUEBAS_H CASCADE CONSTRAINTS;

DROP SEQUENCE S_FOR_PRUEBAS;

SPOOL OFF;