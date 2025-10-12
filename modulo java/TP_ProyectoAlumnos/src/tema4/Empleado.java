/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;


public abstract class Empleado {
    private String Nombre;
    private double sueldo;
    private int antiguedad; 

    public Empleado(String Nombre, double sueldo, int antiguedad) {
        setNombre(Nombre);
        setSueldo(sueldo);
        setAntiguedad(antiguedad);
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public abstract double calcularEfectividad();
    
    public abstract double calcularSueldoACobrar(); 
    
    public double sueldoBase() {
        return this.getSueldo() + ((this.getSueldo() * 0.10) * this.getAntiguedad());
    }
    
     @Override
    public String toString() {
        return "Empleado: Nombre: " + Nombre + ", sueldo a cobrar: " + calcularSueldoACobrar() + ", efetividad: " + calcularEfectividad();
    }
    
   
}
