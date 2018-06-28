<%@page import="com.arquitecturajava.DataBaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Libros</title>
    </head>
    <body>

        <select name="categoria">
            <option value="seleccionar">Seleccionar</option>
            <%
                ResultSet rs = null;
                try {
                    String consultaSQL = "SELECT DISTINCT categoria FROM Libros";
                    DataBaseHelper helper = new DataBaseHelper();
                    rs = helper.seleccionarRegistros(consultaSQL);
                    while (rs.next()) {%>
            <option value="<%=rs.getString("categoria")%>"><%=rs.getString("categoria")%></option>
            <% }
                } catch (SQLException sqle) {
                    System.out.printf("Error al acceder a la base de datos : %s\n" + sqle.getMessage());
                }%>   
        </select>
        <br>


        <%
            ResultSet resultado = null;
            try {
                /* 1. Crea una consulta SQL de selección para todos los libros de la tabla */
                String consultaSQL = "SELECT isbn, titulo, categoria FROM Libros";
                /* 2. Instancia un objeto de la clase DataBaseHelper */
                DataBaseHelper dbh = new DataBaseHelper();
                resultado = dbh.seleccionarRegistros(consultaSQL);
                /* 3. Recorre el ResultSet y lo imprime en html */
                while (resultado.next()) {%>                    
                    <%=resultado.getString("isbn")%>
                    <%=resultado.getString("titulo")%>
                    <%=resultado.getString("categoria")%>
                <br>
        <% }
            } catch (SQLException sqle) {
                System.out.printf("Error al acceder a la base de datos : %s\n", sqle.getMessage());
            } finally {
                /* 4. Cierra los recursos (conexión, sentencia, resultado) */
                if (resultado != null) {
                    resultado.close();
                }
            }
        %>

        <a href="FormularioInsertarLibro02.jsp">Insertar Libro</a>
    </body>
</html>
