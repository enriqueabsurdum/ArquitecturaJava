package com.arquitecturajava;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DataBaseHelperT<T> {

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

    public List<T> seleccionarRegistros(String consultaSQL, Class clase) throws SQLException {
        Connection conexion = null;
        Statement sentencia = null;
        ResultSet resultado = null;
        List<T> listaDeObjetos = new ArrayList<>();
        try {
            Class.forName(DRIVER);
            conexion = DriverManager.getConnection(URL, USUARIO, CLAVE);
            sentencia = conexion.createStatement();
            resultado = sentencia.executeQuery(consultaSQL);
            while (resultado.next()) {
                T objeto = (T) Class.forName(clase.getName()).newInstance();
                Method[] metodos = objeto.getClass().getDeclaredMethods();
                for (int i = 0; i < metodos.length; i++) {
                    if (metodos[i].getName().startsWith("set")) {
                        metodos[i].invoke(objeto, resultado.getString(metodos[i].getName().substring(3)));
                    }
                    if (objeto.getClass().getName().equals("java.lang.String")) {
                        objeto = (T) resultado.getString(1);
                    }
                }
                listaDeObjetos.add(objeto);
            }
        } catch (Exception e) {
            System.out.printf("Error al seleccionar registros : %s\n", e.getMessage());
        } finally {
            if (sentencia != null) {
                sentencia.close();
            }
            if (conexion != null) {
                conexion.close();
            }
            return listaDeObjetos;
        }
    }
}
