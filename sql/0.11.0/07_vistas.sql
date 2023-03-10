rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/011_07_VISTAS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

-------------------
-- VERSION 0.11.0 --
-------------------


CREATE OR REPLACE FORCE VIEW GE_EXP_PEREXP_SUJEXP(EXP_ID, F_CREACION, F_MODIFICACION, USU_CREACION, USU_MODIFICACION, F_FECHA_REGISTRO, T_TIP_EXP, T_NUM_EXPEDIENTE, T_SITUACION, T_FECHA_ENTRADA, T_PERSONA, T_SUJETO_OBLIGADO, T_NOMBRE_EXPEDIENTE, ID_MATERIA, ID_MATERIASUP,FINALIZADOS,T_RESPONSABLE) AS 
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
    resptramitacion.D_DESCRIPCION AS T_RESPONSABLE
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
expe.T_NOMBRE_EXPEDIENTE, resptramitacion.D_DESCRIPCION);


-- ----------------------------------------------

CREATE OR REPLACE VIEW GE_ACCESOS_DOCS_ULTIMOS_EDIT AS        
SELECT ACD_DOC_ID, ACD_USU_ID, ACD_VALDOMTIPACC_ID, F_FECHA_HORA_ACCESO FROM (      
	SELECT ACD_DOC_ID, ACD_USU_ID, ACD_VALDOMTIPACC_ID, F_FECHA_HORA_ACCESO,
		ROW_NUMBER() OVER (PARTITION BY ACD_DOC_ID ORDER BY F_FECHA_HORA_ACCESO DESC) AS ROWNUM_FECHA
	FROM GE_ACCESOS_DOCS WHERE ACD_VALDOMTIPACC_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS
                                                    WHERE VALDOM_DOM_ID IN (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_ACC')
                                                        AND C_CODIGO = 'EDI' ))
WHERE ROWNUM_FECHA <=1;


CREATE OR REPLACE VIEW GE_LISTADO_DOCUMENTOS_EXP (DOCEXP_ID, DOC_ID, EXP_ID, T_IDEN_DOC, D_DESCRIPCION, D_DESC_ABREV, T_NOMBRE_FICHERO, T_EXTENSION_FICHERO, TIP_DOC_ID, D_DESCRIPCION_TIPO, F_CREACION, F_MODIFICACION, USU_CREACION, USU_MODIFICACION, N_ORDEN, T_DOC_TRABAJO, L_EDITABLE, L_FIRMADO, L_SELLADO, L_ANONIMIZADO, L_ANONIMIZADO_PARCIAL, L_ACTIVO, T_USUARIO_ACCESO, F_FECHA_HORA_ACCESO) AS
	SELECT
		DE.DOCEXP_ID AS DOCEXP_ID,
		DE.DOCEXP_DOC_ID AS DOC_ID,
		DE.DOCEXP_EXP_ID AS EXP_ID,
		D.T_IDEN_DOC AS T_IDEN_DOC,
		DE.D_DESCRIPCION_DOC AS D_DESCRIPCION,
		DE.D_DESC_ABREV_DOC AS D_DESC_ABREV,
		D.T_NOMBRE_FICHERO AS T_NOMBRE_FICHERO,
		D.T_EXTENSION_FICHERO AS T_EXTENSION_FICHERO,
		TD.TIP_DOC_ID AS TIP_DOC_ID,
		TD.D_DESCRIPCION AS D_DESCRIPCION_TIPO,
		D.F_CREACION AS F_CREACION,
		D.F_MODIFICACION AS F_MODIFICACION,
		D.USU_CREACION AS USU_CREACION,
		D.USU_MODIFICACION AS USU_MODIFICACION,
		DE.N_ORDEN AS N_ORDEN,
		DE.T_DOC_TRABAJO AS T_DOC_TRABAJO,
		D.L_EDITABLE AS L_EDITABLE,
		D.L_FIRMADO AS L_FIRMADO,
		D.L_SELLADO AS L_SELLADO,
		D.L_ANONIMIZADO AS L_ANONIMIZADO,
		D.L_ANONIMIZADO_PARCIAL AS L_ANONIMIZADO_PARCIAL,
		D.L_ACTIVO AS L_ACTIVO,
        U.T_LOGIN AS T_USUARIO_ACCESO,
        AD.F_FECHA_HORA_ACCESO
	FROM GE_DOCUMENTOS_EXPEDIENTES DE 
		INNER JOIN GE_DOCUMENTOS D ON DE.DOCEXP_DOC_ID = D.DOC_ID
		INNER JOIN GE_TIPOS_DOCUMENTOS TD ON D.DOC_TIPDOC_ID = TD.TIP_DOC_ID
        LEFT JOIN (SELECT ACD_DOC_ID, ACD_USU_ID, F_FECHA_HORA_ACCESO
                    FROM GE_ACCESOS_DOCS_ULTIMOS_EDIT) AD ON D.DOC_ID = AD.ACD_DOC_ID 
        LEFT JOIN GE_USUARIOS U ON AD.ACD_USU_ID = U.USU_ID
	WHERE DE.L_ACTIVO = 1 AND D.L_ACTIVO = 1;

-- ----------------------------------------------

CREATE OR REPLACE VIEW GE_LISTADO_RESOLUCIONES AS
SELECT 
    R.RES_ID, 
    R.F_CREACION AS F_CREACION,
    R.F_MODIFICACION AS F_MODIFICACION,
    R.USU_CREACION AS USU_CREACION,
    R.USU_MODIFICACION AS USU_MODIFICACION,
    R.T_CODIGO_RESOL, R.F_FECHA_RESOLUCION,
    TIP.VAL_DOM_ID AS TIP_RESOL_ID, TIP.D_DESCRIPCION AS TIPO_RESOL, 
    SEN.VAL_DOM_ID AS SENTIDO_ID, SEN.D_DESCRIPCION AS SENTIDO_RESOL,
    P.PER_ID, 
	CONCAT(CONCAT(CONCAT(CONCAT(P.T_NOMBRE_RAZONSOCIAL, ' '), P.T_PRIMER_APELLIDO), ' '), P.T_SEGUNDO_APELLIDO) AS NOMBRE_PERSONA,
	P.T_NIF_CIF AS NIF_PERSONA, TIPER.C_CODIGO AS COD_TIPO_PERSONA,
    S.SUJ_ID, S.D_DESCRIPCION AS NOMBRE_SUJ_OBLIGADO, S.T_NIF AS NIF_SUJ_OBLIGADO
FROM GE_RESOLUCIONES R
    INNER JOIN GE_VALORES_DOMINIOS TIP ON TIP.VAL_DOM_ID = R.RESOL_VALDOMTIPORESOL_ID
    INNER JOIN GE_VALORES_DOMINIOS SEN ON SEN.VAL_DOM_ID = R.RESOL_VALDOMSENTRESOL_ID
    INNER JOIN GE_RESOL_EXPEDIENTES RE ON (RE.RESEXP_RES_ID = R.RES_ID AND RE.N_PRINCIPAL = 1 )
    INNER JOIN GE_EXPEDIENTES E ON E.EXP_ID = RE.RESEXP_EXP_ID
    LEFT JOIN GE_RESOL_SUJOBL SE ON (SE.RESSUJOBL_RES_ID = R.RES_ID AND SE.N_PRINCIPAL = 1 )
    LEFT JOIN GE_SUJETOS_OBLIGADOS S ON S.SUJ_ID = SE.RESSUJOBL_SUJOBL_ID
    LEFT JOIN GE_RESOL_PERSONA PE  ON (PE.RESPER_RES_ID = R.RES_ID AND PE.N_PRINCIPAL = 1 ) 
    LEFT JOIN GE_PERSONAS P ON P.PER_ID = PE.RESPER_PER_ID
    LEFT JOIN GE_VALORES_DOMINIOS TIPER ON TIPER.VAL_DOM_ID = P.PER_VALDOM_TIPPER_ID;




SPOOL OFF;
