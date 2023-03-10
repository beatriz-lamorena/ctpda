rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/015_UNDO_07_VISTAS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

-------------------
-- VERSION 0.15.0 --
-------------------


  CREATE OR REPLACE FORCE EDITIONABLE VIEW "GE_TRAMITES_ABIERTOS" ("TRAM_ID", "F_FECHA_INI", "D_DESC_TRAMITE", "ID_TIPO_TRAMITE", "D_DESC_TIPO_TRAMITE", "T_RESP_TRAMITE","T_RESP_ABREV_TRAMITE","D_DESC_TRAM_SUP","EXP_ID", "F_CREACION", "F_MODIFICACION", "USU_CREACION", "USU_MODIFICACION", "F_FECHA_REGISTRO", "T_TIP_EXP", "T_NUM_EXPEDIENTE", "T_SITUACION", "T_FECHA_ENTRADA", "T_PERSONA", "T_SUJETO_OBLIGADO", "T_NOMBRE_EXPEDIENTE", "ID_MATERIA", "ID_MATERIASUP", "FINALIZADOS", "T_RESPONSABLE", "T_SITUACION_ADICIONAL") AS 
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
	vista_exped.T_SITUACION_ADICIONAL AS T_SITUACION_ADICIONAL
FROM
GE_TRAMITE_EXPED tramite
JOIN GE_TIPO_TRAMITE tipotram ON tramite.TRAM_EXP_TIP_TRA_ID = tipotram.TIP_TRA_ID
LEFT OUTER JOIN GE_EXP_PEREXP_SUJEXP vista_exped ON vista_exped.EXP_ID = tramite.TRAM_EXP_EXP_ID
LEFT OUTER JOIN GE_RESP_TRAMITACION resptramite ON tramite.TRAM_EXP_RESTRA_ID = resptramite.RESTRA_ID
LEFT OUTER JOIN GE_TRAMITE_EXPED tramitesup ON tramite.TRAM_EXP_TRAMEXPSUP_ID = tramitesup.TRAM_EXP_ID
WHERE tramite.L_ACTIVO = 1
AND tramite.L_FINALIZADO = 0 WITH READ ONLY;

-- -----------------
DROP VIEW GE_LISTADO_FIRMAS_TRAM;

-- -----------------

DROP VIEW GE_NOTIF_PENDIENTES;

SPOOL OFF;
