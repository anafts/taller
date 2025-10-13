/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

public class ReporteAnual extends Sistema {

    public ReporteAnual(Estacion estacion, int anioInicial, int nroAnios) {
        super(estacion, anioInicial, nroAnios);
    }

    @Override
    public String promedio() {
        String aux = ""; 
        double total = 0; 
        for(int i=0; i < this.getNroAnios(); i++) {
            for(int j=0; j < 12; j++) {
                total += this.obterTemperaturas(i + this.getAnioInicial(), j + 1);
            }
            aux += " Año " + (i + this.getAnioInicial()) + ": " + Math.round((total/12) * 100) / 100.0 + "°C \n"; 
        }
        return aux;
    }

    @Override
    public String toString() {
        return super.toString();
    }
    
    
}
