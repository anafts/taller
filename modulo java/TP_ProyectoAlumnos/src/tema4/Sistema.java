/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

public abstract class Sistema {
    private Estacion estacion; 
    private int anioInicial;
    private int nroAnios; 
    private int meses = 12; 
    private double [] [] temperaturas;

    public Sistema(Estacion estacion, int anioInicial, int nroAnios) {
        this.estacion = estacion;
        this.anioInicial = anioInicial;
        this.nroAnios = nroAnios;
        this.temperaturas = temperaturas = new double [nroAnios] [meses];
        for(int i=0; i < nroAnios; i++) {
            for(int j=0; j < meses; j++) {
                temperaturas[i] [j] = 999.9; 
            }
        }
    }

    public Estacion getEstacion() {
        return estacion;
    }

    public void setEstacion(Estacion estacion) {
        this.estacion = estacion;
    }

    public int getAnioInicial() {
        return anioInicial;
    }

    public void setAnioInicial(int anioInicial) {
        this.anioInicial = anioInicial;
    }

    public int getNroAnios() {
        return nroAnios;
    }

    public void setNroAnios(int nroAnios) {
        this.nroAnios = nroAnios;
    }

    public double obterTemperaturas(int anio, int mes) {
        return this.temperaturas [anio - anioInicial] [mes - 1]; 
    }
    
    public void registarTemperatura(int anio, int mes, double temperatura) {
        this.temperaturas [anio - this.anioInicial] [mes - 1] = temperatura;
    }
    
    public abstract String promedio(); 

    @Override
    public String toString() {
        return  estacion + "\n" + promedio();
    }
    
    
}
