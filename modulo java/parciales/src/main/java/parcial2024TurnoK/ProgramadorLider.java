/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2024TurnoK;

/**
 *
 * @author anafreitas
 */
public class ProgramadorLider extends Programador {
    private int antiguedadAnios;
    private int cantProyectosDirigidos;

    public ProgramadorLider(int antiguedadAnios, int cantProyectosDirigidos, String nombre, int DNI, double sueldoBasico, int cantLineaDeCodPorHora, String lenguajeDePreferencia) {
        super(nombre, DNI, sueldoBasico, cantLineaDeCodPorHora, lenguajeDePreferencia);
        this.antiguedadAnios = antiguedadAnios;
        this.cantProyectosDirigidos = cantProyectosDirigidos;
    }

    public int getAntiguedadAnios() {
        return antiguedadAnios;
    }

    public void setAntiguedadAnios(int antiguedadAnios) {
        this.antiguedadAnios = antiguedadAnios;
    }

    public int getCantProyectosDirigidos() {
        return cantProyectosDirigidos;
    }

    public void setCantProyectosDirigidos(int cantProyectosDirigidos) {
        this.cantProyectosDirigidos = cantProyectosDirigidos;
    }
    
    // sobrecarga da função calcular bonus -> retornando a 50k se suparar 200 linhas (super) && o bonus do programador lider

    @Override
    public double calcularBonus() {        
        double total = 0;
        
        if(this.antiguedadAnios > 0) {
            total += antiguedadAnios * 10.000; 
        }
        
         if(this.cantProyectosDirigidos > 0) {
            total += cantProyectosDirigidos * 20.000;  
        }
        
        return super.calcularBonus() + total; 
    }

    @Override
    public String toString() {
        return "ProgramadorLider: " + super.toString() + "antiguedadAnios: " + antiguedadAnios + ", cantProyectosDirigidos: " + cantProyectosDirigidos;
    }
    
}
