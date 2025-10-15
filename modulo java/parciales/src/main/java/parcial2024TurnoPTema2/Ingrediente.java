/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2024TurnoPTema2;


public class Ingrediente extends Componente {
    private char grupo; 

    public Ingrediente(char grupo, String nombre, double costo) {
        super(nombre, costo);
        this.grupo = grupo;
    }

    public char getGrupo() {
        return grupo;
    }

    public void setGrupo(char grupo) {
        this.grupo = grupo;
    }

    @Override
    public double calcularCosto() {
        double incremento = 0;
        if(this.getGrupo() == 'B') {
            incremento = this.getCosto() * 10 / 100; 
        }
        return this.getCosto() + incremento; 
    }
  
     @Override
    public String toString() {
        return "Un ingrediente: " + super.toString() + " - " + grupo;
    }
    
    
}
