rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

set define off
spool 01_LANZADOR.log

CONNECT gestor/X_1_GESTOR@10.244.12.148:1521/dbdesa01

@@0.1.0/lanzador_v1.0.0.SQL
@@0.2.0/lanzador_v1.0.0.SQL
@@0.3.0/lanzador_v1.0.0.SQL
@@0.4.0/lanzador_v1.0.0.SQL
@@0.5.0/lanzador_v1.0.0.SQL
@@0.6.0/lanzador_v1.0.0.SQL
@@0.7.0/lanzador_v1.0.0.SQL
@@0.8.0/lanzador_v1.0.0.SQL
@@0.9.0/lanzador_v1.0.0.SQL
@@0.10.0/lanzador_v1.0.0.SQL
@@0.11.0/lanzador_v1.0.0.SQL
@@0.12.0/lanzador_v1.0.0.SQL
@@0.13.0/lanzador_v1.0.0.SQL
@@0.14.0/lanzador_v1.0.0.SQL
@@0.15.0/lanzador_v1.0.0.SQL
@@0.16.0/lanzador_v1.0.0.SQL
@@0.17.0/lanzador_v1.0.0.SQL


spool off;
