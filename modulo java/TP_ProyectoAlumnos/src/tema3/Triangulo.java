/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema3;

/**
 *
 * @author anafreitas
 */
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea; 
    
    public Triangulo(double unlado1, double unlado2, double unlado3, String unColorRelleno, String unColorLinea) {
        lado1 = unlado1;
        lado2 = unlado2;
        lado3 = unlado3;
        colorRelleno = unColorRelleno;
        colorLinea = unColorLinea; 
    }
    
    public Triangulo() {
        
    }
    
    public double getLado1() {
        return lado1; 
    }
    
    public double getLado2() {
        return lado2;
    }
    
    public double getLado3() {
        return lado3;
    }
    
    public void setLado1(double lado1) {
        this.lado1 = lado1; 
    }
    
    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }
    
    public void setLado3(double lado3) {
        this.lado3 = lado3; 
    }
    
    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    
    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea; 
    }
    
    public double calcularPerimetro() { 
        return this.lado1 + this.lado2 + this.lado3; 
        
    }
    
    public double calcularArea() {
        double s = (lado1 + lado2 + lado3) / 2; 
        return Math.sqrt(s*(s-this.lado1)*(s-this.lado2)*(s-this.lado3));
    }
}
