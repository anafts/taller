/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;


public class Estante {
    private Libro [] vector;
    private int cantLibros = 0; 
    private int DF = 20;    
    
    public Estante() { 
        vector = new Libro [DF];
    }
    
    public Estante(int DF) {
        this.DF = DF;
        vector = new Libro[DF]; 
        
    }
    
    public int getCantLivros() {
        return cantLibros; 
        
    }
    
    public boolean estanteLlena() {
        return cantLibros == DF;
    }
    
    public void agregarLibro(Libro libro) {
        if(!estanteLlena()) {
            vector[cantLibros] = libro;
            cantLibros++;
        } 
    }
    
    public Libro devolverLibro(String titulo) {
        for(int i=0; i < cantLibros; i++){
            if(vector[i].getTitulo().equals(titulo)) {
                return vector[i];
            }
        }
        
        return null;
    }
    
    
}
