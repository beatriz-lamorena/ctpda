rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/008_UNDO_05_INSERTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;


-- Permisos para plazos
DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'LIST_PLAZOEXP');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'LIST_PLAZOEXP';

DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'EDIT_PLAZOEXP');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'EDIT_PLAZOEXP';

DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'CONS_PLAZOEXP');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'CONS_PLAZOEXP';

UPDATE GE_DOMINIOS SET C_CODIGO = 'PLAZOS', D_DESCRIPCION = 'Plazos' WHERE C_CODIGO = 'TIP_PLA' and D_DESCRIPCION = 'Tipos de plazos';
UPDATE GE_DOMINIOS SET C_CODIGO = 'TIP_PLA', D_DESCRIPCION = 'Tipos de plazos' WHERE C_CODIGO = 'TIP_PLA_TEMP' and D_DESCRIPCION = 'Tipos de plazos temporal';

DELETE FROM GE_USUARIOS WHERE T_LOGIN = 'administrador';

-- Cambio en los limites de los estilos de los plazos
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '6' 
WHERE D_ESTILO = 'FondoRosaLetraRoja' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'ACU' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '1' 
WHERE D_ESTILO = 'FondoRojoLetraBlanca' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'ACU' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '16' 
WHERE D_ESTILO = 'FondoBlancoLetraRoja' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'ACU' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;

UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '31' 
WHERE D_ESTILO = 'FondoRosaLetraRoja' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RES' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '1' 
WHERE D_ESTILO = 'FondoRojoLetraBlanca' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RES' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '90' 
WHERE D_ESTILO = 'FondoBlancoLetraRoja' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RES' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '31' 
WHERE D_ESTILO = 'FondoRosaLetraRoja' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'API' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '1' 
WHERE D_ESTILO = 'FondoRojoLetraBlanca' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'API' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '90' 
WHERE D_ESTILO = 'FondoBlancoLetraRoja' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'API' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '6' 
WHERE D_ESTILO = 'FondoRosaLetraRoja' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'PRES' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '1' 
WHERE D_ESTILO = 'FondoRojoLetraBlanca' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'PRES' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '16' 
WHERE D_ESTILO = 'FondoBlancoLetraRoja' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'PRES' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '6' 
WHERE D_ESTILO = 'FondoRosaLetraRoja' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCE' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'ACU' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '1' 
WHERE D_ESTILO = 'FondoRojoLetraBlanca' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCE' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'ACU' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '16' 
WHERE D_ESTILO = 'FondoBlancoLetraRoja' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCE' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'ACU' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '6' 
WHERE D_ESTILO = 'FondoRosaLetraRoja' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCE' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RES' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '1' 
WHERE D_ESTILO = 'FondoRojoLetraBlanca' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCE' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RES' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_INFERIOR = '16' 
WHERE D_ESTILO = 'FondoBlancoLetraRoja' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCE' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RES' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;

-- Permisos para el formulario del plazo del expediente
DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'SAVE_PLAZOEXP');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'SAVE_PLAZOEXP';

DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'DESAC_PLAZOEXP');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'DESAC_PLAZOEXP';

DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'DARCUMP_PLAZOEXP');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'DARCUMP_PLAZOEXP';

DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'ACT_PLAZOEXP');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'ACT_PLAZOEXP';

DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'REHAB_PLAZOEXP');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'REHAB_PLAZOEXP';


-- Cambio en estilos de los plazos
UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_SUPERIOR = '31', D_ESTILO = 'FondoRojoLetraBlanca' 
WHERE D_ESTILO = 'FondoMoradoLetraBlanca' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RES' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;

UPDATE GE_CFG_PLAZOS_ESTILOS SET N_LIMITE_SUPERIOR = '31', D_ESTILO = 'FondoRojoLetraBlanca'  
WHERE D_ESTILO = 'FondoMoradoLetraBlanca' 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'API' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'))
;

DELETE FROM GE_CFG_PLAZOS_ESTILOS WHERE D_ESTILO = 'FondoRojoLetraBlanca' AND N_LIMITE_SUPERIOR = '31' AND N_LIMITE_INFERIOR = 11 
AND PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RES' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'));

DELETE FROM GE_CFG_PLAZOS_ESTILOS WHERE D_ESTILO = 'FondoRojoLetraBlanca' AND N_LIMITE_SUPERIOR = '31' AND N_LIMITE_INFERIOR = 11 
and PLAEST_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'RCO' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_EXP'))
AND PLAEST_VALDOM_TIPPLA_ID = (SELECT VAL_DOM_ID FROM ge_valores_dominios WHERE C_CODIGO = 'API' AND valdom_dom_id = (SELECT DOM_ID FROM ge_dominios WHERE C_CODIGO = 'TIP_PLA'));


-- Permisos para tareas

DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'LIST_MIMESA');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'LIST_MIMESA';

DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'CREAR_TAREADOCEXP');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'CREAR_TAREADOCEXP';

DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'VER_TAREASOTROS');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'VER_TAREASOTROS';
DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'VER_TAREASEQUIPO');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'VER_TAREASEQUIPO';
DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'VER_TAREASNOACTIVAS');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'VER_TAREASNOACTIVAS';
DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'VER_TAREASNOPENDIENTES');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'VER_TAREASNOPENDIENTES';

DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'TRAM_TAREAEXP');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'TRAM_TAREAEXP';
DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'EDIT_TAREA');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'EDIT_TAREA';
DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'ELIM_TAREA');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'ELIM_TAREA';
DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'REACT_TAREA');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'REACT_TAREA';
DELETE FROM GE_PERMISOS_PERFILES  WHERE PERMPERF_PERF_ID = (SELECT PER_ID FROM GE_PERFILES WHERE c_codigo = 'ADMIN') AND PERMPERF_PERM_ID = (SELECT PER_ID FROM GE_PERMISOS WHERE c_codigo = 'REHAB_TAREA');
DELETE FROM GE_PERMISOS WHERE C_CODIGO = 'REHAB_TAREA';


-----------------------------------------------------------------------------------------------
UPDATE GE_CFG_METADATOS_TRAM SET D_TIPO_INTERESADO = null, D_IDENTIF_INTERESADO = null, D_CANAL_ENTRADA = null, D_DATOS_CANAL_SALIDA = null,
D_FECHA_ENTRADA = null, D_IDENTIFICACION_ENTRADA = null
WHERE METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'INFAPI') 
AND METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCO');

DELETE FROM GE_CFG_METADATOS_TRAM  WHERE METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCE')
AND METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'INFAPI');

DELETE FROM GE_CFG_METADATOS_TRAM  WHERE METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCE')
AND METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'INIP');

DELETE FROM GE_CFG_METADATOS_TRAM  WHERE METTRAM_VALDOM_TIPEXP_ID = (SELECT VAL_DOM_ID FROM GE_VALORES_DOMINIOS WHERE C_CODIGO = 'RCO')
AND METTRAM_TIPTRAM_ID = (SELECT TIP_TRA_ID FROM GE_TIPO_TRAMITE WHERE T_CODIGO = 'INIP');


SPOOL OFF;
