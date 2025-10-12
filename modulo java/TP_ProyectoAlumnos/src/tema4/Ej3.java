/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema4;

public class Ej3 {

    public static void main(String[] args) {
        Persona persona = new Persona("Ana", 78473934, 24); 
        Trabajador trabajador =  new Trabajador("Desarrollador", "Lucas", 28379383, 26);
        
        System.out.println(persona.toString());
        System.out.println(trabajador.toString());
    }
    
}
