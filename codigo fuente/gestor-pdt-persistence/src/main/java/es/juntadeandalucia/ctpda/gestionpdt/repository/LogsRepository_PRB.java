package es.juntadeandalucia.ctpda.gestionpdt.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import es.juntadeandalucia.ctpda.gestionpdt.model.Logs_PRB;

public class LogsRepository_PRB {
    private static final String url = "jdbc:oracle:thin:@143.47.59.212:8521/MORAL";
    private static final String username = "GESTOR";
    private static final String password = "X_1_GESTOR";

    public List<Logs_PRB> getLogs() {
        List<Logs_PRB> logs = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String sql = "SELECT * FROM Logs";
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    int logId = rs.getInt("log_id");
                    String nivel = rs.getString("nivel");
                    String mensaje = rs.getString("mensaje");
                    Timestamp fecha = rs.getTimestamp("fecha");

                    Logs_PRB log = new Logs_PRB(logId, nivel, mensaje, fecha);
                    logs.add(log);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return logs;
    }
}
