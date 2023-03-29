rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/014_05_INSERTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

---------------------
-- VERSION 0.14.0 --
---------------------

DELETE FROM GE_VALORES_DOMINIOS WHERE VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_OBS');

INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_OBS'),'EXP','Expediente','Exped',0,1,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_OBS')),1,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_OBS'),'TRA','Trámite','Trámite',0,2,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_OBS')),1,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_OBS'),'TAR','Tarea','Tarea',0,3,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_OBS')),1,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_OBS'),'PLA','Plazo','Plazo',0,4,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_OBS')),1,1,SYSDATE, (SELECT USER FROM DUAL), 0);

DELETE FROM GE_PERMISOS_PERFILES WHERE PERMPERF_PERM_ID IN (SELECT PER_ID FROM GE_PERMISOS WHERE C_CODIGO IN ('SAVE_EXPOBS', 'EDIT_EXPOBS', 'DEL_EXPOBS', 'CONS_EXPOBS'));

DELETE FROM GE_PERMISOS WHERE C_CODIGO IN ('SAVE_EXPOBS', 'EDIT_EXPOBS', 'DEL_EXPOBS', 'CONS_EXPOBS');

-- ---------------------------

INSERT INTO GE_PERMISOS (PER_ID,F_CREACION,F_MODIFICACION,USU_CREACION,USU_MODIFICACION,L_ACTIVA,C_CODIGO,D_DESCRIPCION,N_VERSION) VALUES (S_PERMISOS.NEXTVAL,SYSDATE,NULL,(SELECT USER FROM DUAL),NULL,'1','VIEW_TRAM_AB','Ver tramites abiertos','1');
INSERT INTO GE_PERMISOS_PERFILES (PERM_PERF_ID, PERMPERF_PERF_ID, PERMPERF_PERM_ID, L_ACTIVA, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_PERMISOS_PERFILES.NEXTVAL, (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN'),(SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'VIEW_TRAM_AB'),1,SYSDATE, (SELECT USER FROM DUAL), 0);

-- --------------------------

UPDATE GE_SERIES SET T_PATRON = 'RED-2022/{3}' WHERE T_CODIGO_SERIE = 'RECSEC';
UPDATE GE_SERIES SET T_PATRON = 'RPS-2022/{3}' WHERE T_CODIGO_SERIE = 'RPSSEC';
UPDATE GE_SERIES SET T_PATRON = 'RAR-2022/{3}' WHERE T_CODIGO_SERIE = 'RARSEC';

-- -------------------------
UPDATE GE_VALORES_DOMINIOS SET L_ACTIVO = 0 WHERE VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_INT') AND C_CODIGO = 'DPD';
-- -------------------------

UPDATE GE_CFG_METADATOS_TRAM SET D_BT_VINCULAR_DOC = 'Vincular Docs';

UPDATE GE_VALORES_DOMINIOS SET D_DESCRIPCION = 'EPC Entrada pendiente de calificación', T_ABREVIATURA = 'EPC', L_BLOQUEADO = 1 WHERE C_CODIGO = 'XPC' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_EXP');

INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'MOT_REL_EXP_PER'),'NC','No Consta','NC',0,6,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'MOT_REL_EXP_PER')),0,1,SYSDATE, (SELECT USER FROM DUAL), 0);

UPDATE GE_SERIES SET N_NUMERO_FINAL = 99999, T_PATRON = 'EPC-2022/{5}' WHERE T_CODIGO_SERIE = 'XPCSEC';

INSERT INTO GE_SERIES (SER_ID, T_CODIGO_SERIE, F_FECHA_INICIAL, F_FECHA_FINAL, N_NUMERO_INICIAL, N_NUMERO_FINAL, N_ULTIMO_NUMERO, T_PATRON, N_MARGEN_AVISO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_SERIES.NEXTVAL, 'EXPRCO', TO_DATE('01/01/2023', 'DD/MM/YYYY'), TO_DATE('31/12/2023', 'DD/MM/YYYY'), 1, 999, 0, 'RCO-2023/{3}', 100, SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_SERIES (SER_ID, T_CODIGO_SERIE, F_FECHA_INICIAL, F_FECHA_FINAL, N_NUMERO_INICIAL, N_NUMERO_FINAL, N_ULTIMO_NUMERO, T_PATRON, N_MARGEN_AVISO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_SERIES.NEXTVAL, 'EXPRCE', TO_DATE('01/01/2023', 'DD/MM/YYYY'), TO_DATE('31/12/2023', 'DD/MM/YYYY'), 1, 999, 0, 'RCE-2023/{3}', 100, SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_SERIES (SER_ID, T_CODIGO_SERIE, F_FECHA_INICIAL, F_FECHA_FINAL, N_NUMERO_INICIAL, N_NUMERO_FINAL, N_ULTIMO_NUMERO, T_PATRON, N_MARGEN_AVISO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_SERIES.NEXTVAL, 'PSANSEC', TO_DATE('01/01/2023', 'DD/MM/YYYY'), TO_DATE('31/12/2023', 'DD/MM/YYYY'), 1, 999, 0, 'PS-2023/{3}', 50, SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_SERIES (SER_ID, T_CODIGO_SERIE, F_FECHA_INICIAL, F_FECHA_FINAL, N_NUMERO_INICIAL, N_NUMERO_FINAL, N_ULTIMO_NUMERO, T_PATRON, N_MARGEN_AVISO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_SERIES.NEXTVAL, 'XPCSEC', TO_DATE('01/01/2023', 'DD/MM/YYYY'), TO_DATE('31/12/2023', 'DD/MM/YYYY'), 1, 99999, 0, 'EPC-2023/{5}', 50, SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_SERIES (SER_ID, T_CODIGO_SERIE, F_FECHA_INICIAL, F_FECHA_FINAL, N_NUMERO_INICIAL, N_NUMERO_FINAL, N_ULTIMO_NUMERO, T_PATRON, N_MARGEN_AVISO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_SERIES.NEXTVAL, 'RECSEC', TO_DATE('01/01/2023', 'DD/MM/YYYY'), TO_DATE('31/12/2023', 'DD/MM/YYYY'), 1, 999, 0, 'RED-2023/{3}', 50, SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_SERIES (SER_ID, T_CODIGO_SERIE, F_FECHA_INICIAL, F_FECHA_FINAL, N_NUMERO_INICIAL, N_NUMERO_FINAL, N_ULTIMO_NUMERO, T_PATRON, N_MARGEN_AVISO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_SERIES.NEXTVAL, 'RPSSEC', TO_DATE('01/01/2023', 'DD/MM/YYYY'), TO_DATE('31/12/2023', 'DD/MM/YYYY'), 1, 999, 0, 'RPS-2023/{3}', 50, SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_SERIES (SER_ID, T_CODIGO_SERIE, F_FECHA_INICIAL, F_FECHA_FINAL, N_NUMERO_INICIAL, N_NUMERO_FINAL, N_ULTIMO_NUMERO, T_PATRON, N_MARGEN_AVISO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_SERIES.NEXTVAL, 'RARSEC', TO_DATE('01/01/2023', 'DD/MM/YYYY'), TO_DATE('31/12/2023', 'DD/MM/YYYY'), 1, 999, 0, 'RAR-2023/{3}', 50, SYSDATE, (SELECT USER FROM DUAL), 0);

INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'CAN_ENT'),'OTROS','Otros','Otros',0,6,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'CAN_ENT')),0,1,SYSDATE, (SELECT USER FROM DUAL), 0);

-- -------------------

UPDATE GE_TIPO_TRAMITE SET L_VER_DOC_SUBTRAM = 1 WHERE T_CODIGO = 'NOT';

INSERT INTO GE_DOMINIOS (DOM_ID, C_CODIGO, D_DESCRIPCION, N_NIVEL_ANIDAMIENTO_MAX, L_BLOQUEADO, L_VISIBLE, L_PUNTO_MENU, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_DOMINIOS.NEXTVAL,'CAT_DOC','Categoría de documento',0,0,1,1,SYSDATE, (SELECT USER FROM DUAL), 0);

INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'CAT_DOC'),'EXP','Documentos del expediente','Expediente',0,1,null,0,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'CAT_DOC'),'TRA','Documentos de trabajo','Trabajo',0,2,null,0,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'CAT_DOC'),'EVI','Documentos evidencias','Evidencia',0,3,null,0,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'CAT_DOC'),'EST','Documentos de estudio','Estudio',0,4,null,0,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'CAT_DOC'),'TEC','Documentos técnicos','Técnico',0,5,null,0,1,SYSDATE, (SELECT USER FROM DUAL), 0);


-- -------------------------

UPDATE GE_CFG_METADATOS_TRAM SET D_ACUSE_RECIBO = 'Requiere acuse de recibo', D_FIRMANTE = 'Firmante', D_TIPO_FIRMA= 'Tipo de firma';

UPDATE GE_USUARIOS SET L_FIRMANTE = 1;

INSERT INTO GE_DOMINIOS (DOM_ID, C_CODIGO, D_DESCRIPCION, N_NIVEL_ANIDAMIENTO_MAX, L_BLOQUEADO, L_VISIBLE, L_PUNTO_MENU, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_DOMINIOS.NEXTVAL,'TIP_FIRM','Tipo de firma',0,1,1,0,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_FIRM'),'FIRMA','Firma','Firma',0,1,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_FIRM')),1,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_FIRM'),'VB','Visto Bueno','VB',0,2,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_FIRM')),1,1,SYSDATE, (SELECT USER FROM DUAL), 0);




SPOOL OFF;
