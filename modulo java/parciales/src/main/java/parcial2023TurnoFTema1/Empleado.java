/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2023TurnoFTema1;


public abstract class Empleado {
    private String nombre;
    private int DNI;
    private int anio;
    private double sueldo; 

    public Empleado(String nombre, int DNI, int anio, double sueldo) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.anio = anio;
        this.sueldo = sueldo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }
    
    public double sueldoACobrar(){ 
        double aumento = 0; 
        if(this.getAnio() > 20) {
            aumento = this.getSueldo() * 10 / 100;  
        }
        return this.getSueldo() + aumento; 
    }

    @Override
    public String toString() {
        return nombre + " " + DNI + " " + this.sueldoACobrar(); 
    }
}
