/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2023TurnoFTema1;

public class Encargado extends Empleado {
    private int cantEmpleadoACargo; 

    public Encargado(int cantEmpleadoACargo, String nombre, int DNI, int anio, double sueldo) {
        super(nombre, DNI, anio, sueldo);
        this.cantEmpleadoACargo = cantEmpleadoACargo;
    }

    public int getCantEmpleadoACargo() {
        return cantEmpleadoACargo;
    }

    public void setCantEmpleadoACargo(int cantEmpleadoACargo) {
        this.cantEmpleadoACargo = cantEmpleadoACargo;
    }

    @Override
    public double sueldoACobrar() {
        return super.sueldoACobrar() + this.getCantEmpleadoACargo() * 1000;
    }
    
   
    @Override
    public String toString() {
        return super.toString();  
    }
}
