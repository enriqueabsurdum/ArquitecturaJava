<%@page import="com.arquitecturajava.LibroT"%>
<%@page import="java.util.List"%>
<%@page import="com.arquitecturajava.DataBaseHelperT"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Libros</title>
    </head>
    <body>

        <select name="categoria">
            <%
                List<String> listaDeCategorias = null;
                listaDeCategorias = LibroT.buscarTodaslasCategorias();
                for (String categoria : listaDeCategorias) {%>
            <option value="<%=categoria%>"><%=categoria%></option>
            <%}%>
        </select>   
        <br>
        <%
            List<LibroT> listaDeLibros = null;
            listaDeLibros = LibroT.buscarTodos();
            for (LibroT libro : listaDeLibros) {%>
        <%=libro.getIsbn()%>
        <%=libro.getTitulo()%>
        <%=libro.getCategoria()%>
        <br>   
        <% }%>

        <a href="FormularioInsertarLibro03.jsp">Insertar Libro</a>
    </body>
</html>
