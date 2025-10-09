/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ej2Persona { 

    public static void main(String[] args) {
        
       GeneradorAleatorio.iniciar();
       
       int DF = 15; 
       int DL = 0; 
       
       Persona [] vector = new Persona [DF]; 
       int dni; 
       String nombre; 
       int edad = GeneradorAleatorio.generarInt(100); 
       
       while (edad != 0 && DL < DF) {
           nombre = GeneradorAleatorio.generarString(5); 
           dni = GeneradorAleatorio.generarInt(90000000) + 10000000; 
           vector[DL] = new Persona(nombre, dni, edad); 
           
           DL++;
           
           edad = GeneradorAleatorio.generarInt(100); 
       }
       
       int mayores65 = 0; 
       int menorDNI = 999999999; 
       Persona perMenorDNI = null; 
       
       for (int i=0; i<DF; i++) {
           if(vector[i].getEdad() > 65) {
               mayores65+= 1; 
           }
           if(vector[i].getDNI() < menorDNI) {
               menorDNI = vector[i].getDNI();
               perMenorDNI = vector[i]; 
           }
       }
       
       System.out.println("La cantidad de personas mayores de 65 años: " + mayores65);
       System.out.println("La representación de la persona con menor DNI: " + perMenorDNI.toString());
        
    }
}