rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/012_06_GRANTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

-------------------
-- VERSION 0.12.0 --
-------------------


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CFG_AUTO_SITUACION TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_CFG_AUTO_SITUACION TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CFG_AUTO_SITUACION_h TO GE_ROL_GESTOR_DML;

-- -------

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CFG_DOC_EXPED_DESC TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_CFG_DOC_EXPED_DESC TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CFG_DOC_EXPED_DESC_H TO GE_ROL_GESTOR_DML;

-- --------


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CFG_TIPOEXPEDIENTE TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_CFG_TIPOEXPEDIENTE TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CFG_TIPOEXPEDIENTE_h TO GE_ROL_GESTOR_DML;



SPOOL OFF;