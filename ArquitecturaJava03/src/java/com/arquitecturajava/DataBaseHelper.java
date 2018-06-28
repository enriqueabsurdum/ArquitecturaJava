package com.arquitecturajava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataBaseHelper {

    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/arquitecturajava";
    private static final String USUARIO = "root";
    private static final String CLAVE = "root";

    public int modificarRegistro(String consultaSQL) throws SQLException {
        Connection conexion = null;
        Statement sentencia = null;
        int filasAfectadas = 0;
        try {
            Class.forName(DRIVER);
            conexion = DriverManager.getConnection(URL, USUARIO, CLAVE);
            sentencia = conexion.createStatement();
            filasAfectadas = sentencia.executeUpdate(consultaSQL);
        } catch (ClassNotFoundException cnfe) {
            System.out.printf("Error del Driver : %s\n", cnfe.getMessage());
        } catch (SQLException sqle) {
            System.out.printf("Error al acceder a la base de datos : %s\n", sqle.getMessage());
        } finally {
            if (sentencia != null) {
                sentencia.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
        return filasAfectadas;
    }
    
    public ResultSet seleccionarRegistros(String consultaSQL) throws SQLException {
        Connection conexion = null;
        Statement sentencia = null;
        ResultSet resultado = null;
        try {
            Class.forName(DRIVER);
            conexion = DriverManager.getConnection(URL, USUARIO, CLAVE);
            sentencia = conexion.createStatement();
            resultado = sentencia.executeQuery(consultaSQL);
        } catch (ClassNotFoundException cnfe) {
            System.out.printf("Error del Driver : %s\n", cnfe.getMessage());
        } catch (SQLException sqle) {
            System.out.printf("Error al acceder a la base de datos : %s\n", sqle.getMessage());
        }
        return resultado;
    }
}
