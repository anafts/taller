/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2025TurnoO;

public abstract class Curso {
    private String nombre;
    private double costoInscription; 
    private String fechaDeComienzo;
    private Alumno [] alumnos; 
    private int maxAlumnos;
    private int cantAlumnos; 

    public Curso(String nombre, double costoInscription, String fechaDeComienzo, int maxAlumnos) {
        this.nombre = nombre;
        this.costoInscription = costoInscription;
        this.fechaDeComienzo = fechaDeComienzo;
        this.maxAlumnos = maxAlumnos;
        this.alumnos = new Alumno [maxAlumnos]; // Java ya inicializa todas las posiciones del vector en NULL por defecto;
        this.cantAlumnos = 0; 
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getCostoInscription() {
        return costoInscription;
    }

    public void setCostoInscription(double costoInscription) {
        this.costoInscription = costoInscription;
    }

    public String getFechaDeComienzo() {
        return fechaDeComienzo;
    }

    public void setFechaDeComienzo(String fechaDeComienzo) {
        this.fechaDeComienzo = fechaDeComienzo;
    }

    public int getCantAlumnos() {
        return cantAlumnos;
    }

    public void setCantAlumnos(int cantAlumnos) {
        this.cantAlumnos = cantAlumnos;
    }

    public void setAlumnos(Alumno[] alumnos) {
        this.alumnos = alumnos;
    }

    
    public int agregarAlumno(Alumno alumno) {
        alumnos[this.cantAlumnos] = alumno; 
        cantAlumnos++; 
        return this.cantAlumnos + 1; 
    }
    
    public Alumno obtenerAlumno(int valorA) {
        return alumnos[valorA - 1]; 
    }

    public void actualizarRendimiento(String nombre, int nota){
        for(int i=0; i < this.cantAlumnos; i++) {
            if(alumnos[i].getNombre().equals(nombre)) {
                alumnos[i].setCantTareaCompletadas(alumnos[i].getCantTareaCompletadas() + 1);
                alumnos[i].setSumaTotalDeNotasDeTareasCompletadas(alumnos[i].getSumaTotalDeNotasDeTareasCompletadas() + nota);
            }
        }
    }
    
    public Alumno obterAluno(int pos) {
        return this.alumnos[pos];
    }
    
    public abstract Alumno calcularMejorDesempeno(); 
    
    @Override
    public String toString() {
         String aux = nombre + ", costo de Inscription: " + costoInscription + ", fecha de comienzo: " + fechaDeComienzo;
        
         return aux + "\n" + calcularMejorDesempeno(); 
    }
    
}
