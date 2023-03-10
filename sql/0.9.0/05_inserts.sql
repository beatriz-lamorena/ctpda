rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/009_05_INSERTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

-------------------
-- VERSION 0.9.0 --
-------------------

UPDATE GE_CFG_METADATOS_TRAM SET D_TIPO_INTERESADO = 'Tipo interesado', D_IDENTIF_INTERESADO = 'Interesado',D_CANAL_SALIDA = 'Canal de salida',D_DATOS_CANAL_SALIDA = 'Datos canal de salida', D_NOTIF_INFRUCTUOSA = 'Notificación infructuosa'
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'SUB') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCE');

UPDATE GE_CFG_METADATOS_TRAM SET D_TIPO_INTERESADO = 'Tipo interesado', D_IDENTIF_INTERESADO = 'Interesado',D_CANAL_SALIDA = 'Canal de salida',D_DATOS_CANAL_SALIDA = 'Datos canal de salida', D_NOTIF_INFRUCTUOSA = 'Notificación infructuosa'
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'SUB') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCO');
-------------------

UPDATE GE_CFG_METADATOS_TRAM SET D_FECHA_LIMITE = 'Fecha límite' WHERE D_FECHA_LIMITE IS NOT NULL;

-------------------
-- Configuración plazos para Notificaciones en Subsanación
-------------------


INSERT INTO GE_VALORES_DOMINIOS (VAL_DOM_ID, VALDOM_DOM_ID, C_CODIGO, D_DESCRIPCION,T_ABREVIATURA, N_NIVEL_ANIDAMIENTO, N_ORDEN, L_BLOQUEADO, L_ACTIVO, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_VALORES_DOMINIOS.NEXTVAL,(SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'TIP_PLA'),'NOT','Notificación','Notificación',0,0,1,1,SYSDATE, (SELECT USER FROM DUAL), 0);


INSERT INTO GE_CFG_PLAZOS_AUT (CFG_ID, F_CREACION, USU_CREACION, L_ACTIVO, L_AVISO, N_VERSION, V_ORIGEN, N_PLAZO, PLAAUT_TIPTRAM_ID, PLAAUT_VALDOM_PLAZO_ID, PLAAUT_VALDOM_TIPEXP_ID, PLAAUT_VALDOM_TIPPLA_ID, V_TIPO_ACCION) VALUES ( S_CFG_PLAZOS_AUT.NEXTVAL, SYSDATE, (SELECT USER FROM DUAL), 1,0,0,'E', 10, (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'SUB'),
	(SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'NOT' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA')),
	(SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP')),
	(SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'DN' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA_TEMP')),'C');
	
INSERT INTO GE_CFG_PLAZOS_AUT (CFG_ID, F_CREACION, USU_CREACION, L_ACTIVO, L_AVISO, N_VERSION, V_ORIGEN, N_PLAZO, PLAAUT_TIPTRAM_ID, PLAAUT_VALDOM_PLAZO_ID, PLAAUT_VALDOM_TIPEXP_ID, PLAAUT_VALDOM_TIPPLA_ID, V_TIPO_ACCION) VALUES ( S_CFG_PLAZOS_AUT.NEXTVAL, SYSDATE, (SELECT USER FROM DUAL), 1,0,0,'E', 10, (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'SUB'),
	(SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'NOT' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA')),
	(SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCE' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP')),
	(SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'DN' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA_TEMP')),'C');
	
--------------

UPDATE GE_CFG_METADATOS_TRAM SET D_FECHA_FIRMA = 'Fecha Firma'
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'FIRM') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCO');


UPDATE GE_CFG_METADATOS_TRAM SET D_FECHA_FIRMA = 'Fecha Firma'
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'FIRM') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCE');

UPDATE GE_CFG_METADATOS_TRAM SET D_CANAL_SALIDA = 'Canal de salida', D_DATOS_CANAL_SALIDA = 'Datos canal de salida',
D_NOTIF_INFRUCTUOSA = 'Notificación infructuosa', D_FECHA_RESPUESTA = 'Fecha respuesta'
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'REQINF') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCO');

UPDATE GE_CFG_METADATOS_TRAM SET D_CANAL_SALIDA = 'Canal de salida', D_DATOS_CANAL_SALIDA = 'Datos canal de salida',
D_NOTIF_INFRUCTUOSA = 'Notificación infructuosa', D_FECHA_RESPUESTA = 'Fecha respuesta'
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'REQINF') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCE');

INSERT INTO GE_CFG_METADATOS_TRAM (CFG_ID, METTRAM_VALDOM_TIPEXP_ID, METTRAM_TIPTRAM_ID, D_TIPO_INTERESADO, D_IDENTIF_INTERESADO, D_BT_INCORPORAR_DOC, D_BT_GENERAR_DOC, D_FECHA_INFORME,L_ACTIVO, N_VERSION, F_CREACION, USU_CREACION) 
VALUES (S_CFG_METADATOS_TRAM.NEXTVAL, (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE c_codigo = 'RCO'), (SELECT tip_tra_id FROM ge_tipo_tramite WHERE t_codigo = 'GDOC'),'Tipo interesado', 'Interesado','Incorporar Docs', 'Generar Doc', 'Fecha informe', 1,0,SYSDATE,(SELECT USER FROM DUAL));

INSERT INTO GE_CFG_METADATOS_TRAM (CFG_ID, METTRAM_VALDOM_TIPEXP_ID, METTRAM_TIPTRAM_ID, D_TIPO_INTERESADO, D_IDENTIF_INTERESADO, D_BT_INCORPORAR_DOC, D_BT_GENERAR_DOC, D_FECHA_INFORME,L_ACTIVO, N_VERSION, F_CREACION, USU_CREACION) 
VALUES (S_CFG_METADATOS_TRAM.NEXTVAL, (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE c_codigo = 'RCE'), (SELECT tip_tra_id FROM ge_tipo_tramite WHERE t_codigo = 'GDOC'),'Tipo interesado', 'Interesado', 'Incorporar Docs', 'Generar Doc', 'Fecha informe', 1,0,SYSDATE,(SELECT USER FROM DUAL));


UPDATE GE_CFG_METADATOS_TRAM SET D_FECHA_INFORME = 'Fecha informe', D_FECHA_FIRMA = 'Fecha firma' , D_FECHA_ENVIO = 'Fecha envío notificación'
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'ACADM') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCO');

UPDATE GE_CFG_METADATOS_TRAM SET D_FECHA_INFORME = 'Fecha informe', D_FECHA_FIRMA = 'Fecha firma' , D_FECHA_ENVIO = 'Fecha envío notificación'
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'ACADM') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCE');
	
-- Permiso para cambiar tipo de documento
INSERT INTO GE_PERMISOS (PER_ID,F_CREACION,F_MODIFICACION,USU_CREACION,USU_MODIFICACION,L_ACTIVA,C_CODIGO,D_DESCRIPCION,N_VERSION) VALUES (S_PERMISOS.NEXTVAL,SYSDATE,NULL,(SELECT USER FROM DUAL),NULL,'1','EDIT_EXPTIPODOC','Cambiar tipo de documento','1');
INSERT INTO GE_PERMISOS_PERFILES (PERM_PERF_ID, PERMPERF_PERF_ID, PERMPERF_PERM_ID, L_ACTIVA, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_PERMISOS_PERFILES.NEXTVAL, (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN'),(SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'EDIT_EXPTIPODOC'),1,SYSDATE, (SELECT USER FROM DUAL), 0);

UPDATE GE_CFG_METADATOS_TRAM SET D_TIPO_INTERESADO = 'Tipo interesado', D_IDENTIF_INTERESADO = 'Interesado', D_FECHA_FIRMA = 'Fecha de firma',
D_CANAL_SALIDA = 'Canal de salida', D_DATOS_CANAL_SALIDA = 'Datos canal de salida', D_NOTIF_INFRUCTUOSA = 'Notificación infructuosa'
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'REQAVIS') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCO');

UPDATE GE_CFG_METADATOS_TRAM SET D_TIPO_INTERESADO = 'Tipo interesado', D_IDENTIF_INTERESADO = 'Interesado', D_FECHA_FIRMA = 'Fecha de firma',
D_CANAL_SALIDA = 'Canal de salida', D_DATOS_CANAL_SALIDA = 'Datos canal de salida', D_NOTIF_INFRUCTUOSA = 'Notificación infructuosa'
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'REQAVIS') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCE');

UPDATE GE_CFG_METADATOS_TRAM SET D_TIPO_INTERESADO = 'Tipo interesado', D_IDENTIF_INTERESADO = 'Interesado', D_FECHA_FIRMA = 'Fecha de firma',
D_CANAL_SALIDA = 'Canal de salida', D_DATOS_CANAL_SALIDA = 'Datos canal de salida', D_NOTIF_INFRUCTUOSA = 'Notificación infructuosa'
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'REQCUMPL') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCO');

UPDATE GE_CFG_METADATOS_TRAM SET D_TIPO_INTERESADO = 'Tipo interesado', D_IDENTIF_INTERESADO = 'Interesado', D_FECHA_FIRMA = 'Fecha de firma',
D_CANAL_SALIDA = 'Canal de salida', D_DATOS_CANAL_SALIDA = 'Datos canal de salida', D_NOTIF_INFRUCTUOSA = 'Notificación infructuosa'
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'REQCUMPL') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCE');
	
UPDATE GE_SERIES SET T_PATRON = 'RCO-2022/{3}', N_NUMERO_FINAL = 999 WHERE T_PATRON = 'RCO-2022-{4}';
UPDATE GE_SERIES SET T_PATRON = 'RCO-2021/{3}', N_NUMERO_FINAL = 999 WHERE T_PATRON = 'RCO-2021-{4}';
UPDATE GE_SERIES SET T_PATRON = 'RCE-2022/{3}', N_NUMERO_FINAL = 999 WHERE T_PATRON = 'RCE-2022-{4}';
UPDATE GE_SERIES SET T_PATRON = 'RCE-2021/{3}', N_NUMERO_FINAL = 999 WHERE T_PATRON = 'RCE-2021-{4}';

UPDATE GE_TIPO_TRAMITE set T_COMPORTAMIENTO = 'C009' WHERE T_CODIGO = 'TRDPD';

UPDATE GE_CFG_METADATOS_TRAM SET D_AFECTA_PLAZOS = 'Afecta Plazo', D_FECHA_LIMITE = 'Fecha Limite', D_FECHA_RESPUESTA = 'Fecha Respuesta', D_NOTIF_INFRUCTUOSA = 'Notificación Infructuosa', D_PLAZO = 'Plazo', D_TIPO_PLAZO = 'Tipo de Plazo', D_FECHA_NOTIFICACION = 'Fecha Notificación'
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'TRDPD') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCE');


UPDATE GE_CFG_METADATOS_TRAM SET D_AFECTA_PLAZOS = 'Afecta Plazo', D_FECHA_LIMITE = 'Fecha Limite', D_FECHA_RESPUESTA = 'Fecha Respuesta', D_NOTIF_INFRUCTUOSA = 'Notificación Infructuosa', D_PLAZO = 'Plazo', D_TIPO_PLAZO = 'Tipo de Plazo', D_FECHA_NOTIFICACION = 'Fecha Notificación'
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'TRDPD') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCO');

INSERT INTO GE_PERMISOS (PER_ID,F_CREACION,F_MODIFICACION,USU_CREACION,USU_MODIFICACION,L_ACTIVA,C_CODIGO,D_DESCRIPCION,N_VERSION) VALUES (S_PERMISOS.NEXTVAL,SYSDATE,NULL,(SELECT USER FROM DUAL),NULL,'1','LIST_TAREASEXP','Acceder a la pestaña tareas','1');
INSERT INTO GE_PERMISOS_PERFILES (PERM_PERF_ID, PERMPERF_PERF_ID, PERMPERF_PERM_ID, L_ACTIVA, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_PERMISOS_PERFILES.NEXTVAL, (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN'),(SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'LIST_TAREASEXP'),1,SYSDATE, (SELECT USER FROM DUAL), 0);

INSERT INTO GE_PERMISOS (PER_ID,F_CREACION,F_MODIFICACION,USU_CREACION,USU_MODIFICACION,L_ACTIVA,C_CODIGO,D_DESCRIPCION,N_VERSION) VALUES (S_PERMISOS.NEXTVAL,SYSDATE,NULL,(SELECT USER FROM DUAL),NULL,'1','ERRO_SUJOBL','Indicar sujeto obligado como erroneo','1');
INSERT INTO GE_PERMISOS_PERFILES (PERM_PERF_ID, PERMPERF_PERF_ID, PERMPERF_PERM_ID, L_ACTIVA, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_PERMISOS_PERFILES.NEXTVAL, (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN'),(SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'ERRO_SUJOBL'),1,SYSDATE, (SELECT USER FROM DUAL), 0);

INSERT INTO GE_PERMISOS (PER_ID,F_CREACION,F_MODIFICACION,USU_CREACION,USU_MODIFICACION,L_ACTIVA,C_CODIGO,D_DESCRIPCION,N_VERSION) VALUES (S_PERMISOS.NEXTVAL,SYSDATE,NULL,(SELECT USER FROM DUAL),NULL,'1','MODSITFINAL','Editar tareas finalizadas','1');
INSERT INTO GE_PERMISOS_PERFILES (PERM_PERF_ID, PERMPERF_PERF_ID, PERMPERF_PERM_ID, L_ACTIVA, F_CREACION, USU_CREACION, N_VERSION) VALUES (S_PERMISOS_PERFILES.NEXTVAL, (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN'),(SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'MODSITFINAL'),1,SYSDATE, (SELECT USER FROM DUAL), 0);

SPOOL OFF;
