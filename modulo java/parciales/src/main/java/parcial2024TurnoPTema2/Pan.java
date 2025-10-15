/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2024TurnoPTema2;


public class Pan extends Componente {
    private String calidad; 

    public Pan(String calidad, String nombre, double costo) {
        super(nombre, costo);
        this.calidad = calidad;
    }

    public String getCalidad() {
        return calidad;
    }

    public void setCalidad(String calidad) {
        this.calidad = calidad;
    }

    @Override
    public double calcularCosto() {
        double incremento = 0;
        if(this.getCalidad().equals("Premium")) {
            incremento = this.getCosto() * 20 / 100; 
        }
        return this.getCosto() + incremento; 
    }

    @Override
    public String toString() {
        return "Un pan: " + super.toString() + " - " + calidad;
    }
    
    
    
}
