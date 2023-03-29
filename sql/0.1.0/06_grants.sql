rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/001_06_GRANTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_COMUNICACIONES TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_COMUNICACIONES TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_COMUNICACIONES_H TO GE_ROL_GESTOR_DML;


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_LOCALIDADES TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_LOCALIDADES TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_LOCALIDADES_H TO GE_ROL_GESTOR_DML;


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_MATERIAS TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_MATERIA TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_MATERIAS_H TO GE_ROL_GESTOR_DML;


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_MOTIVOSRELACION TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_MOTIVOSRELACION TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_MOTIVOSRELACION_H TO GE_ROL_GESTOR_DML;


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_PARAMETROS TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_PARAMETRO TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_PARAMETROS_H TO GE_ROL_GESTOR_DML;


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_PERSONAS TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_PERSONAS TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_PERSONAS_H TO GE_ROL_GESTOR_DML;


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_PERSONASCOMUNICACIONES TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_PERSONASCOMUNICACIONES TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_PERSONASCOMUNICACIONES_H TO GE_ROL_GESTOR_DML;


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_PROVINCIAS TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_PROVINCIAS TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_PROVINCIAS_H TO GE_ROL_GESTOR_DML;


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_REVAUD TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_REVAUD TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_SEXO TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_SEXO TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_SEXO_H TO GE_ROL_GESTOR_DML;


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_TIPOEXPEDIENTES TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_TIPOEXPEDIENTE TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_TIPOEXPEDIENTES_H TO GE_ROL_GESTOR_DML;


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_TIPOSPERSONAS TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_TIPOSPERSONAS TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_TIPOSPERSONAS_H TO GE_ROL_GESTOR_DML;


SPOOL OFF;
