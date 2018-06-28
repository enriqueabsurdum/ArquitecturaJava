<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>

<%
    /* 1. Lee la información que proviene de FormularioInsertarLibro.jsp usando el objeto request de JSP */
    String isbn = request.getParameter("isbn");
    String titulo = request.getParameter("titulo");
    String categoria = request.getParameter("categoria");
    Connection conexion = null;
    Statement sentencia = null;
    int filas = 0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        /* 2. Crea un objeto de tipo Connection (conexión) y un objeto de tipo, Statement (sentencia) */
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/arquitecturajava", "root", "root");
        sentencia = conexion.createStatement();
        /* 3. Crea una consulta SQL de insercción con los datos del libro*/
        String consultaSQL = "INSERT INTO Libros (isbn, titulo, categoria) VALUES ";
        consultaSQL += "('" + isbn + "','" + titulo + "','" + categoria + "')";
        /* 4. Ejecuta la sentencia con su SQL */
        filas = sentencia.executeUpdate(consultaSQL);
        response.sendRedirect("MostrarLibros.jsp");
    } catch (SQLException sqle) {
        System.out.printf("Error al acceder a la base de datos : %s\n", sqle.getMessage());
    } finally {
        /* 5. Cierra los recursos (conexion, sentencia) */
        if (sentencia != null) {
            sentencia.close();
        }
        if (conexion != null) {
            conexion.close();
        }
    }

%>