/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2025Tema2;


public class Examen {
    private int mes;
    private int anio; 
    private String modalidad; 
    private double calificacionObtenida; 
    private Alumno alumnoQueRindio; 

    public Examen(int mes, int anio, String modalidad, double calificacionObtenida, Alumno alumnoQueRindio) {
        this.mes = mes;
        this.anio = anio;
        this.modalidad = modalidad;
        this.calificacionObtenida = calificacionObtenida;
        this.alumnoQueRindio = alumnoQueRindio;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public String getModalidad() {
        return modalidad;
    }

    public void setModalidad(String modalidad) {
        this.modalidad = modalidad;
    }

    public double getCalificacionObtenida() {
        return calificacionObtenida;
    }

    public void setCalificacionObtenida(double calificacionObtenida) {
        this.calificacionObtenida = calificacionObtenida;
    }

    public Alumno getAlumnoQueRindio() {
        return alumnoQueRindio;
    }

    public void setAlumnoQueRindio(Alumno alumnoQueRindio) {
        this.alumnoQueRindio = alumnoQueRindio;
    }

    @Override
    public String toString() {
        return "Examen{" + "mes=" + mes + ", anio=" + anio + ", modalidad=" + modalidad + ", calificacionObtenida=" + calificacionObtenida + ", alumnoQueRindio=" + alumnoQueRindio + '}';
    }
    
    
}
