rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/003_UNDO_02_SECUENCIAS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

-------------------
-- VERSION 0.3.0 --
-------------------

DROP SEQUENCE S_DOMINIOS;

DROP SEQUENCE S_VALORES_DOMINIOS;

DROP SEQUENCE S_EXPEDIENTES;

DROP SEQUENCE S_PERSONAS_EXPEDIENTES;

DROP SEQUENCE S_MATERIAS_TIPEXPEDIENTES;

DROP SEQUENCE S_SUJETOS_OBLIGADOS_EXPDT;

SPOOL OFF;