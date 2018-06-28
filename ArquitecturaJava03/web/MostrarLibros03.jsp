<%@page import="java.util.List"%>
<%@page import="com.arquitecturajava.Libro"%>
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
            List<Libro> listaDeLibros = null;
            listaDeLibros = Libro.buscarTodos();
            for (Libro libro : listaDeLibros) {%>
        <%=libro.getIsbn()%>
        <%=libro.getTitulo()%>
        <%=libro.getCategoria()%>
        <br>
        <%   }%>

        <a href="FormularioInsertarLibro03.jsp">Insertar Libro</a>
    </body>
</html>
