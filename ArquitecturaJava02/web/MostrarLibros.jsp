<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Libros</title>
    </head>
    <body>

        <%
            Connection conexion = null;
            Statement sentencia = null;
            ResultSet resultado = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                /* 1. Crera un objeto conexión y un objeto sentencia */
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/arquitecturajava", "root", "root");
                sentencia = conexion.createStatement();
                /* 2. Crea una consulta SQL de selección para todos los libros 
                      de la tabla */
                String consultaSQL = "SELECT isbn, titulo, categoria FROM Libros";
                /* 3. Ejecuta la sentencia con su SQL */
                /* 4. Devuelve un ResultSet con todos los registros */
                resultado = sentencia.executeQuery(consultaSQL);
                /* 5. Recorre el ResultSet y lo imprime en html */
                while (resultado.next()) {%>                    
                    <%=resultado.getString("isbn")%>
                    <%=resultado.getString("titulo")%>
                    <%=resultado.getString("categoria")%>
                <br>
        <% }
            } catch (SQLException sqle) {
                System.out.printf("Error al acceder a la base de datos : %s\n", sqle.getMessage());
            } finally {
                /* 6. Cierra los recuros (conexión, sentencia, resultado) */
                if (resultado != null) {
                    resultado.close();
                }
                if (sentencia != null) {

                }
                if (conexion != null) {
                    conexion.close();
                }
            }
        %>

        <a href="FormularioInsertarLibro.jsp">Insertar Libro</a>
    </body>
</html>
