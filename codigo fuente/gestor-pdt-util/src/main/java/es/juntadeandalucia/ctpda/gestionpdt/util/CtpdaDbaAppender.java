package es.juntadeandalucia.ctpda.gestionpdt.util;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.apache.logging.log4j.Level;



public class CtpdaDbaAppender extends DBAppender{
    @Override
    protected void subAppend(ILoggingEvent event, Connection connection, PreparedStatement insertStatement) throws Throwable {

        //Filtrado para que solo inserte los errores
           if(event.getLevel().equals(Level.ERROR)) {
               super.subAppend(event, connection, insertStatement);
           }
    }
}
