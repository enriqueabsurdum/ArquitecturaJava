<%@page import="com.arquitecturajava.Libro"%>
<%@page import="com.arquitecturajava.DataBaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    /* 1. Lee la información que proviene de FormularioInsertarLibro03.jsp usando el objeto request de JSP */
    String isbn = request.getParameter("isbn");
    String titulo = request.getParameter("titulo");
    String categoria = request.getParameter("categoria");
    /* Consulta simplificada dada la existencia de la clase Libro */
    Libro libro = new Libro(isbn, titulo, categoria);
    libro.insertar();
    response.sendRedirect("MostrarLibros03.jsp");
%>