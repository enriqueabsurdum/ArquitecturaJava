package com.arquitecturajava;
import java.sql.SQLException;
import java.util.List;

public class LibroT {
    
    private String isbn;
    private String titulo;
    private String categoria;
    
    public LibroT(String isbn, String titulo, String categoria) {
        this.isbn = isbn;
        this.titulo = titulo;
        this.categoria = categoria;
    }
    
    public String getIsbn() {
        return isbn;
    }
    
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
    
    public String getTitulo() {
        return titulo;
    }
    
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
    public String getCategoria() {
        return categoria;
    }
    
    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    /* Método para buscar todas las categorias de los libros utilizando DataBaseHelperT.java */
    public static List<String> buscarTodaslasCategorias() throws SQLException {
        String consultaSQL = "SELECT DISTINCT categoria FROM Libros";
        DataBaseHelperT<String> dbh = new DataBaseHelperT<>();
        List<String> listaDeCategorias = dbh.seleccionarRegistros(consultaSQL, String.class);
        return listaDeCategorias;
    }

    /* Metodo para insertar un libro */
    public void insertar() throws SQLException {
        String consultaSQL = "INSERT INTO Libros (isbn, titulo, categoria) VALUES ";
        consultaSQL += "('" + isbn + "', '" + titulo + "', '" + categoria + "')";
        DataBaseHelperT dbh = new DataBaseHelperT();
        dbh.modificarRegistro(consultaSQL);
    }

    /* Método para buscar todos los registros de los libros utilizando DataBaseHelperT.java */
    public static List<LibroT> buscarTodos() throws SQLException {
        String consultaSQL = "SELECT isbn, titulo, categoria FROM Libros";
        DataBaseHelperT<LibroT> dbh = new DataBaseHelperT<>();
        List<LibroT> listaDeLibros = dbh.seleccionarRegistros(consultaSQL, LibroT.class);
        return listaDeLibros;
    }
}
