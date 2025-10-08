/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package tema2;

import PaqueteLectura.Lector; // Necessário para ler do teclado

public class Ej2Persona { 

    public static void main(String[] args) {
        
        Persona per1 = new Persona(); 
        
        System.out.println("Ingrese un Nombre: ");
        per1.setNombre(Lector.leerString());
        
        System.out.println("Ingrese un DNI: ");
        per1.setDNI(Lector.leerInt());
        
        System.out.println("Ingrese una Edad: ");
        per1.setEdad(Lector.leerInt());
        
        System.out.println(per1.toString());
        
    }
}