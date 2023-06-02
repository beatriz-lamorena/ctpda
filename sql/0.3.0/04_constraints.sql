rem  Comprobación UTF8: Esto aparece en árabe: أنا تظهر في اللغة العربية

SPOOL logs/003_04_CONSTRAINTS.LOG
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;

ALTER TABLE GE_DOMINIOS_H ADD CONSTRAINT GE_DOM_H_REVAUD_FK FOREIGN KEY (REV) REFERENCES GE_REVAUD;

ALTER TABLE GE_VALORES_DOMINIOS ADD CONSTRAINT GE_VALDOM_DOM_FK FOREIGN KEY (VALDOM_DOM_ID) REFERENCES GE_DOMINIOS;
ALTER TABLE GE_VALORES_DOMINIOS ADD CONSTRAINT GE_VALDOM_VALDOM_FK FOREIGN KEY (VALDOM_VALDOM_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_VALORES_DOMINIOS_H ADD CONSTRAINT GE_VAL_DOM_H_REVAUD_FK FOREIGN KEY (REV) REFERENCES GE_REVAUD;

ALTER TABLE GE_PERSONAS ADD CONSTRAINT GE_PERSONA_VALDOM_SEX_FK FOREIGN KEY (PER_VALDOM_SEX_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_PERSONAS ADD CONSTRAINT GE_PERSONA_VALDOM_TIPPER_FK FOREIGN KEY (PER_VALDOM_TIPPER_ID) REFERENCES GE_VALORES_DOMINIOS;

ALTER TABLE GE_EXPEDIENTES ADD CONSTRAINT GE_EXP_VALDOM_CANENT_FK FOREIGN KEY (EXP_VALDOM_CANENT_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_EXPEDIENTES ADD CONSTRAINT GE_EXP_VALDOM_MAT_FK FOREIGN KEY (EXP_VALDOM_MAT_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_EXPEDIENTES ADD CONSTRAINT GE_EXP_VALDOM_SIT_FK FOREIGN KEY (EXP_VALDOM_SIT_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_EXPEDIENTES ADD CONSTRAINT GE_EXP_VALDOM_TIPEXP_FK FOREIGN KEY (EXP_VALDOM_TIPEXP_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_EXPEDIENTES ADD CONSTRAINT GE_EXP_VALDOM_TIPINF_FK FOREIGN KEY (EXP_VALDOM_TIPINF_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_EXPEDIENTES_H ADD CONSTRAINT GE_EXP_H_REVAUD_FK FOREIGN KEY (REV) REFERENCES GE_REVAUD;

ALTER TABLE GE_SUJETOS_OBLIGADOS_EXPDT ADD CONSTRAINT GE_SUJ_EXP_FK FOREIGN KEY (SUJ_EXP_ID) REFERENCES GE_EXPEDIENTES;
ALTER TABLE GE_SUJETOS_OBLIGADOS_EXPDT ADD CONSTRAINT GE_SUJ_SUJ_FK FOREIGN KEY (SUJ_SUJ_ID) REFERENCES GE_SUJETOS_OBLIGADOS;
ALTER TABLE GE_SUJETOS_OBLIGADOS_EXPDT ADD CONSTRAINT GE_SUJ_VALDOM_MOTRELEXPSUJ_FK FOREIGN KEY (SUJ_VALDOM_MOTRELEXPSUJ_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_SUJETOS_OBLIGADOS_EXPDT_H ADD CONSTRAINT GE_SUJ_EXP_H_REVAUD_FK FOREIGN KEY (REV) REFERENCES GE_REVAUD;

ALTER TABLE GE_PERSONAS_EXPEDIENTES ADD CONSTRAINT GE_PER_EXP_FK FOREIGN KEY (PER_EXP_ID) REFERENCES GE_EXPEDIENTES;
ALTER TABLE GE_PERSONAS_EXPEDIENTES ADD CONSTRAINT GE_PER_PER_FK FOREIGN KEY (PER_PER_ID) REFERENCES GE_PERSONAS;
ALTER TABLE GE_PERSONAS_EXPEDIENTES ADD CONSTRAINT GE_PER_PER_REPRE_FK FOREIGN KEY (PER_PER_REPRE_ID) REFERENCES GE_PERSONAS;
ALTER TABLE GE_PERSONAS_EXPEDIENTES ADD CONSTRAINT GE_PER_VALDOM_MOTRELEXPPER_FK FOREIGN KEY (PER_VALDOM_MOTRELEXPPER_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_PERSONAS_EXPEDIENTES_H ADD CONSTRAINT GE_PER_EXP_H_REVAUD_FK FOREIGN KEY (REV) REFERENCES GE_REVAUD;

ALTER TABLE GE_MATERIAS_TIPEXPEDIENTES ADD CONSTRAINT GE_MATTIPEXP_VALDOMMAT_FK FOREIGN KEY (MATTIPEXP_VALDOMMAT_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_MATERIAS_TIPEXPEDIENTES ADD CONSTRAINT GE_MATTIPEXP_VALDOMTIPEXP_FK FOREIGN KEY (MATTIPEXP_VALDOMTIPEXP_ID) REFERENCES GE_VALORES_DOMINIOS;
ALTER TABLE GE_MATERIAS_TIPEXPEDIENTES_H ADD CONSTRAINT GE_MATTIPEXP_H_REVAUD_FK FOREIGN KEY (REV) REFERENCES GE_REVAUD;

SPOOL OFF;