/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

public class ReporteMensual extends Sistema {
    
    private String[] meses = new String[]{"Enero", "Febrero", "Marzo", "Abril", "Mayo", 
                                          "Junio", "Julio", "Agosto", "Septiembre",
                                          "Octubre", "Noviembre", "Diciembre"};

    public ReporteMensual(Estacion estacion, int anioInicial, int nroAnios) {
        super(estacion, anioInicial, nroAnios);
    }

    @Override
    public String promedio() {
        String aux = "";
        double total; 
        for(int j=0; j < 12; j++) {
            total = 0; 
            for(int i=0; i < this.getNroAnios(); i++) {
                total += this.obterTemperaturas(i + this.getAnioInicial(), j + 1);
            }
            aux += "- " + this.meses[j] + ": " + Math.round((total / this.getNroAnios()) * 100) / 100.0 + "°C \n"; 
        }
        return aux; 
    }
    
      @Override
    public String toString() {
        return super.toString();
    }
    
}
