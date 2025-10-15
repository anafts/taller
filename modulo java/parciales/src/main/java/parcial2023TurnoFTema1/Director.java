/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2023TurnoFTema1;


public class Director extends Empleado{
    private double montoViaticos; 

    public Director(double montoViaticos, String nombre, int DNI, int anio, double sueldo) {
        super(nombre, DNI, anio, sueldo);
        this.montoViaticos = montoViaticos;
    }

    public double getMontoViaticos() {
        return montoViaticos;
    }

    public double setMontoViaticos(double montoViaticos) {
        return this.montoViaticos = montoViaticos;
    }

    @Override
    public double sueldoACobrar() {
        return super.sueldoACobrar() + this.getMontoViaticos(); 
    }
    

    @Override
    public String toString() {
        return super.toString(); 
    }
    
    
}
