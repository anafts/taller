/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2024TurnoM;


public class ViajeEscolar {
    private String colegio; 
    private String fecha;
    private String destino;
    private Minibuse minibuse1; 
    private Minibuse minibuse2; 

    public ViajeEscolar(String colegio, String fecha, String destino, Minibuse minibuse1, Minibuse minibuse2) {
        this.colegio = colegio;
        this.fecha = fecha;
        this.destino = destino;
        this.minibuse1 = minibuse1;
        this.minibuse2 = minibuse2;
    }

    public String getColegio() {
        return colegio;
    }

    public void setColegio(String colegio) {
        this.colegio = colegio;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public Minibuse getMinibuse1() {
        return minibuse1;
    }

    public void setMinibuse1(Minibuse minibuse1) {
        this.minibuse1 = minibuse1;
    }

    public Minibuse getMinibuse2() {
        return minibuse2;
    }

    public void setMinibuse2(Minibuse minibuse2) {
        this.minibuse2 = minibuse2;
    }
    
    public String agregarAlumno(Alumno alumno) {
        String patente;
        if(this.getMinibuse1().getCantAlumnos() <= this.getMinibuse2().getCantAlumnos()) {
            this.getMinibuse1().agregarAlumnos(alumno);
            patente = this.getMinibuse1().getPatente();
        } else {
            this.getMinibuse2().agregarAlumnos(alumno);
            patente = this.getMinibuse2().getPatente();
        }
        return patente; 
    }
    
    public void asignarPoliza(int dni, int poliza) {
        if(!this.getMinibuse1().asignarPoliza(dni, poliza)) {
            this.getMinibuse2().asignarPoliza(dni, poliza); 
        }
    }
    

    @Override
    public String toString() {
        String aux = "Viaje Escolar: " + " fecha: " + fecha + ", Cantidad de alumnos total: " +  (this.getMinibuse1().getCantAlumnos() + this.getMinibuse2().getCantAlumnos())+  "\n" + "Minibus1: " + this.getMinibuse1().toString() + "\n" + "Minibus2: " + this.getMinibuse2().toString();
        return aux; 
    }
    
    
}
