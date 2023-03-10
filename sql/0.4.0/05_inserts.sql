rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/004_05_INSERTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

INSERT INTO GE_ELEMENTOS_SERIES (ELEM_SER_ID, T_TIPO, T_DESCRIPCION, T_CODIGO_SERIE, F_FECHA_INICIAL, F_FECHA_FINAL, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_ELEMENTOS_SERIES.NEXTVAL, 'RCO', 'Expediente RCO', 'EXPRCO', TO_DATE('01/01/2022', 'DD/MM/YYYY'), TO_DATE('31/12/2022', 'DD/MM/YYYY'), SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_ELEMENTOS_SERIES (ELEM_SER_ID, T_TIPO, T_DESCRIPCION, T_CODIGO_SERIE, F_FECHA_INICIAL, F_FECHA_FINAL, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_ELEMENTOS_SERIES.NEXTVAL, 'RCE', 'Expediente RCE', 'EXPRCE', TO_DATE('01/01/2022', 'DD/MM/YYYY'), TO_DATE('31/12/2022', 'DD/MM/YYYY'), SYSDATE, (SELECT USER FROM DUAL), 0);

INSERT INTO GE_SERIES (SER_ID, SER_ELESER_ID, F_FECHA_INICIAL, F_FECHA_FINAL, N_NUMERO_INICIAL, N_NUMERO_FINAL, N_ULTIMO_NUMERO, T_PATRON, N_MARGEN_AVISO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_SERIES.NEXTVAL, (SELECT ELEM_SER_ID FROM GE_ELEMENTOS_SERIES WHERE T_CODIGO_SERIE = 'EXPRCO'), TO_DATE('01/01/2022', 'DD/MM/YYYY'), TO_DATE('31/12/2022', 'DD/MM/YYYY'), 1, 0, 0, 'RCO-{4}-2022', 100, SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_SERIES (SER_ID, SER_ELESER_ID, F_FECHA_INICIAL, F_FECHA_FINAL, N_NUMERO_INICIAL, N_NUMERO_FINAL, N_ULTIMO_NUMERO, T_PATRON, N_MARGEN_AVISO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_SERIES.NEXTVAL, (SELECT ELEM_SER_ID FROM GE_ELEMENTOS_SERIES WHERE T_CODIGO_SERIE = 'EXPRCE'), TO_DATE('01/01/2022', 'DD/MM/YYYY'), TO_DATE('31/12/2022', 'DD/MM/YYYY'), 1, 0, 0, 'RCE-{4}-2022', 100, SYSDATE, (SELECT USER FROM DUAL), 0);

UPDATE GE_VALORES_DOMINIOS SET L_ACTIVO = 0 WHERE VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_EXP') AND C_CODIGO = 'T_RCL_DER';
UPDATE GE_VALORES_DOMINIOS SET L_ACTIVO = 0 WHERE VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_EXP') AND C_CODIGO = 'T_DEN_PUB';
UPDATE GE_VALORES_DOMINIOS SET L_ACTIVO = 0 WHERE VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_EXP') AND C_CODIGO = 'PD_NOT_SEG';
UPDATE GE_VALORES_DOMINIOS SET L_ACTIVO = 0 WHERE VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_EXP') AND C_CODIGO = 'PD_COM_DEL';
UPDATE GE_VALORES_DOMINIOS SET L_ACTIVO = 0 WHERE VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_EXP') AND C_CODIGO = 'SG_SOL_INF';

UPDATE GE_VALORES_DOMINIOS SET N_ORDEN = 0, N_NIVEL_ANIDAMIENTO = 0;

INSERT INTO GE_PAISES (PAI_ID, N_VERSION, F_CREACION, USU_CREACION, C_CODIGO, D_DESCRIPCION) VALUES (S_PAISES.NEXTVAL, 0, SYSDATE, (SELECT USER FROM DUAL), 'FR', 'Francia');
INSERT INTO GE_PAISES (PAI_ID, N_VERSION, F_CREACION, USU_CREACION, C_CODIGO, D_DESCRIPCION) VALUES (S_PAISES.NEXTVAL, 0, SYSDATE, (SELECT USER FROM DUAL), 'ES', 'España');
INSERT INTO GE_PAISES (PAI_ID, N_VERSION, F_CREACION, USU_CREACION, C_CODIGO, D_DESCRIPCION) VALUES (S_PAISES.NEXTVAL, 0, SYSDATE, (SELECT USER FROM DUAL), 'IT', 'Italia');

UPDATE GE_VALORES_DOMINIOS SET L_BLOQUEADO = 1 WHERE VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_PER') AND (C_CODIGO = 'FIS' OR C_CODIGO = 'JUR');

INSERT INTO GE_DOMINIOS (DOM_ID, C_CODIGO, D_DESCRIPCION, N_NIVEL_ANIDAMIENTO_MAX, L_BLOQUEADO, L_VISIBLE, L_PUNTO_MENU, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_DOMINIOS.NEXTVAL,'TIP_OBS', 'Tipos de observaciones',0,0,1,0,SYSDATE, (SELECT USER FROM DUAL), 0);  

INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE D_DESCRIPCION = 'Tipos de observaciones'), 'TEM','Temporal','Temp',0,0,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE D_DESCRIPCION = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE D_DESCRIPCION = 'Tipos de observaciones')),0,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE D_DESCRIPCION = 'Tipos de observaciones'), 'PERM','Permanente','Per',0,0,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE D_DESCRIPCION = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE D_DESCRIPCION = 'Tipos de observaciones')),0,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE D_DESCRIPCION = 'Tipos de observaciones'), 'ESP','Especial','Esp',0,0,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE D_DESCRIPCION = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE D_DESCRIPCION = 'Tipos de observaciones')),0,1,SYSDATE, (SELECT USER FROM DUAL), 0);

UPDATE GE_SERIES SET N_NUMERO_FINAL = 9999;

SPOOL OFF;
