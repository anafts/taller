/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema4;

/**
 *
 * @author anafreitas
 */
public class Ej4Sistema {

    
    public static void main(String[] args) {
        
        Estacion estacion1 = new Estacion("La Plata", -34.921 , -57.955);
        ReporteAnual sistemaAnual = new ReporteAnual(estacion1, 2021, 3); 
        
        
        Estacion estacion2 = new Estacion("Mar del Plata", -38.002, -57.556);
        ReporteMensual sistemaMensal = new ReporteMensual(estacion2, 2020, 4);
        
        sistemaAnual.registarTemperatura(2022, 2, 95.9);
        sistemaMensal.registarTemperatura(2021, 3, 167.0);
        
        
        System.out.println(sistemaAnual);
        System.out.println(sistemaMensal);
        
    }
    
}
