package com.arquitecturajava;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Libro {
    
    private String isbn;
    private String titulo;
    private String categoria;
    
    public Libro(String isbn, String titulo, String categoria) {
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

    /* Método para buscar todas las categorias */
    public static List<String> buscarTodaslasCategorias() throws SQLException {
        String consultaSQL = "SELECT DISTINCT categoria FROM Libros";
        DataBaseHelper dbh = new DataBaseHelper();
        ResultSet resultados = dbh.seleccionarRegistros(consultaSQL);
        List<String> listaDeCategorias = new ArrayList<>();
        String categoria = null;
        try {
            while (resultados.next()) {                
                categoria = resultados.getString("categoria");
                listaDeCategorias.add(categoria);
            }
        } catch (SQLException sqle) {
            System.out.printf("Error : %s\n", sqle.getMessage());
        }
        return listaDeCategorias;
    }

    /* Metodo para insertar un libro */
    public void insertar() throws SQLException {
        String consultaSQL = "INSERT INTO Libros (isbn, titulo, categoria) VALUES ";
        consultaSQL += "('" + isbn + "', '" + titulo + "', '" + categoria + "')";
        DataBaseHelper dbh = new DataBaseHelper();
        dbh.modificarRegistro(consultaSQL);
    }

    /* Método para buscar todos los registros de los libros */
    public static List<Libro> buscarTodos() throws SQLException {
        String consultaSQL = "SELECT isbn, titulo, categoria FROM Libros";
        DataBaseHelper dbh = new DataBaseHelper();
        ResultSet resultados = dbh.seleccionarRegistros(consultaSQL);
        List<Libro> listaDeLibros = new ArrayList<>();
        try {
            while (resultados.next()) {                
                listaDeLibros.add(new Libro(resultados.getString("isbn"), resultados.getString("titulo"), resultados.getString("categoria")));
            }
        } catch (SQLException sqle) {
            System.out.printf("Error : %s\n", sqle.getMessage());
        }
        return listaDeLibros;
    }
}
