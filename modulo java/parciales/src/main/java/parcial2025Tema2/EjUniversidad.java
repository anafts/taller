/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial2025Tema2;

/**
 *
 * @author anafreitas
 */
public class EjUniversidad {

    
    public static void main(String[] args) {
        
        Universidad unq = new Universidad(200);
      
        Alumno alumnoBuscado = new Alumno("Maria", "Souza", "L2020"); 
        Alumno alu2 = new Alumno("João", "Silva", "A101");

        unq.agregarNuevoExamen(new Examen(7, 2020, "escrito", 9.0, alumnoBuscado), 2020); 
        unq.agregarNuevoExamen(new Examen(10, 2020, "escrito", 8.0, alumnoBuscado), 2020); 
        unq.agregarNuevoExamen(new Examen(5, 2023, "oral", 6.5, alu2), 2023);
        unq.agregarNuevoExamen(new Examen(6, 2021, "escrito",  9.5, alu2), 2021); 

        System.out.println(unq.devolverInformacionExamenes(7.0));
        System.out.println(unq.anioConMayorCantDeExamenesRendidos("escrito"));
        System.out.println(unq.examenesRendidosPorUnAlumno("L2020", 2020));
        
        
    }
    
}
