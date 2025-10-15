/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2025TurnoO;

public class CursoAvanzado extends Curso {
    private String descripcion; 

    public CursoAvanzado(String descripcion, String nombre, double costoInscription, String fechaDeComienzo, int maxAlumnos) {
        super(nombre, costoInscription, fechaDeComienzo, maxAlumnos);
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public Alumno calcularMejorDesempeno() {
        double mejor = 0; 
        Alumno mejorAlumno = null; 
        for(int i=0; i < this.getCantAlumnos(); i++) {
            Alumno alumno = this.obterAluno(i);
            if(alumno.getSumaTotalDeNotasDeTareasCompletadas() / alumno.getCantTareaCompletadas() > mejor) {
                mejor = alumno.getSumaTotalDeNotasDeTareasCompletadas() / alumno.getCantTareaCompletadas();
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
