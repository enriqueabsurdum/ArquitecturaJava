<%@page import="com.arquitecturajava.DataBaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    /* 1. Lee la información que proviene de FormularioInsertarLibro02.jsp usando el objeto request de JSP */
    String isbn = request.getParameter("isbn");
    String titulo = request.getParameter("titulo");
    String categoria = request.getParameter("categoria");
    /* 2. Crea una consulta SQL de modificación */
    String consultaSQL = "INSERT INTO Libros (isbn, titulo, categoria) VALUES ";
    consultaSQL += "('" + isbn + "', '" + titulo + "', '" + categoria + "')";
    /* 3. Instancia un objeto de la clase DataBaseHelper */
    DataBaseHelper dbh = new DataBaseHelper();
    int filas = dbh.modificarRegistro(consultaSQL);
    response.sendRedirect("MostrarLibros02.jsp");
%>