rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/008_06_GRANTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_RESP_TRAMITACION TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_RESP_TRAMITACION TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_RESP_TRAMITACION_H TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_USUARIO_RESP TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_USUARIO_RESP TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_USUARIO_RESP_H TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CFG_TAREAS TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_CFG_TAREAS TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CFG_TAREAS_H TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_TAREAS_EXPEDIENTE TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_TAREAS_EXPEDIENTE TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_TAREAS_EXPEDIENTE_H TO GE_ROL_GESTOR_DML;




SPOOL OFF;