/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class ej4Persona {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Persona [] [] entrevistas = new Persona [5] [8];  // 5 dias - 8 cupos por persona
        int [] vector = new int [5]; 
        int entrevistados = 0; 
        
        int dni = GeneradorAleatorio.generarInt(90000000) + 10000000;  
        int edad = GeneradorAleatorio.generarInt(100) + 1;  
        String nombre = GeneradorAleatorio.generarString(3);  
        int dia = GeneradorAleatorio.generarInt(5); 
        
        while(!nombre.equals("ZZZ") && entrevistados < 40) {
            if(vector[dia] < 8) { 
                entrevistas [dia] [vector[dia]] = new Persona(nombre, dni, edad);  
                vector[dia] += 1;  
                entrevistados++;  
                System.out.println("Inscripto: " + nombre + " en el dia " + (dia + 1) + " en el turno " + vector[dia]); 
            } else {
                System.out.println("No hay cupos en el dia " + (dia + 1));
            }
            
            dni = GeneradorAleatorio.generarInt(90000000) + 10000000;
            edad = GeneradorAleatorio.generarInt(100) + 1;
            nombre = GeneradorAleatorio.generarString(3);  
            dia = GeneradorAleatorio.generarInt(5);
        } 
        
         System.out.println("\n--- FIM DE LAS INSCRIPCIONES ---");
         System.out.println("Total de inscriptos: " + entrevistados);
         System.out.println(); 
        
        for(int i=0; i < 5; i++) {
            for(int j= 0; j < 8; j++) {
                System.out.println("el nombre de la persona a entrevistar: " + entrevistas[i][j].getNombre() + " con el nro: " + (j + 1));
            }
            System.out.println("Para el dia: " + (i + 1) + " hay " + vector[i] + " inscriptos");
            System.out.println(); 
        }
    }     
}
    
   
