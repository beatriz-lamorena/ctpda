package es.juntadeandalucia.ctpda.gestionpdt.model;

import java.sql.Timestamp;

public class Logs_PRB {
    private int logId;
    private String nivel;
    private String mensaje;
    private Timestamp fecha;

    public Logs_PRB(int logId, String nivel, String mensaje, Timestamp fecha) {
        this.logId = logId;
        this.nivel = nivel;
        this.mensaje = mensaje;
        this.fecha = fecha;
    }

    // Getters y setters

    public int getLogId() {
        return logId;
    }

    public void setLogId(int logId) {
        this.logId = logId;
    }

    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }
}
