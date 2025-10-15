/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2024TurnoK;


public class Programador {
    private String nombre;
    private int DNI;
    private double sueldoBasico;
    private int cantLineaDeCodPorHora;
    private String lenguajeDePreferencia; 

    public Programador(String nombre, int DNI, double sueldoBasico, int cantLineaDeCodPorHora, String lenguajeDePreferencia) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.sueldoBasico = sueldoBasico;
        this.cantLineaDeCodPorHora = cantLineaDeCodPorHora;
        this.lenguajeDePreferencia = lenguajeDePreferencia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public int getCantLineaDeCodPorHora() {
        return cantLineaDeCodPorHora;
    }

    public void setCantLineaDeCodPorHora(int cantLineaDeCodPorHora) {
        this.cantLineaDeCodPorHora = cantLineaDeCodPorHora;
    }

    public String getLenguajeDePreferencia() {
        return lenguajeDePreferencia;
    }

    public void setLenguajeDePreferencia(String lenguajeDePreferencia) {
        this.lenguajeDePreferencia = lenguajeDePreferencia;
    }
    
    public double calcularBonus() {
        if(this.cantLineaDeCodPorHora < 200) {
            return 0; 
        }
        return 50.000; 
    }

    @Override
    public String toString() {
        return nombre + ", DNI: " + DNI + ", sueldoBasico: " + sueldoBasico + ", cantLineaDeCodPorHora: " + cantLineaDeCodPorHora + ", lenguajeDePreferencia: " + lenguajeDePreferencia;
    }
    
    
}
