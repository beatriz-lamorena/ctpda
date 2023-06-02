rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/006_06_GRANTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_SITUACIONES_EXPEDIENTES TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_SITUACIONES_EXPEDIENTES TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_SITUACIONES_EXPEDIENTES_H TO GE_ROL_GESTOR_DML;


GRANT SELECT, UPDATE, INSERT, DELETE ON GE_TIPO_TRAMITE TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_TIPO_TRAMITE TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_TIPO_TRAMITE_H TO GE_ROL_GESTOR_DML;
																  
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CFG_EXPED_TRAMITE  TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_CFG_EXPED_TRAMITE TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CFG_EXPED_TRAMITE_H TO GE_ROL_GESTOR_DML;
															  
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CFG_EXPED_SUBTRAM TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_CFG_EXPED_SUBTRAM TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CFG_EXPED_SUBTRAM_H TO GE_ROL_GESTOR_DML;
																  
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_TRAMITE_EXPED  TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_TRAMITE_EXPED TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_TRAMITE_EXPED_H TO GE_ROL_GESTOR_DML;
												
												
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_TIPOS_DOCUMENTOS TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_TIPOS_DOCUMENTOS TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_TIPOS_DOCUMENTOS_H TO GE_ROL_GESTOR_DML;
																  
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CFG_DOC_EXPED_TRAM TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_CFG_DOC_EXPED_TRAM TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_CFG_DOC_EXPED_TRAM_H TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_PLANTILLAS TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_PLANTILLAS TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_PLANTILLAS_H TO GE_ROL_GESTOR_DML;
																  
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_PLANTILLA_DOC  TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_PLANTILLA_DOC TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_PLANTILLA_DOC_H TO GE_ROL_GESTOR_DML;
																  
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_TIPOS_METADATOS_ENI TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_TIPOS_METADATOS_ENI  TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_TIPOS_METADATOS_ENI_H  TO GE_ROL_GESTOR_DML;
																  
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_VALORES_META_ENI TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_VALORES_META_ENI TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_VALORES_META_ENI_H TO GE_ROL_GESTOR_DML;
																  
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_DOCUMENTOS TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_DOCUMENTOS TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_DOCUMENTOS_H TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_DOCUMENTOS_EXPEDIENTES TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_DOCUMENTOS_EXPEDIENTES TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_DOCUMENTOS_EXPEDIENTES_H TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_AGRUP_EXPEDIENTES  TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_AGRUP_EXPEDIENTES TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_AGRUP_EXPEDIENTES_H TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_AGRUP_DOCUMENTOS TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_AGRUP_DOCUMENTOS TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_AGRUP_DOCUMENTOS_H TO GE_ROL_GESTOR_DML;
																  
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_METADATOS_DOCUMENTOS TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_METADATOS_DOCUMENTOS TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_METADATOS_DOCUMENTOS_H TO GE_ROL_GESTOR_DML;

GRANT SELECT, UPDATE, INSERT, DELETE ON GE_METADATOS_EXPEDIENTES  TO GE_ROL_GESTOR_DML;
GRANT SELECT, ALTER ON S_METADATOS_EXPEDIENTES TO GE_ROL_GESTOR_DML;
GRANT SELECT, UPDATE, INSERT, DELETE ON GE_METADATOS_EXPEDIENTES_H TO GE_ROL_GESTOR_DML;


SPOOL OFF;