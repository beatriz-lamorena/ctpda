rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/001_05_INSERTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

-------------------
-- VERSION 0.1.0 --
-------------------

-- GE_COMUNICACIONES
INSERT INTO GE_COMUNICACIONES (COM_ID, F_CREACION, C_CODIGO, D_DESCRIPCION, N_VERSION) VALUES (S_COMUNICACIONES.NEXTVAL, SYSDATE, 'NOTIF', 'NOTIFIC@', 1);
INSERT INTO GE_COMUNICACIONES (COM_ID, F_CREACION, C_CODIGO, D_DESCRIPCION, N_VERSION) VALUES (S_COMUNICACIONES.NEXTVAL, SYSDATE, 'POS', 'POSTAL', 1);
INSERT INTO GE_COMUNICACIONES (COM_ID, F_CREACION, C_CODIGO, D_DESCRIPCION, N_VERSION) VALUES (S_COMUNICACIONES.NEXTVAL, SYSDATE, 'PDTE', 'PENDIENTE DETERMINAR', 1);
-- GE_SEXO
INSERT INTO GE_SEXO (SEX_ID, F_CREACION, C_CODIGO, D_DESCRIPCION, N_VERSION) VALUES (S_SEXO.NEXTVAL, SYSDATE, 'M', 'MUJER', 1);
INSERT INTO GE_SEXO (SEX_ID, F_CREACION, C_CODIGO, D_DESCRIPCION, N_VERSION) VALUES (S_SEXO.NEXTVAL, SYSDATE, 'H', 'HOMBRE', 1);
-- GE_TIPOSPERSONAS
INSERT INTO GE_TIPOSPERSONAS (TIPPER_ID, F_CREACION, C_CODIGO, D_DESCRIPCION, N_VERSION) VALUES (S_TIPOSPERSONAS.NEXTVAL, SYSDATE, 'FIS', 'FÍSICA', 1);
INSERT INTO GE_TIPOSPERSONAS (TIPPER_ID, F_CREACION, C_CODIGO, D_DESCRIPCION, N_VERSION) VALUES (S_TIPOSPERSONAS.NEXTVAL, SYSDATE, 'JUR', 'JURÍDICA', 1);

--GE_TIPOEXPEDIENTES
INSERT INTO GE_TIPOEXPEDIENTES (TIP_ID, C_CODIGO,D_DESCRIPCION,N_VERSION,L_ACTIVA) VALUES (S_TIPOEXPEDIENTE.NEXTVAL,'T_RCL_DER','RECLAMACIÓN EN MATERIA DE DERECHO DE ACCESO A LA INFORMACIÓN PÚBLICA.','0','1');
INSERT INTO GE_TIPOEXPEDIENTES (TIP_ID, C_CODIGO,D_DESCRIPCION,N_VERSION,L_ACTIVA) VALUES (S_TIPOEXPEDIENTE.NEXTVAL,'T_DEN_PUB','DENUNCIA POR INCUMPLIMIENTO DE LAS EXIGENCIAS DE PUBLICIDAD L_ACTIVA.','0','1');
INSERT INTO GE_TIPOEXPEDIENTES (TIP_ID, C_CODIGO,D_DESCRIPCION,N_VERSION,L_ACTIVA) VALUES (S_TIPOEXPEDIENTE.NEXTVAL,'PD_RCL_INF','RECLAMACIÓN POR INFRACCIÓN DE LA NORMATIVA DE PROTECCIÓN DE DATOS.','0','1');
INSERT INTO GE_TIPOEXPEDIENTES (TIP_ID, C_CODIGO,D_DESCRIPCION,N_VERSION,L_ACTIVA) VALUES (S_TIPOEXPEDIENTE.NEXTVAL,'PD_NOT_SEG','NOTIFICACIÓN DE UNA VIOLACIÓN DE LA SEGURIDAD DE LOS DATOS PERSONALES A LA AUTORIDAD DE CONTROL.','0','1');
INSERT INTO GE_TIPOEXPEDIENTES (TIP_ID, C_CODIGO,D_DESCRIPCION,N_VERSION,L_ACTIVA) VALUES (S_TIPOEXPEDIENTE.NEXTVAL,'PD_COM_DEL','COMUNICACIÓN A LA AUTORIDAD DE CONTROL DE LA DESIGNACIÓN, CESE O MODIFICACIÓN DE DATOS DEL DELEGADO DE PROTECCIÓN DE DATOS (DPD).','0','1');
INSERT INTO GE_TIPOEXPEDIENTES (TIP_ID, C_CODIGO,D_DESCRIPCION,N_VERSION,L_ACTIVA) VALUES (S_TIPOEXPEDIENTE.NEXTVAL,'SG_SOL_INF','SOLICITUD DE INFORMACIÓN PÚBLICA DEL CONSEJO.','0','1');
INSERT INTO GE_TIPOEXPEDIENTES (TIP_ID, C_CODIGO,D_DESCRIPCION,N_VERSION,L_ACTIVA) VALUES (S_TIPOEXPEDIENTE.NEXTVAL,'SG_EJE_DER','EJERCICIO DE LOS DERECHOS RELATIVOS A LA PROTECCIÓN DE LAS PERSONAS FÍSICAS EN LO QUE RESPECTA AL TRATAMIENTO DE LOS DATOS PERSONALES REALIZADOS POR EL CONSEJO.','0','1');

SPOOL OFF;
