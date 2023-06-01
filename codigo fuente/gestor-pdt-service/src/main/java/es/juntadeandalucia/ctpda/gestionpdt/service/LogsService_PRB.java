package es.juntadeandalucia.ctpda.gestionpdt.service;


import java.util.List;

import org.springframework.stereotype.Service;

import es.juntadeandalucia.ctpda.gestionpdt.model.Logs_PRB;
import es.juntadeandalucia.ctpda.gestionpdt.repository.LogsRepository_PRB;


@Service

public class LogsService_PRB {
    private LogsRepository_PRB logsRepository;

    public LogsService_PRB() {
        this.logsRepository = new LogsRepository_PRB();
    }

    public List<Logs_PRB> getLogs() {
        return logsRepository.getLogs();
    }
}
