/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio; 
 
public class ej3Persona {
    
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        Persona [] [] entrevistas = new Persona [5] [8];  // 5 dias - 8 cupos por persona
        int posF = 0;
        int posC;
        
        int dni;  
        int edad; 
        String nombre = GeneradorAleatorio.generarString(3); 
        
        while(!nombre.equals("ZZZ") && posF < 5) {
            posC = 0; 
            while(!nombre.equals("ZZZ") && posC < 8) {
                dni = GeneradorAleatorio.generarInt(90000000) + 10000000; 
                edad = GeneradorAleatorio.generarInt(100) + 1; 
                entrevistas [posF] [posC] = new Persona(nombre, dni, edad); 
                posC++;
            }
            posF++; 
            nombre = GeneradorAleatorio.generarString(3); 
        }
        
        System.out.println("end"); 
        
        for(int i=0; i < 5; i++) {
            for(int j=0; j < 8; j++) {
                if(entrevistas[i][j] != null) {
                    System.out.println("Para el dia: " + i + 1 + " y el turno:  " + j + 1 + " el nombre de la persona a entrevistar es: " + entrevistas[i][j].getNombre());
                }
            }
        }
        
    }
    
}
