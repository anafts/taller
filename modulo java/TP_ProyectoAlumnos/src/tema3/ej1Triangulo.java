/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema3;

import PaqueteLectura.Lector;


public class ej1Triangulo {

    public static void main(String[] args) {
        
        double lado1, lado2, lado3; 
        String colorRelleno, colorLinea;
        
        System.out.println("Ingrese el lado 1: ");
        lado1 = Lector.leerDouble();
        
        System.out.println("Ingrese el lado 2: ");
        lado2 = Lector.leerDouble();
        
        System.out.println("Ingrese el lado 3: ");
        lado3 = Lector.leerDouble();
        
        System.out.println("Ingrese el colorRelleno: ");
        colorRelleno = Lector.leerString(); 
        
        System.out.println("Ingrese el colorLinea: ");
        colorLinea = Lector.leerString(); 
        
        Triangulo tri = new Triangulo(lado1, lado2, lado3, colorRelleno, colorLinea); 
        
        System.out.println("El perimetro del triangulo es: " + tri.calcularPerimetro());
        
        System.out.println("El area del triangulo es: " +  tri.calcularArea());
        
        
    }
    
}
