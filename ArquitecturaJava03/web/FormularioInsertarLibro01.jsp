<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="js/validacion.js"></script>
        <link rel="stylesheet" type="text/css" href="css/formato.css">
    </head>
    <body>
        <form action="InsertarLibro.jsp" onsubmit="return validacion();">
            <fieldset>
                <legend>Formulario alta libro</legend>
                <p>
                    <label for="isbn">ISBN:</label>
                    <input id="isbn" type="text" name="isbn">
                </p>
                <p>
                    <label for="titulo">Título</label>
                    <input id="titulo" type="text" name="titulo">
                </p>
                <p>
                    <label for="categoria">Categoría</label>
                    <input id="categoria" type="text" name="categoria">
                </p>
                <p>
                    <input type="submit" value="Insertar">
                </p>
            </fieldset>
        </form>
    </body>
</html>
