/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package tema3;


public class Demo01ConstructoresLibro {

    
    public static void main(String[] args) {
        Autor autor1 = new Autor("Herbert Schildt", 
            "Autor estadounidense de computación y lenguajes de programación (Java, C++, C#). Ex-tecladista de la banda Starcastle.", 
            "Estados Unidos"); 
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 autor1, "978-0071809252", 21.72);
        
        Autor autor2 = new Autor("John Horton", 
            "Entusiasta de la tecnología del Reino Unido, centrado en la programación de juegos.", 
            "Reino Unido"); 
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                              autor2, "978-1512108347");
       
        
        System.out.println("\n--- LIBROS ---");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        
        System.out.println();
        System.out.println("Precio del libro2: " + libro2.getPrecio());
        System.out.println("Año edición del libro2: " + libro2.getAñoEdicion());
        
        System.out.println("\n--- Representación Completa del Primer Autor del Libro 1 ---");
        System.out.println(libro1.getPrimerAutor().toString()); 
        
        Libro libro3 = new Libro(); 
    }
    
}
