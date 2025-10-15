/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2025TurnoO;


public class CursoBasico extends Curso {

    public CursoBasico(String nombre, double costoInscription, String fechaDeComienzo, int maxAlumnos) {
        super(nombre, costoInscription, fechaDeComienzo, maxAlumnos);
    }

    @Override
    public Alumno calcularMejorDesempeno() {
        int mayorCantTareasCompletadas = 0;
        Alumno mejorAlumno = null; 
        for(int i=0; i < this.getCantAlumnos(); i++) {
            Alumno alumno = this.obterAluno(i);
            if(alumno.getCantTareaCompletadas() > mayorCantTareasCompletadas) {
                mayorCantTareasCompletadas = alumno.getCantTareaCompletadas();
                mejorAlumno = alumno; 
            }
        }
        return mejorAlumno;  
    }

    @Override
    public String toString() {
        return super.toString(); 
    }
    
}
