/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema3;

import PaqueteLectura.Lector; 


public class EjCirculo {

    public static void main(String[] args) {
        Circulo circulo;
        double radio;
        String colorRelleno, colorLinea;
        
        System.out.println("Ingrese el radio: ");
        radio = Lector.leerDouble();
        
        System.out.println("Ingrese el color Relleno: ");
        colorRelleno = Lector.leerString();
        
        System.out.println("Ingrese el color Linea: ");
        colorLinea = Lector.leerString();
        
        circulo = new Circulo(radio, colorRelleno ,colorLinea); 
        
        System.out.println("El perimetro del circulo es : " + circulo.calcularPerimetro());
        System.out.println("El area del circulo es : " + circulo.calcularArea());
        
       
    }
    
}
