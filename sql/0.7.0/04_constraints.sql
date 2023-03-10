rem Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/007_04_CONSTRAINTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

ALTER TABLE GE_DETALLE_EXPDTE_TRAM ADD CONSTRAINT GE_DETEXPTRAM_EXP_FK FOREIGN KEY (DETEXPTRAM_EXP_ID) REFERENCES GE_EXPEDIENTES;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM ADD CONSTRAINT GE_DETEXPTRAM_TRAMEXP_FK FOREIGN KEY (DETEXPTRAM_TRAMEXP_ID) REFERENCES GE_TRAMITE_EXPED;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM ADD CONSTRAINT GE_DETEXPTRAM_VALDOMCANENT_FK FOREIGN KEY (DETEXPTRAM_VALDOMCANENT_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM ADD CONSTRAINT GE_DETEXPTRAM_VALDOMCANSAL_FK FOREIGN KEY (DETEXPTRAM_VALDOMCANSAL_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM ADD CONSTRAINT GE_DETEXPTRAM_VALDOMSENRES_FK FOREIGN KEY (DETEXPTRAM_VALDOMSENRES_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM ADD CONSTRAINT GE_DETEXPTRAM_VALDOMTIPADM_FK FOREIGN KEY (DETEXPTRAM_VALDOMTIPADM_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM ADD CONSTRAINT GE_DETEXPTRAM_VALDOMTIPINT_FK FOREIGN KEY (DETEXPTRAM_VALDOMTIPINT_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM ADD CONSTRAINT GE_DETEXPTRAM_VALDOMTIPPLA_FK FOREIGN KEY (DETEXPTRAM_VALDOMTIPPLA_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM_H ADD CONSTRAINT GE_DETEXPTRAM_H_REVAUD_FK FOREIGN KEY (REV) REFERENCES GE_REVAUD;

ALTER TABLE GE_CFG_METADATOS_TRAM ADD CONSTRAINT GE_METTRAM_TIPTRAM_FK FOREIGN KEY (METTRAM_TIPTRAM_ID) REFERENCES GE_TIPO_TRAMITE;
ALTER TABLE GE_CFG_METADATOS_TRAM ADD CONSTRAINT GE_METTRAM_TIPTRAM_SUP_FK FOREIGN KEY (METTRAM_TIPTRAM_SUP_ID) REFERENCES GE_TIPO_TRAMITE;
ALTER TABLE GE_CFG_METADATOS_TRAM ADD CONSTRAINT GE_METTRAM_VALDOM_TIPEXP_FK FOREIGN KEY (METTRAM_VALDOM_TIPEXP_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_CFG_METADATOS_TRAM_H ADD CONSTRAINT GE_METTRAM_H_REVAUD_FK FOREIGN KEY (REV) REFERENCES GE_REVAUD;
--------------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE GE_CFG_PLAZOS_ESTILOS ADD CONSTRAINT GE_PLAEST_VALDOM_TIPEXP_FK FOREIGN KEY (PLAEST_VALDOM_TIPEXP_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_CFG_PLAZOS_ESTILOS ADD CONSTRAINT GE_PLAEST_VALDOM_TIPPLA_FK FOREIGN KEY (PLAEST_VALDOM_TIPPLA_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_CFG_PLAZOS_ESTILOS_H ADD CONSTRAINT GE_PLAEST_VALDOM_H_REVAUD_FK FOREIGN KEY (REV) REFERENCES GE_REVAUD;
ALTER TABLE GE_CFG_PLAZOS_EXPDTE ADD CONSTRAINT GE_PLAEXP_VALDOM_TIPEXP_FK FOREIGN KEY (PLAEXP_VALDOM_TIPEXP_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_CFG_PLAZOS_EXPDTE ADD CONSTRAINT GE_PLAEXP_VALDOM_TIPPLA_FK FOREIGN KEY (PLAEXP_VALDOM_TIPPLA_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_CFG_PLAZOS_EXPDTE_H ADD CONSTRAINT GE_PLEXP_VDOM_TIPPLA_H_REV_FK FOREIGN KEY (REV) REFERENCES GE_REVAUD;
--------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE GE_CFG_PLAZOS_AUT ADD CONSTRAINT GE_PLAAUT_TIPTRAM_FK FOREIGN KEY (PLAAUT_TIPTRAM_ID) REFERENCES GE_TIPO_TRAMITE;
ALTER TABLE GE_CFG_PLAZOS_AUT ADD CONSTRAINT GE_PLAAUT_TIPTRAMSUP_FK FOREIGN KEY (PLAAUT_TIPTRAMSUP_ID) REFERENCES GE_TIPO_TRAMITE;
ALTER TABLE GE_CFG_PLAZOS_AUT ADD CONSTRAINT GE_PLAAUT_VALDOM_PLAZO_FK FOREIGN KEY (PLAAUT_VALDOM_PLAZO_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_CFG_PLAZOS_AUT ADD CONSTRAINT GE_PLAAUT_VALDOM_TIPEXP_FK FOREIGN KEY (PLAAUT_VALDOM_TIPEXP_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_CFG_PLAZOS_AUT ADD CONSTRAINT GE_PLAAUT_VALDOM_TIPPLA_FK FOREIGN KEY (PLAAUT_VALDOM_TIPPLA_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_CFG_PLAZOS_AUT_H ADD CONSTRAINT FK55QGX7IOCTPNTIWAJ3JQEYU0W FOREIGN KEY (REV) REFERENCES GE_REVAUD;

--------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE GE_DETALLE_EXPDTE_TRAM ADD CONSTRAINT GE_DETEXPTRAM_VALDOM_INT_FK FOREIGN KEY (DETEXPTRAM_VALDOM_INT_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM ADD CONSTRAINT GE_DETEXPTRAM_PER_INT_FK FOREIGN KEY (DETEXPTRAM_PER_INT_ID) REFERENCES GE_PERSONAS;
ALTER TABLE GE_DETALLE_EXPDTE_TRAM ADD CONSTRAINT GE_DETEXPTRAM_SUJOBL_INT_FK FOREIGN KEY (DETEXPTRAM_SUJOBL_INT_ID) REFERENCES GE_SUJETOS_OBLIGADOS;

--------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE GE_DOCUMENTOS_EXPED_TRAMITES ADD CONSTRAINT GE_DOC_EXP_TRAM_UK UNIQUE (DETR_DOCEXP_ID, DETR_TRAMEXP_ID);
ALTER TABLE GE_DOCUMENTOS_EXPED_TRAMITES ADD CONSTRAINT GE_DOCEXPTRAM_DOCEXP_FK  FOREIGN KEY (DETR_DOCEXP_ID)  REFERENCES GE_DOCUMENTOS_EXPEDIENTES;
ALTER TABLE GE_DOCUMENTOS_EXPED_TRAMITES ADD CONSTRAINT GE_DOCEXPTRAM_TRAMEXP_FK FOREIGN KEY (DETR_TRAMEXP_ID) REFERENCES GE_TRAMITE_EXPED;

--------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE GE_SUJETOS_OBLIGADOS ADD CONSTRAINT GE_SUJOBLI_VALDOM_VIACOM_FK FOREIGN KEY (SUJ_VALDOM_VIACOM_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_SUJETOS_OBLIGADOS ADD CONSTRAINT GE_SUJOBLI_VALDOM_TIPOLO_FK FOREIGN KEY (SUJ_VALDOM_TIPOLO_ID) REFERENCES GE_VALORES_DOMINIOS;




SPOOL OFF;
