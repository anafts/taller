/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class Hotel {
    private Habitacion [] habitacion; 
    private int DF;
    
    
    public Hotel(int DF) {
        GeneradorAleatorio.iniciar();
        
        this.DF = DF;
        habitacion = new Habitacion[DF];
        
        for (int i=0; i < DF; i++) {
            habitacion[i] = new Habitacion(GeneradorAleatorio.generarDouble(8001)+2000, false);
        }
        
    }
    
    public void ingresarCliente(Cliente cliente, int nroHabitacion) {
        habitacion[nroHabitacion - 1].setCliente(cliente);
    }
    
    public void aumentarPrecio(double precio) {
        for(int i=0; i < DF; i++) {
            habitacion[i].setCostoPorNoche(habitacion[i].getCostoPorNoche() + precio);
        }
    }

    @Override
    public String toString() {
        String mensaje = ""; 
        for(int i=0; i< DF; i++) {
            mensaje += "habitacion: " + (i + 1) + habitacion[i].toString() + "\n"; 
        }
        return mensaje; 
    }
    
    
    
    
 }


