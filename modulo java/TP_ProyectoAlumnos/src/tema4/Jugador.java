/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;


public class Jugador extends Empleado {
    private int nroPartidos;
    private int nroGoles; 

    public Jugador(int nroPartidos, int nroGoles, String Nombre, double sueldo, int antiguedad) {
        super(Nombre, sueldo, antiguedad);
        setNroPartidos(nroPartidos);
        setNroGoles(nroGoles);
    }

    public int getNroPartidos() {
        return nroPartidos;
    }

    public void setNroPartidos(int nroPartidos) {
        this.nroPartidos = nroPartidos;
    }

    public int getNroGoles() {
        return nroGoles;
    }

    public void setNroGoles(int nroGoles) {
        this.nroGoles = nroGoles;
    }

    @Override
    public double calcularEfectividad() {
        return (double) this.getNroGoles() / this.getNroPartidos(); 
    }

    @Override
    public double calcularSueldoACobrar() {
        double sueldo = super.sueldoBase();
        if(this.calcularEfectividad() > 0.5){
            sueldo += this.getSueldo();
        }
        return sueldo;
    }
    

    @Override
    public String toString() {
        return super.toString() +  " nroPartidos: " + nroPartidos + ", nroGoles: " + nroGoles;
    }
      
}
