/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2024TurnoM;


public class Minibuse {
    private String patente;
    private int capacidad;
    private Alumno [] alumnos; 
    private int maximoAlumnos;
    private int cantAlumnos;

    public Minibuse(String patente, int capacidad, int maximoAlumnos) {
        this.patente = patente;
        this.capacidad = capacidad;
        this.maximoAlumnos = maximoAlumnos;
        this.alumnos = new Alumno [maximoAlumnos]; // Java ya inicializa el vector en NULL
        this.cantAlumnos = 0;
    }
    
    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public int getCantAlumnos() {
        return cantAlumnos;
    }
    
    public void agregarAlumnos(Alumno alumno) {
        if (this.cantAlumnos < this.maximoAlumnos) {
            alumnos[this.cantAlumnos] = alumno;
            cantAlumnos++;
        }
    }
    
    public int cantAlumnosConObraSocialX(String obraSocial) {
        int cantObraSocial = 0; 
        for(int i=0; i < this.maximoAlumnos; i++) {
            if(alumnos[i].getObraSocial().equals(obraSocial)) {
                cantObraSocial += 1; 
            }
        }
        return cantObraSocial; 
    }
    
    public boolean asignarPoliza(int dni, int poliza) {
        boolean aux = false; 
        for (int i=0; i < this.cantAlumnos; i++) {
            if(alumnos[i].getDNI() == dni) {
                alumnos[i].setPolizaSeguroViaje(poliza);
                aux = true;
            }
        }
        return aux; 
    }

    @Override
    public String toString() {
        String aux = patente + " - cap: " + capacidad + "\n";
        for(int i=0; i < this.cantAlumnos; i++) {
            aux += alumnos[i].toString() + "\n"; 
        }
        
        return aux; 
    }
    
    
}
