rem Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/009_02_SECUENCIAS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

-------------------
-- VERSION 0.9.0 --
-------------------

CREATE SEQUENCE S_DATOS_TMP_USUARIO       START WITH 1 INCREMENT BY  1;

CREATE SEQUENCE S_MATERIAS_EXPDT START WITH 1 INCREMENT BY  1;


SPOOL OFF;
