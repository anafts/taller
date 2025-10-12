/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

public class Circulo extends Figura {
    private double radio;

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        setRadio(radio); 
    }
    

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    @Override
    public double calcularArea() {
        return Math.PI * (this.radio * this.radio);
    }

    @Override
    public double calcularPerimetro() {
        return  2 * (Math.PI * this.radio);
    }
    
     @Override
    public String toString() {
        return super.toString() + "Circulo{" + "radio=" + getRadio() + '}';
    }
    
    
}
