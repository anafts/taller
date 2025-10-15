/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2024TurnoJ;


public class Torneo {
    private String nombre;
    private String fecha; // definir con cual tipo? 
    private double montoReucadadoEnInscripciones;
    private double montoPagoEnPremios; 

    public Torneo(String nombre, String fecha, double montoReucadadoEnInscripciones, double montoPagoEnPremios) {
        this.nombre = nombre;
        this.fecha = fecha;
        this.montoReucadadoEnInscripciones = montoReucadadoEnInscripciones;
        this.montoPagoEnPremios = montoPagoEnPremios;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getMontoReucadadoEnInscripciones() {
        return montoReucadadoEnInscripciones;
    }

    public void setMontoReucadadoEnInscripciones(double montoReucadadoEnInscripciones) {
        this.montoReucadadoEnInscripciones = montoReucadadoEnInscripciones;
    }

    public double getMontoPagoEnPremios() {
        return montoPagoEnPremios;
    }

    public void setMontoPagoEnPremios(double montoPagoEnPremios) {
        this.montoPagoEnPremios = montoPagoEnPremios;
    }
    
    public double recaudadoPorTorneo() {
        return this.getMontoReucadadoEnInscripciones() - this.getMontoPagoEnPremios();
    }

    @Override
    public String toString() {
        return "Torneo{" + "nombre=" + nombre + ", fecha=" + fecha + ", montoReucadadoEnInscripciones=" + montoReucadadoEnInscripciones + ", montoPagoEnPremios=" + montoPagoEnPremios + '}';
    }
    
}
