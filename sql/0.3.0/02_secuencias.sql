rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/003_02_SECUENCIAS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

CREATE SEQUENCE S_DOMINIOS START WITH 1 INCREMENT BY  1;

CREATE SEQUENCE S_VALORES_DOMINIOS START WITH 1 INCREMENT BY  1;

CREATE SEQUENCE S_EXPEDIENTES START WITH 1 INCREMENT BY  1;

CREATE SEQUENCE S_SUJETOS_OBLIGADOS_EXPDT START WITH 1 INCREMENT BY  1;

CREATE SEQUENCE S_PERSONAS_EXPEDIENTES START WITH 1 INCREMENT BY  1;

CREATE SEQUENCE S_MATERIAS_TIPEXPEDIENTES START WITH 1 INCREMENT BY  1;

SPOOL OFF;
