rem Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/008_02_SECUENCIAS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

-------------------
-- VERSION 0.8.0 --
-------------------


CREATE SEQUENCE S_RESP_TRAMITACION       START WITH 1 INCREMENT BY  1;
CREATE SEQUENCE S_USUARIO_RESP           START WITH 1 INCREMENT BY  1;
CREATE SEQUENCE S_CFG_TAREAS             START WITH 1 INCREMENT BY  1;
CREATE SEQUENCE S_CFG_TAREAS_SIGUIENTE   START WITH 1 INCREMENT BY  1;
CREATE SEQUENCE S_TAREAS_EXPEDIENTE      START WITH 1 INCREMENT BY  1;



SPOOL OFF;