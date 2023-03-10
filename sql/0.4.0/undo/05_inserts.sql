rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/004_UNDO_05_INSERTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

UPDATE GE_VALORES_DOMINIOS SET L_ACTIVO = 1 WHERE VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_EXP') 
AND (C_CODIGO = 'T_RCL_DER' OR C_CODIGO = 'T_DEN_PUB' OR C_CODIGO = 'PD_NOT_SEG' OR C_CODIGO = 'PD_COM_DEL' OR C_CODIGO = 'SG_SOL_INF');

UPDATE GE_VALORES_DOMINIOS SET N_ORDEN = 0, N_NIVEL_ANIDAMIENTO = 0;

UPDATE GE_VALORES_DOMINIOS SET L_BLOQUEADO = 0 WHERE VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_PER') AND (C_CODIGO = 'FIS' OR C_CODIGO = 'JUR');

SPOOL OFF;