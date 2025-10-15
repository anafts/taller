/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2025TurnoMananaTema2;


public class Nadador extends Colonia {
    private String nombreBanero;
    private double sueldoBanero; 

    public Nadador(String nombreBanero, double sueldoBanero, String nombreInstructor, double sueldoInstructor, double costoInscription, int maximoInscriptos) {
        super(nombreInstructor, sueldoInstructor, costoInscription, maximoInscriptos);
        this.nombreBanero = nombreBanero;
        this.sueldoBanero = sueldoBanero;
    }
    
    public String getNombreBanero() {
        return nombreBanero;
    }

    public void setNombreBanero(String nombreBanero) {
        this.nombreBanero = nombreBanero;
    }

    public double getSueldoBanero() {
        return sueldoBanero;
    }

    public void setSueldoBanero(double sueldoBanero) {
        this.sueldoBanero = sueldoBanero;
    }

    @Override
    public boolean agregarChico(Chico chico) {
        if(chico.getSabeNadar()){
            adicionarChicosInscripto(chico);
            return true;
        }
        
        return false;
    }

    @Override
    public double calcularGananciaNeta() { 
        return super.calcularGananciaNeta() - this.getSueldoBanero(); 
    }

    @Override
    public String toString() {
        return super.toString() + " Ganancia Neta del grupo: " + this.calcularGananciaNeta();
    }
    
    
}
