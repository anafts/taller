/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema4;


public class EjFigura {

    public static void main(String[] args) {
        Circulo circulo = new Circulo(3, "Azul", "Verde"); 
        Triangulo triangulo = new Triangulo(3, 4, 7, "Rojo", "Amarillo"); 
        
        
        
        System.out.println(circulo.toString());
        System.out.println(triangulo.toString()); 
        
        circulo.despintar();
        triangulo.despintar();
        
        System.out.println(circulo.toString());
        System.out.println(triangulo.toString()); 
    }
    
}
