rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/014_06_GRANTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

-------------------
-- VERSION 0.14.0 --
-------------------

GRANT SELECT ON GE_LISTADO_OBSERVACIONES_EXP TO GE_ROL_GESTOR_DML;
-- --------------

GRANT SELECT ON GE_TRAMITES_ABIERTOS TO GE_ROL_GESTOR_DML;

-- ---------------

GRANT SELECT ON GE_LISTADO_NOTIFICACIONES_TRAM TO GE_ROL_GESTOR_DML;

-- ---------------

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CONEXIONES_USUARIOS TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_CONEXIONES_USUARIOS TO GE_ROL_GESTOR_DML;

SPOOL OFF;
