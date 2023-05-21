rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/015_07_VISTAS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

-------------------
-- VERSION 0.15.0 --
-------------------


CREATE OR REPLACE FORCE EDITIONABLE VIEW "GE_TRAMITES_ABIERTOS" ("TRAM_ID", "F_FECHA_INI", "D_DESC_TRAMITE", "ID_TIPO_TRAMITE", "D_DESC_TIPO_TRAMITE", "T_RESP_TRAMITE", "T_RESP_ABREV_TRAMITE", "D_DESC_TRAM_SUP", "EXP_ID", "F_CREACION", "F_MODIFICACION", "USU_CREACION", "USU_MODIFICACION", "F_FECHA_REGISTRO", "T_TIP_EXP", "T_NUM_EXPEDIENTE", "T_SITUACION", "T_FECHA_ENTRADA", "T_PERSONA", "T_SUJETO_OBLIGADO", "T_NOMBRE_EXPEDIENTE", "ID_MATERIA", "ID_MATERIASUP", "FINALIZADOS", "T_RESPONSABLE", "T_SITUACION_ADICIONAL", "F_FECHA_ENVIO", "F_FECHA_NOTIFICACION", "F_FECHA_FIRMA", "F_FECHA_LIMITE", "D_TIPO_INTERVINIENTE", "D_CANAL_SALIDA", "T_AUT_COMP_INTERV", "T_PERSONA_INTERV", "T_SUJETO_OBLIGADO_INTERV", "D_RES_NOTIF", "T_INTERVINIENTE", "L_ACUSE_RECIBO", "T_FIRMANTE", "D_TIPO_FIRMA") AS 
  SELECT
	tramite.TRAM_EXP_ID AS TRAM_ID,
	tramite.F_FECHA_INI AS F_FECHA_INI,
	tramite.D_DESCRIPCION AS D_DESC_TRAMITE,
	tipotram.TIP_TRA_ID AS ID_TIPO_TRAMITE,
	tipotram.D_DESCRIPCION AS D_DESC_TIPO_TRAMITE,
	resptramite.D_DESCRIPCION AS T_RESP_TRAMITE,
	resptramite.D_DESC_ABREV AS T_RESP_ABREV_TRAMITE,
	tramitesup.D_DESCRIPCION AS D_DESC_TRAM_SUP,
	vista_exped.EXP_ID AS EXP_ID,
	vista_exped.F_CREACION AS F_CREACION,
	vista_exped.F_MODIFICACION AS F_MODIFICACION,
	vista_exped.USU_CREACION AS USU_CREACION,
	vista_exped.USU_MODIFICACION AS USU_MODIFICACION,
	vista_exped.F_FECHA_REGISTRO AS F_FECHA_REGISTRO,
	vista_exped.T_TIP_EXP AS T_TIP_EXP,
	vista_exped.T_NUM_EXPEDIENTE AS T_NUM_EXPEDIENTE,
	vista_exped.T_SITUACION AS T_SITUACION,
	vista_exped.T_FECHA_ENTRADA AS T_FECHA_ENTRADA,
	vista_exped.T_PERSONA AS T_PERSONA,
	vista_exped.T_SUJETO_OBLIGADO AS T_SUJETO_OBLIGADO,
    vista_exped.T_NOMBRE_EXPEDIENTE AS T_NOMBRE_EXPEDIENTE,
    vista_exped.ID_MATERIA AS ID_MATERIA,
    vista_exped.ID_MATERIASUP AS ID_MATERIASUP,
    vista_exped.FINALIZADOS AS FINALIZADOS,
    vista_exped.T_RESPONSABLE AS T_RESPONSABLE,
	vista_exped.T_SITUACION_ADICIONAL AS T_SITUACION_ADICIONAL,
	dettram.F_FECHA_ENVIO AS F_FECHA_ENVIO,
	dettram.F_FECHA_NOTIFICACION AS F_FECHA_NOTIFICACION,
	dettram.F_FECHA_FIRMA AS F_FECHA_FIRMA,	
	dettram.F_FECHA_LIMITE AS F_FECHA_LIMITE, 
	dominterv.D_DESCRIPCION AS D_TIPO_INTERVINIENTE,
	domcansal.D_DESCRIPCION AS D_CANAL_SALIDA,
	domautcomp.D_DESCRIPCION AS T_AUT_COMP_INTERV,
	CONCAT(CONCAT(CONCAT(CONCAT(persona.T_NOMBRE_RAZONSOCIAL, ' '),persona.T_PRIMER_APELLIDO), ' '), persona.T_SEGUNDO_APELLIDO) AS T_PERSONA_INTERV,
	sujetoobligado.D_DESCRIPCION AS T_SUJETO_OBLIGADO_INTERV,
	domresnot.D_DESCRIPCION AS D_RES_NOTIF,
	CONCAT(CONCAT(domautcomp.D_DESCRIPCION,sujetoobligado.D_DESCRIPCION),CONCAT(CONCAT(CONCAT(CONCAT(persona.T_NOMBRE_RAZONSOCIAL, ' '),persona.T_PRIMER_APELLIDO), ' '), persona.T_SEGUNDO_APELLIDO)) AS T_INTERVINIENTE,
	dettram.L_ACUSE_RECIBO AS L_ACUSE_RECIBO,
	CONCAT(CONCAT(CONCAT(CONCAT(usuar.T_PRIMER_APELLIDO, ' '),usuar.T_SEGUNDO_APELLIDO), ' '), usuar.T_NOMBRE) AS T_FIRMANTE,
	domtipfirm.D_DESCRIPCION AS D_TIPO_FIRMA
FROM
GE_TRAMITE_EXPED tramite
JOIN GE_TIPO_TRAMITE tipotram ON tramite.TRAM_EXP_TIP_TRA_ID = tipotram.TIP_TRA_ID
LEFT OUTER JOIN GE_EXP_PEREXP_SUJEXP vista_exped ON vista_exped.EXP_ID = tramite.TRAM_EXP_EXP_ID
LEFT OUTER JOIN GE_RESP_TRAMITACION resptramite ON tramite.TRAM_EXP_RESTRA_ID = resptramite.RESTRA_ID
LEFT OUTER JOIN GE_TRAMITE_EXPED tramitesup ON tramite.TRAM_EXP_TRAMEXPSUP_ID = tramitesup.TRAM_EXP_ID
JOIN GE_DETALLE_EXPDTE_TRAM dettram ON tramite.TRAM_EXP_ID = dettram.DETEXPTRAM_TRAMEXP_ID
LEFT OUTER JOIN GE_VALORES_DOMINIOS dominterv on dettram.DETEXPTRAM_VALDOMTIPINT_ID = dominterv.VAL_DOM_ID
LEFT OUTER JOIN GE_VALORES_DOMINIOS domcansal on dettram.DETEXPTRAM_VALDOMCANSAL_ID = domcansal.VAL_DOM_ID
LEFT OUTER JOIN GE_VALORES_DOMINIOS domautcomp on dettram.DETEXPTRAM_VALDOM_INT_ID = domautcomp.VAL_DOM_ID
LEFT OUTER JOIN GE_PERSONAS persona ON persona.PER_ID = dettram.DETEXPTRAM_PER_INT_ID 
LEFT OUTER JOIN GE_SUJETOS_OBLIGADOS sujetoobligado ON sujetoobligado.SUJ_ID = dettram.DETEXPTRAM_SUJOBL_INT_ID 
LEFT OUTER JOIN GE_VALORES_DOMINIOS domresnot on dettram.DETEXPTRAM_VALDOMRESNOTIF_ID = domresnot.VAL_DOM_ID
LEFT OUTER JOIN GE_USUARIOS usuar on dettram.DETEXPTRAM_FIRMANTE_ID = usuar.USU_ID
LEFT OUTER JOIN GE_VALORES_DOMINIOS domtipfirm on dettram.DETEXPTRAM_VDOM_TIPFIRM_ID = domtipfirm.VAL_DOM_ID
WHERE tramite.L_ACTIVO = 1
AND tramite.L_FINALIZADO = 0 WITH READ ONLY;


-- -------------------

  CREATE OR REPLACE VIEW GE_LISTADO_FIRMAS_TRAM AS SELECT 
TRAMEXP.TRAM_EXP_ID AS TRAM_EXP_ID,
tramexp.tram_exp_tramexpsup_id AS TRAM_EXP_SUP_ID,
tramexp.f_fecha_ini AS F_FECHA_INI,
TIPTRAM.D_DESC_ABREV AS DESC_ABREV, 
detexptram.DETEXPTRAM_FIRMANTE_ID  as FIRMANTE,
VALDOMTIPFIRMA.val_dom_id AS VALDOM_TIPO_FIRMA,
detexptram.F_FECHA_ENVIO as F_FECHA_ENVIO,
detexptram.F_FECHA_FIRMA as F_FECHA_FIRMA,
TRAMEXP.L_FINALIZADO AS L_FINALIZADO,
TRAMEXP.usu_creacion AS USU_CREACION,
TRAMEXP.usu_modificacion AS usu_modificacion,
TRAMEXP.f_creacion AS f_creacion,
TRAMEXP.f_modificacion AS f_modificacion
FROM GE_TRAMITE_EXPED TRAMEXP
LEFT OUTER JOIN GE_TIPO_TRAMITE TIPTRAM ON TRAMEXP.TRAM_EXP_TIP_TRA_ID = TIPTRAM.TIP_TRA_ID
LEFT OUTER JOIN GE_DETALLE_EXPDTE_TRAM DETEXPTRAM ON DETEXPTRAM.DETEXPTRAM_TRAMEXP_ID = TRAMEXP.TRAM_EXP_ID 
LEFT OUTER JOIN GE_VALORES_DOMINIOS VALDOMTIPFIRMA ON DETEXPTRAM.DETEXPTRAM_VDOM_TIPFIRM_ID = VALDOMTIPFIRMA.VAL_DOM_ID
WHERE TRAMEXP.TRAM_EXP_TRAMEXPSUP_ID IS NOT NULL 
    AND TRAMEXP.L_ACTIVO = 1 
    AND TRAMEXP.TRAM_EXP_TIP_TRA_ID IN (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO IN ('FIRM'));

-- -------------------

 CREATE OR REPLACE FORCE VIEW GE_NOTIF_PENDIENTES ("TRAM_ID", "F_FECHA_INI", "D_DESC_TRAMITE", "ID_TIPO_TRAMITE", "D_DESC_TIPO_TRAMITE", "T_RESP_TRAMITE", "T_RESP_ABREV_TRAMITE", "D_DESC_TRAM_SUP", "EXP_ID", "F_CREACION", "F_MODIFICACION", "USU_CREACION", "USU_MODIFICACION", "F_FECHA_REGISTRO", "T_TIP_EXP", "T_NUM_EXPEDIENTE", "T_SITUACION", "T_FECHA_ENTRADA", "T_PERSONA", "T_SUJETO_OBLIGADO", "T_NOMBRE_EXPEDIENTE", "ID_MATERIA", "ID_MATERIASUP", "FINALIZADOS", "T_RESPONSABLE", "T_SITUACION_ADICIONAL", "F_FECHA_ENVIO", "F_FECHA_NOTIFICACION", "F_FECHA_FIRMA", "F_FECHA_LIMITE", "D_TIPO_INTERVINIENTE", "D_CANAL_SALIDA", "T_AUT_COMP_INTERV", "T_PERSONA_INTERV", "T_SUJETO_OBLIGADO_INTERV", "D_RES_NOTIF", "T_INTERVINIENTE", "L_ACUSE_RECIBO", "T_FIRMANTE", "D_TIPO_FIRMA") AS 
  SELECT
	tramite.TRAM_EXP_ID AS TRAM_ID,
	tramite.F_FECHA_INI AS F_FECHA_INI,
	tramite.D_DESCRIPCION AS D_DESC_TRAMITE,
	tipotram.TIP_TRA_ID AS ID_TIPO_TRAMITE,
	tipotram.D_DESCRIPCION AS D_DESC_TIPO_TRAMITE,
	resptramite.D_DESCRIPCION AS T_RESP_TRAMITE,
	resptramite.D_DESC_ABREV AS T_RESP_ABREV_TRAMITE,
	tramitesup.D_DESCRIPCION AS D_DESC_TRAM_SUP,
	vista_exped.EXP_ID AS EXP_ID,
	vista_exped.F_CREACION AS F_CREACION,
	vista_exped.F_MODIFICACION AS F_MODIFICACION,
	vista_exped.USU_CREACION AS USU_CREACION,
	vista_exped.USU_MODIFICACION AS USU_MODIFICACION,
	vista_exped.F_FECHA_REGISTRO AS F_FECHA_REGISTRO,
	vista_exped.T_TIP_EXP AS T_TIP_EXP,
	vista_exped.T_NUM_EXPEDIENTE AS T_NUM_EXPEDIENTE,
	vista_exped.T_SITUACION AS T_SITUACION,
	vista_exped.T_FECHA_ENTRADA AS T_FECHA_ENTRADA,
	vista_exped.T_PERSONA AS T_PERSONA,
	vista_exped.T_SUJETO_OBLIGADO AS T_SUJETO_OBLIGADO,
    vista_exped.T_NOMBRE_EXPEDIENTE AS T_NOMBRE_EXPEDIENTE,
    vista_exped.ID_MATERIA AS ID_MATERIA,
    vista_exped.ID_MATERIASUP AS ID_MATERIASUP,
    vista_exped.FINALIZADOS AS FINALIZADOS,
    vista_exped.T_RESPONSABLE AS T_RESPONSABLE,
	vista_exped.T_SITUACION_ADICIONAL AS T_SITUACION_ADICIONAL,
	dettram.F_FECHA_ENVIO AS F_FECHA_ENVIO,
	dettram.F_FECHA_NOTIFICACION AS F_FECHA_NOTIFICACION,
	dettram.F_FECHA_FIRMA AS F_FECHA_FIRMA,	
	dettram.F_FECHA_LIMITE AS F_FECHA_LIMITE, 
	dominterv.D_DESCRIPCION AS D_TIPO_INTERVINIENTE,
	domcansal.D_DESCRIPCION AS D_CANAL_SALIDA,
	domautcomp.D_DESCRIPCION AS T_AUT_COMP_INTERV,
	CONCAT(CONCAT(CONCAT(CONCAT(persona.T_NOMBRE_RAZONSOCIAL, ' '),persona.T_PRIMER_APELLIDO), ' '), persona.T_SEGUNDO_APELLIDO) AS T_PERSONA_INTERV,
	sujetoobligado.D_DESCRIPCION AS T_SUJETO_OBLIGADO_INTERV,
	domresnot.D_DESCRIPCION AS D_RES_NOTIF,
	CONCAT(CONCAT(domautcomp.D_DESCRIPCION,sujetoobligado.D_DESCRIPCION),CONCAT(CONCAT(CONCAT(CONCAT(persona.T_NOMBRE_RAZONSOCIAL, ' '),persona.T_PRIMER_APELLIDO), ' '), persona.T_SEGUNDO_APELLIDO)) AS T_INTERVINIENTE,
	dettram.L_ACUSE_RECIBO AS L_ACUSE_RECIBO,
	CONCAT(CONCAT(CONCAT(CONCAT(usuar.T_PRIMER_APELLIDO, ' '),usuar.T_SEGUNDO_APELLIDO), ' '), usuar.T_NOMBRE) AS T_FIRMANTE,
	domtipfirm.D_DESCRIPCION AS D_TIPO_FIRMA
FROM
GE_TRAMITE_EXPED tramite
JOIN GE_TIPO_TRAMITE tipotram ON tramite.TRAM_EXP_TIP_TRA_ID = tipotram.TIP_TRA_ID
LEFT OUTER JOIN GE_EXP_PEREXP_SUJEXP vista_exped ON vista_exped.EXP_ID = tramite.TRAM_EXP_EXP_ID
LEFT OUTER JOIN GE_RESP_TRAMITACION resptramite ON tramite.TRAM_EXP_RESTRA_ID = resptramite.RESTRA_ID
LEFT OUTER JOIN GE_TRAMITE_EXPED tramitesup ON tramite.TRAM_EXP_TRAMEXPSUP_ID = tramitesup.TRAM_EXP_ID
JOIN GE_DETALLE_EXPDTE_TRAM dettram ON tramite.TRAM_EXP_ID = dettram.DETEXPTRAM_TRAMEXP_ID
LEFT OUTER JOIN GE_VALORES_DOMINIOS dominterv on dettram.DETEXPTRAM_VALDOMTIPINT_ID = dominterv.VAL_DOM_ID
LEFT OUTER JOIN GE_VALORES_DOMINIOS domcansal on dettram.DETEXPTRAM_VALDOMCANSAL_ID = domcansal.VAL_DOM_ID
LEFT OUTER JOIN GE_VALORES_DOMINIOS domautcomp on dettram.DETEXPTRAM_VALDOM_INT_ID = domautcomp.VAL_DOM_ID
LEFT OUTER JOIN GE_PERSONAS persona ON persona.PER_ID = dettram.DETEXPTRAM_PER_INT_ID 
LEFT OUTER JOIN GE_SUJETOS_OBLIGADOS sujetoobligado ON sujetoobligado.SUJ_ID = dettram.DETEXPTRAM_SUJOBL_INT_ID 
LEFT OUTER JOIN GE_VALORES_DOMINIOS domresnot on dettram.DETEXPTRAM_VALDOMRESNOTIF_ID = domresnot.VAL_DOM_ID
LEFT OUTER JOIN GE_USUARIOS usuar on dettram.DETEXPTRAM_FIRMANTE_ID = usuar.USU_ID
LEFT OUTER JOIN GE_VALORES_DOMINIOS domtipfirm on dettram.DETEXPTRAM_VDOM_TIPFIRM_ID = domtipfirm.VAL_DOM_ID
WHERE tramite.L_ACTIVO = 1 
AND domresnot.C_CODIGO IN ('PDTE','PROV') 
AND tipotram.T_CODIGO = 'NOT' WITH READ ONLY;
SPOOL OFF;
