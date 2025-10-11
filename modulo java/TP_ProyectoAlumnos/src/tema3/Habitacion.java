/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

public class Habitacion {
    private double costoPorNoche;
    private boolean estaOcupada = false; 
    private Cliente cliente; 
    
    
    public Habitacion(double costoPorNoche, boolean estaOcupada) {
        this.costoPorNoche = costoPorNoche;
        this.estaOcupada = estaOcupada; 
    }
    
   public void setCliente(Cliente cliente) {
       this.cliente = cliente; 
       estaOcupada = true; 
   }

    public double getCostoPorNoche() {
        return costoPorNoche;
    }

    public void setCostoPorNoche(double costoPorNoche) {
        this.costoPorNoche = costoPorNoche;
    }
    
    public String toString() {
        if(!estaOcupada) {
            return " costo por noche: " + costoPorNoche + " - libre"; 
        }
        return " costo por noche: " + costoPorNoche + " - ocupada por el cliente: " + cliente.toString(); 
    }
   
    
}
