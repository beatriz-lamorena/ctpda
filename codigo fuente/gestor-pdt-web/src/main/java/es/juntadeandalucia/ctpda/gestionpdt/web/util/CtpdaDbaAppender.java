package es.juntadeandalucia.ctpda.gestionpdt.web.util;

import java.sql.Connection;
import java.sql.PreparedStatement;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.db.DBAppender;
import ch.qos.logback.classic.spi.ILoggingEvent;


public class CtpdaDbaAppender extends DBAppender{
	
	@Override
	protected void subAppend(ILoggingEvent event, Connection connection, PreparedStatement insertStatement) throws Throwable {
	
		//Filtrado para que solo inserte los errores
	   	if(event.getLevel().equals(Level.ERROR)) {
	   		super.subAppend(event, connection, insertStatement);
	   	}
	}

}
