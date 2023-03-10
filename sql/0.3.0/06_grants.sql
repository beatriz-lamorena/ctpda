rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/003_06_GRANTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_DOMINIOS TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_DOMINIOS TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_DOMINIOS_H TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_VALORES_DOMINIOS TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_VALORES_DOMINIOS TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_VALORES_DOMINIOS_H TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_MATERIAS_TIPEXPEDIENTES TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_MATERIAS_TIPEXPEDIENTES TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_MATERIAS_TIPEXPEDIENTES_H TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_EXPEDIENTES TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_EXPEDIENTES TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_EXPEDIENTES_H TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_PERSONAS_EXPEDIENTES TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_PERSONAS_EXPEDIENTES TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_PERSONAS_EXPEDIENTES_H TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_SUJETOS_OBLIGADOS_EXPDT TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_SUJETOS_OBLIGADOS_EXPDT TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_SUJETOS_OBLIGADOS_EXPDT_H TO GE_ROL_GESTOR_DML;

SPOOL OFF;