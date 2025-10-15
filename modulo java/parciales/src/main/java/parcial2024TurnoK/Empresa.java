/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2024TurnoK;


public class Empresa {
    private String nombre;
    private ProgramadorLider programadorLider;
    private Programador [] programadores; 
    private int maxProgramadores;
    private int cantProgramadores; 

    public Empresa(String nombre, ProgramadorLider programadorLider, int maxProgramadores) {
        this.nombre = nombre;
        this.programadorLider = programadorLider;
        this.programadores = new Programador [maxProgramadores]; 
        this.cantProgramadores = 0; 
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public ProgramadorLider getProgramadorLider() {
        return programadorLider;
    }

    public void setProgramadorLider(ProgramadorLider programadorLider) {
        this.programadorLider = programadorLider;
    }

    public int getMaxProgramadores() {
        return maxProgramadores;
    }

    public int getCantProgramadores() {
        return cantProgramadores;
    }

    public void agregarProgramadores(Programador programador) {
         programadores[this.cantProgramadores] = programador;  
         cantProgramadores++; 
    }
    
    public double calcularMontoTotalSueldos() {
        double total = 0; 

        for(int i=0; i < this.getCantProgramadores(); i++) {
            total += programadores[i].getSueldoBasico() + programadores[i].calcularBonus(); 
        }
        
        return total; 
    }
    
    public void aumentarMonto(double monto) {
       for(int i=0; i < this.getCantProgramadores(); i++) {
           programadores[i].setSueldoBasico(programadores[i].getSueldoBasico() + monto); 
       }
    }

    @Override
    public String toString() {
        String aux = "Empresa: " + nombre + "\n" + this.getProgramadorLider().toString();
        for(int i=0; i < this.getCantProgramadores(); i++) {
            aux+= "Programador: " + (i + 1) + programadores[i].toString();
        }
        return aux; 
    }
    
    
    
    
}
