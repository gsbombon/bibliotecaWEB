
package model;

public class Libro {
    
    int id;
    String titulo;
    String autor;
    String editorial;
    int anioEscrito;
    int anioEdicion;
    int isbn;

    public Libro() {
    }

    public Libro(int id, String titulo, String autor, String editorial, int anioEscrito, int anioEdicion, int isbn) {
        this.id = id;
        this.titulo = titulo;
        this.autor = autor;
        this.editorial = editorial;
        this.anioEscrito = anioEscrito;
        this.anioEdicion = anioEdicion;
        this.isbn = isbn;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getEditorial() {
        return editorial;
    }

    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    public int getAnioEscrito() {
        return anioEscrito;
    }

    public void setAnioEscrito(int anioEscrito) {
        this.anioEscrito = anioEscrito;
    }

    public int getAnioEdicion() {
        return anioEdicion;
    }

    public void setAnioEdicion(int anioEdicion) {
        this.anioEdicion = anioEdicion;
    }

    public int getIsbn() {
        return isbn;
    }

    public void setIsbn(int isbn) {
        this.isbn = isbn;
    }

       

    
    
}
