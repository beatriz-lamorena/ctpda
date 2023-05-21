rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/015_UNDO_05_INSERTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

---------------------
-- VERSION 0.15.0  --
---------------------

DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'VIEW_NOTIF_AB');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'VIEW_NOTIF_AB';

DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'VIEW_FIRMAS_AB');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'VIEW_FIRMAS_AB';

-- ----------------
DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'VIEW_XPC');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'VIEW_XPC';

------------------

DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'VIEW_NOT_PDTE');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'VIEW_NOT_PDTE';

DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'MOD_DAT_NOT');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'MOD_DAT_NOT';

	

--------------------

DELETE FROM GE_VALORES_DOMINIOS WHERE VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'GRAV');
DELETE FROM GE_DOMINIOS WHERE C_CODIGO = 'GRAV';

--------------------------
													   

DELETE FROM GE_PERMISOS_PERFILES WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE C_CODIGO = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE C_CODIGO = 'EDIT_DESCIPCIONEXP');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'EDIT_DESCIPCIONEXP';    

-----------

DELETE FROM GE_VALORES_DOMINIOS WHERE VALDOM_DOM_ID = (SELECT DOM_ID FROM GE_DOMINIOS WHERE C_CODIGO = 'ORIGREC');

DELETE FROM GE_DOMINIOS WHERE C_CODIGO = 'ORIGREC';

SPOOL OFF;
