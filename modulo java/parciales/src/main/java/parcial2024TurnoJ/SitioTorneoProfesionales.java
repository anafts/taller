/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2024TurnoJ;


public class SitioTorneoProfesionales extends SitioWeb {
    private Torneo [] torneos; 
    private int maximoTorneos;
    private int cantTorneos; 

    public SitioTorneoProfesionales(int maximoTorneos,String nombre, String direccion) {
        super(nombre, direccion);
        this.maximoTorneos = maximoTorneos;
        this.torneos = new Torneo[maximoTorneos]; // java ya inizializa todas las posiciones del vector en NULL
        this.cantTorneos = 0; 
    }
    
    public boolean agregarTorneoProfesional(Torneo torneo) {
        boolean agregar = false; 
        if(this.cantTorneos < this.maximoTorneos)  {
            this.torneos[cantTorneos] = torneo; 
            cantTorneos++;
            agregar = true;
        }
        return agregar; 
    }

    @Override
    public double cotizarSitio() {
        double total = 0; 
        for(int i=0; i < this.cantTorneos; i++) {
            total += torneos[i].recaudadoPorTorneo(); 
        }
        return this.cantTorneos * 1000 + total;
    }
    
    

    @Override
    public String toString() {
        return super.toString();
    }
}
