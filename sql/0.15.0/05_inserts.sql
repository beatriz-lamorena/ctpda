rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/015_05_INSERTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

---------------------
-- VERSION 0.15.0 --
---------------------

INSERT INTO GE_PERMISOS (PER_ID,F_CREACION,F_MODIFICACION,USU_CREACION,USU_MODIFICACION,L_ACTIVA,C_CODIGO,D_DESCRIPCION,N_VERSION) VALUES (S_PERMISOS.NEXTVAL,SYSDATE,NULL,(SELECT USER FROM DUAL),NULL,'1','VIEW_NOTIF_AB','Ver Notificaciones en curso','1');
INSERT INTO GE_PERMISOS_PERFILES (PERM_PERF_ID, PERMPERF_PERF_ID, PERMPERF_PERM_ID, L_ACTIVA, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_PERMISOS_PERFILES.NEXTVAL, (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN'),(SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'VIEW_NOTIF_AB'),1,SYSDATE, (SELECT USER FROM DUAL), 0);

INSERT INTO GE_PERMISOS (PER_ID,F_CREACION,F_MODIFICACION,USU_CREACION,USU_MODIFICACION,L_ACTIVA,C_CODIGO,D_DESCRIPCION,N_VERSION) VALUES (S_PERMISOS.NEXTVAL,SYSDATE,NULL,(SELECT USER FROM DUAL),NULL,'1','VIEW_FIRMAS_AB','Ver Firmas en curso','1');
INSERT INTO GE_PERMISOS_PERFILES (PERM_PERF_ID, PERMPERF_PERF_ID, PERMPERF_PERM_ID, L_ACTIVA, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_PERMISOS_PERFILES.NEXTVAL, (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN'),(SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'VIEW_FIRMAS_AB'),1,SYSDATE, (SELECT USER FROM DUAL), 0);

-- -----------------

UPDATE GE_CFG_METADATOS_TRAM SET D_FECHA_REGISTRO = 'Fecha de registro';

-- -----------------

INSERT INTO GE_PERMISOS (PER_ID,F_CREACION,F_MODIFICACION,USU_CREACION,USU_MODIFICACION,L_ACTIVA,C_CODIGO,D_DESCRIPCION,N_VERSION) VALUES (S_PERMISOS.NEXTVAL,SYSDATE,NULL,(SELECT USER FROM DUAL),NULL,'1','VIEW_XPC','Ver entradas no calificadas','1');
INSERT INTO GE_PERMISOS_PERFILES (PERM_PERF_ID, PERMPERF_PERF_ID, PERMPERF_PERM_ID, L_ACTIVA, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_PERMISOS_PERFILES.NEXTVAL, (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN'),(SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'VIEW_XPC'),1,SYSDATE, (SELECT USER FROM DUAL), 0);

-- -----------------

INSERT INTO GE_PERMISOS (PER_ID,F_CREACION,F_MODIFICACION,USU_CREACION,USU_MODIFICACION,L_ACTIVA,C_CODIGO,D_DESCRIPCION,N_VERSION) VALUES (S_PERMISOS.NEXTVAL,SYSDATE,NULL,(SELECT USER FROM DUAL),NULL,'1','VIEW_NOT_PDTE','Ver notificaciones pendientes','1');
INSERT INTO GE_PERMISOS_PERFILES (PERM_PERF_ID, PERMPERF_PERF_ID, PERMPERF_PERM_ID, L_ACTIVA, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_PERMISOS_PERFILES.NEXTVAL, (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN'),(SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'VIEW_NOT_PDTE'),1,SYSDATE, (SELECT USER FROM DUAL), 0);


INSERT INTO GE_PERMISOS (PER_ID,F_CREACION,F_MODIFICACION,USU_CREACION,USU_MODIFICACION,L_ACTIVA,C_CODIGO,D_DESCRIPCION,N_VERSION) VALUES (S_PERMISOS.NEXTVAL,SYSDATE,NULL,(SELECT USER FROM DUAL),NULL,'1','MOD_DAT_NOT','Modificación datos Notificaciones','1');
INSERT INTO GE_PERMISOS_PERFILES (PERM_PERF_ID, PERMPERF_PERF_ID, PERMPERF_PERM_ID, L_ACTIVA, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_PERMISOS_PERFILES.NEXTVAL, (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN'),(SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'MOD_DAT_NOT'),1,SYSDATE, (SELECT USER FROM DUAL), 0);


-----------------------------------

																																																																 
INSERT INTO GE_DOMINIOS (DOM_ID, C_CODIGO, D_DESCRIPCION, N_NIVEL_ANIDAMIENTO_MAX, L_BLOQUEADO, L_VISIBLE, L_PUNTO_MENU, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_DOMINIOS.NEXTVAL,'GRAV','Gravedad',0,1,1,0,SYSDATE, (SELECT USER FROM DUAL), 0);

INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'GRAV'),'L','Leve','Leve',0,0,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'GRAV')),1,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'GRAV'),'G','Grave','Grave',0,0,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'GRAV')),1,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'GRAV'),'MG','Muy grave','Muy grave',0,0,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'GRAV')),1,1,SYSDATE, (SELECT USER FROM DUAL), 0);

--------------------------

INSERT INTO GE_PERMISOS (PER_ID,F_CREACION,F_MODIFICACION,USU_CREACION,USU_MODIFICACION,L_ACTIVA,C_CODIGO,D_DESCRIPCION,N_VERSION) VALUES (S_PERMISOS.NEXTVAL,SYSDATE,NULL,(SELECT USER FROM DUAL),NULL,'1','EDIT_DESCIPCIONEXP','Editar descripción del expediente',0);
INSERT INTO GE_PERMISOS_PERFILES (PERM_PERF_ID, PERMPERF_PERF_ID, PERMPERF_PERM_ID, L_ACTIVA, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_PERMISOS_PERFILES.NEXTVAL, (SELECT PER_ID FROM GE_PERFILES WHERE C_CODIGO = 'ADMIN'),(SELECT PER_ID FROM GE_PERMISOS WHERE C_CODIGO = 'EDIT_DESCIPCIONEXP'),1,SYSDATE, (SELECT USER FROM DUAL), 0);                        

------------------------

INSERT INTO GE_DOMINIOS (DOM_ID, C_CODIGO, D_DESCRIPCION, N_NIVEL_ANIDAMIENTO_MAX, L_BLOQUEADO, L_VISIBLE, L_PUNTO_MENU, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_DOMINIOS.NEXTVAL,'ORIGREC','Origen reclamación',0,0,1,1,SYSDATE, (SELECT USER FROM DUAL), 0);

INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'ORIGREC'),'AEPD','Agencia Española de Protección de Datos','AEPD',0,1,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'ORIGREC')),0,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'ORIGREC'),'ATRANS','Área de Transparencia','ATRANS',0,2,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'ORIGREC')),0,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'ORIGREC'),'JUZG','Juzgado','JUZG',0,3,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'ORIGREC')),0,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'ORIGREC'),'OFIC','De Oficio','OFIC',0,4,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'ORIGREC')),0,1,SYSDATE, (SELECT USER FROM DUAL), 0);
INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, VALDOM_VALDOM_ID, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'ORIGREC'),'GCIV','Guardia Civil','GCIV',0,5,(SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = '' AND VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'ORIGREC')),0,1,SYSDATE, (SELECT USER FROM DUAL), 0);



SPOOL OFF;
