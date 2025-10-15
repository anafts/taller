/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2025TurnoMananaTema2;


public class Explorador extends Colonia{
    private double alquilerCarpas;

    public Explorador(double alquilerCarpas, String nombreInstructor, double sueldoInstructor, double costoInscription, int maximoInscriptos) {
        super(nombreInstructor, sueldoInstructor, costoInscription, maximoInscriptos);
        this.alquilerCarpas = alquilerCarpas;
    }

    public double getAlquilerCarpas() {
        return alquilerCarpas;
    }

    public void setAlquilerCarpas(double alquilerCarpas) {
        this.alquilerCarpas = alquilerCarpas;
    }

    @Override
    public boolean agregarChico(Chico chico) {
        adicionarChicosInscripto(chico);
        return true;
    }

    @Override
    public double calcularGananciaNeta() { 
        return super.calcularGananciaNeta() - this.getAlquilerCarpas(); 
    }
    
    @Override
    public String toString() {
        return super.toString() + " Ganancia Neta del grupo: " + this.calcularGananciaNeta();
    }
    
}
