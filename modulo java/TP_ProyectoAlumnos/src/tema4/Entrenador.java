/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

public class Entrenador extends Empleado {
    private int campeonatosGanados; 

    public Entrenador(int campeonatosGanados, String Nombre, double sueldo, int antiguedad) {
        super(Nombre, sueldo, antiguedad);
        setCampeonatosGanados(campeonatosGanados);
    }

    
    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }

    @Override
    public double calcularEfectividad() {
        return (double) this.getCampeonatosGanados() / this.getAntiguedad(); 
    }

    @Override
    public double calcularSueldoACobrar() {
        double sueldo = this.sueldoBase();
        if(this.getCampeonatosGanados() == 0){
            return sueldo;
        }
        else {
            if((this.getCampeonatosGanados() >= 1) && (this.getCampeonatosGanados() <=4 )){
                sueldo+= 5000;
            }
            else if((this.getCampeonatosGanados() >= 5) && (this.getCampeonatosGanados() <= 10)){
                sueldo += 30000;
             }
            else 
                sueldo += 50000;
        }
        return sueldo;
    }
    

    @Override
    public String toString() {
        return super.toString() + " campeonatosGanados: " + campeonatosGanados;
    }
     
}
