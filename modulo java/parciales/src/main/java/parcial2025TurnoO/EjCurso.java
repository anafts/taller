/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial2025TurnoO;

public class EjCurso {

    
    public static void main(String[] args) {
        
        CursoBasico cursoBasico1 = new CursoBasico("cursoBasico1", 20.000, "10/05/2025", 20); 
        CursoAvanzado cursoAvanzado1 = new CursoAvanzado("Matematica", "cursoAvanzado1", 30.000, "10/05/2025", 20); 
        
        Alumno alumno1 = new Alumno("Lucas");
        Alumno alumno2 = new Alumno("Ana");
        Alumno alumno3 = new Alumno("Maria");
        
        
        cursoBasico1.agregarAlumno(alumno1);
        cursoBasico1.agregarAlumno(alumno3);
        cursoAvanzado1.agregarAlumno(alumno2); 
        
        cursoAvanzado1.actualizarRendimiento("Ana", 10);
        cursoBasico1.actualizarRendimiento("Lucas", 5);
        
        
        System.out.println(cursoBasico1.toString());
        System.out.println(cursoAvanzado1.toString()); 
        
    }
    
}
