/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2024TurnoM;


public class Alumno {
    private int DNI;
    private String nombre;
    private int polizaSeguroViaje;
    private String obraSocial; 

    public Alumno(int DNI, String nombre, int polizaSeguroViaje, String obraSocial) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.polizaSeguroViaje = polizaSeguroViaje;
        this.obraSocial = obraSocial;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPolizaSeguroViaje() {
        return polizaSeguroViaje;
    }

    public void setPolizaSeguroViaje(int polizaSeguroViaje) {
        this.polizaSeguroViaje = polizaSeguroViaje;
    }

    public String getObraSocial() {
        return obraSocial;
    }

    public void setObraSocial(String obraSocial) {
        this.obraSocial = obraSocial;
    }

    @Override
    public String toString() {
        return  DNI + "- " + nombre + " - " + polizaSeguroViaje + " - " + obraSocial;
    }
    
}
