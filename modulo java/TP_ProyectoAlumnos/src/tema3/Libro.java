/*
Clase Libro a la cual se agregaron constructores. 
 */
package tema3;


public class Libro {
   private String titulo;
   private Autor primerAutor; 
   private String editorial;
   private int añoEdicion;
   private String ISBN; 
   private double precio; 
     
    
    public Libro(String titulo,  String editorial, 
    int añoEdicion,  Autor primerAutor, String ISBN, double precio){
         this.titulo = titulo;
         this.editorial = editorial; 
         this.añoEdicion= añoEdicion;
         this.primerAutor = primerAutor;
         this.ISBN =  ISBN;
         this.precio = precio;
    }
    
    public Libro(String titulo,  String editorial,  Autor primerAutor, String ISBN){
         this.titulo = titulo;
         this.editorial = editorial; 
         this.añoEdicion= 2015;
         this.primerAutor = primerAutor;
         this.ISBN =  ISBN;
         this.precio = 100;
    }
     
    public Libro(){
   
    }
        
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
  
    public Autor getPrimerAutor(){
        return primerAutor;
    } 
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    public void setTitulo(String titulo){
        this.titulo = titulo;
    }
   
    public void setEditorial(String editorial){
         this.editorial = editorial;
    }
    public void setAñoEdicion(int añoEdicion){
         this.añoEdicion = añoEdicion;
    }
   
    public void setPrimerAutor(Autor primerAutor){
         this.primerAutor = primerAutor; 
    } 
    public void setISBN(String ISBN){
         this.ISBN = ISBN;
    } 
    public void setPrecio(double precio){
         this.precio = precio;
    }
  
   
    
   @Override
    public String toString(){
        String aux;
        aux= titulo + " por " + primerAutor.getNombre() + " - " + añoEdicion + " - " + " ISBN: " + ISBN;
       return ( aux);
    }
        
}
