rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/012_UNDO_07_VISTAS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

-------------------
-- VERSION 0.12.0 --
-------------------

CREATE OR REPLACE FORCE EDITIONABLE VIEW "GE_LISTADO_DOCUMENTOS_EXP_TRAM" ("DOCEXP_ID", "DOC_ID", "EXP_ID", "T_IDEN_DOC", "D_DESCRIPCION", "D_DESC_ABREV", "T_NOMBRE_FICHERO", "T_EXTENSION_FICHERO", "TIP_DOC_ID", "D_DESCRIPCION_TIPO", "F_CREACION", "F_MODIFICACION", "USU_CREACION", "USU_MODIFICACION", "N_ORDEN", "T_DOC_TRABAJO", "L_EDITABLE", "L_FIRMADO", "L_SELLADO", "L_ANONIMIZADO", "L_ANONIMIZADO_PARCIAL", "L_ACTIVO", "DOC_EXP_TRAM_ID", "ORIGEN_DOCEXPTR", "TRAM_EXPE_ID", "TRAM_EXPE_SUP_ID") AS 
  SELECT
		DE.DOCEXP_ID,DE.DOC_ID,DE.EXP_ID,DE.T_IDEN_DOC,DE.D_DESCRIPCION,DE.D_DESC_ABREV,DE.T_NOMBRE_FICHERO,DE.T_EXTENSION_FICHERO,DE.TIP_DOC_ID,DE.D_DESCRIPCION_TIPO,DE.F_CREACION,DE.F_MODIFICACION,DE.USU_CREACION,DE.USU_MODIFICACION,DE.N_ORDEN,DE.T_DOC_TRABAJO,DE.L_EDITABLE,DE.L_FIRMADO,DE.L_SELLADO,DE.L_ANONIMIZADO,DE.L_ANONIMIZADO_PARCIAL,DE.L_ACTIVO,
		DET.DETR_ID AS DOC_EXP_TRAM_ID,
		DET.T_ORIGEN AS ORIGEN_DOCEXPTR,
		DET.DETR_TRAMEXP_ID AS TRAM_EXPE_ID,
		TE.TRAM_EXP_TRAMEXPSUP_ID AS TRAM_EXPE_SUP_ID
	FROM GE_LISTADO_DOCUMENTOS_EXP DE 
		INNER JOIN GE_DOCUMENTOS_EXPED_TRAMITES DET ON DE.DOCEXP_ID = DET.DETR_DOCEXP_ID
		INNER JOIN GE_TRAMITE_EXPED TE ON DET.DETR_TRAMEXP_ID = TE.TRAM_EXP_ID;


SPOOL OFF;
