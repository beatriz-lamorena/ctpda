rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/014_UNDO_07_VISTAS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

-------------------
-- VERSION 0.14.0 --
-------------------

DROP VIEW GE_LISTADO_OBSERVACIONES_EXP;
-- ------------
DROP VIEW GE_LISTADO_NOTIFICACIONES_TRAM;

DROP VIEW GE_TRAMITES_ABIERTOS;


  CREATE OR REPLACE FORCE VIEW "GE_EXP_PEREXP_SUJEXP" ("EXP_ID", "F_CREACION", "F_MODIFICACION", "USU_CREACION", "USU_MODIFICACION", "F_FECHA_REGISTRO", "T_TIP_EXP", "T_NUM_EXPEDIENTE", "T_SITUACION", "T_FECHA_ENTRADA", "T_PERSONA", "T_SUJETO_OBLIGADO", "T_NOMBRE_EXPEDIENTE", "ID_MATERIA", "ID_MATERIASUP", "FINALIZADOS", "T_RESPONSABLE", "T_SITUACION_ADICIONAL") AS 
  SELECT 
	expe.EXP_ID AS EXP_ID,
	expe.F_CREACION AS F_CREACION,
	expe.F_MODIFICACION AS F_MODIFICACION,
	expe.USU_CREACION AS USU_CREACION,
	expe.USU_MODIFICACION AS USU_MODIFICACION,
	expe.F_FECHA_REGISTRO AS F_FECHA_REGISTRO,
	valortipoexp.T_ABREVIATURA AS T_TIP_EXP,
	expe.T_NUMERO_EXPEDIENTE AS T_NUM_EXPEDIENTE,
	situacionexpe.D_DESCRIPCION AS T_SITUACION,
	expe.F_FECHA_ENTRADA AS T_FECHA_ENTRADA,
	CONCAT(CONCAT(CONCAT(CONCAT(persona.T_NOMBRE_RAZONSOCIAL, ' '),persona.T_PRIMER_APELLIDO), ' '), persona.T_SEGUNDO_APELLIDO)AS T_PERSONA,
	sujetoobligado.D_DESCRIPCION AS T_SUJETO_OBLIGADO,
    expe.T_NOMBRE_EXPEDIENTE AS T_NOMBRE_EXPEDIENTE,
    LISTAGG('-' ||materia.val_dom_id||'-') WITHIN GROUP (ORDER BY materia.val_dom_id) AS ID_MATERIA,
    LISTAGG('-' ||materia.valdom_valdom_id||'-') WITHIN GROUP (ORDER BY materia.valdom_valdom_id) AS ID_MATERIASUP,
    situacionexpe.L_SIT_FINAL AS FINALIZADOS,
    resptramitacion.D_DESCRIPCION AS T_RESPONSABLE,
	expe.D_SIT_ADICIONAL AS T_SITUACION_ADICIONAL
FROM GE_EXPEDIENTES expe
LEFT OUTER JOIN ge_materias_expdt matexp ON expe.EXP_ID = matexp.MATEXP_EXP_ID
LEFT OUTER JOIN GE_MATERIAS_TIPEXPEDIENTES mattipexp ON matexp.MATEXP_MATTIPEXP_ID = mattipexp.MAT_ID
LEFT OUTER JOIN GE_VALORES_DOMINIOS materia ON materia.VAL_DOM_ID = mattipexp.MATTIPEXP_VALDOMMAT_ID
INNER JOIN GE_VALORES_DOMINIOS valortipoexp ON valortipoexp.VAL_DOM_ID = expe.EXP_VALDOM_TIPEXP_ID 
INNER JOIN GE_VALORES_DOMINIOS valorsituacion ON valorsituacion.VAL_DOM_ID = expe.EXP_VALDOM_SIT_ID 
INNER JOIN GE_PERSONAS_EXPEDIENTES perexpe ON  perexpe.PER_EXP_ID=expe.EXP_ID
INNER JOIN GE_SUJETOS_OBLIGADOS_EXPDT sujetoexpe ON sujetoexpe.SUJ_EXP_ID=expe.EXP_ID
INNER JOIN GE_PERSONAS persona ON persona.PER_ID =perexpe.PER_PER_ID 
INNER JOIN GE_SUJETOS_OBLIGADOS sujetoobligado ON sujetoobligado.SUJ_ID = sujetoexpe.SUJ_SUJ_ID 
INNER JOIN GE_SITUACIONES_EXPEDIENTES situacionexpe ON situacionexpe.SIT_VALDOM_TIPEXP_ID=expe.EXP_VALDOM_TIPEXP_ID 
LEFT OUTER JOIN GE_RESP_TRAMITACION resptramitacion ON expe.EXP_RESTRA_ID =resptramitacion.RESTRA_ID 
WHERE perexpe.N_PRINCIPAL =1 AND sujetoexpe.N_PRINCIPAL =1 
AND situacionexpe.SIT_VALDOM_TIPEXP_ID=expe.EXP_VALDOM_TIPEXP_ID
AND situacionexpe.SIT_VALDOM_SIT_ID=expe.EXP_VALDOM_SIT_ID
group by (expe.EXP_ID,
expe.F_CREACION,
expe.F_MODIFICACION,
expe.USU_CREACION,
expe.USU_MODIFICACION,
expe.F_FECHA_REGISTRO,
valortipoexp.T_ABREVIATURA,
expe.T_NUMERO_EXPEDIENTE,
situacionexpe.D_DESCRIPCION,
expe.F_FECHA_ENTRADA,
CONCAT(CONCAT(CONCAT(CONCAT(persona.T_NOMBRE_RAZONSOCIAL, ' '),persona.T_PRIMER_APELLIDO), ' '), persona.T_SEGUNDO_APELLIDO),
sujetoobligado.D_DESCRIPCION,
expe.T_NOMBRE_EXPEDIENTE,
situacionexpe.L_SIT_FINAL,
expe.T_NOMBRE_EXPEDIENTE, resptramitacion.D_DESCRIPCION, expe.D_SIT_ADICIONAL);



SPOOL OFF;