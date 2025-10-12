/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema4;

public class EjEmpleado {

    
    public static void main(String[] args) {
        Entrenador entrenador = new Entrenador(3,"José", 80000, 2024); 
        Jugador jugador = new Jugador(10, 4, "Luis", 100000, 2024); 
        
        System.out.println(entrenador.toString());
        System.out.println(jugador.toString());
        
    }
    
}
