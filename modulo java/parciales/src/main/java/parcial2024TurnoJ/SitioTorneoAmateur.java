/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2024TurnoJ;

public class SitioTorneoAmateur extends SitioWeb {
    private int cantTorneoJugados;
    private int cantCliksEfetuadosEnPublicidad;

    public SitioTorneoAmateur(String nombre, String direccion) {
        super(nombre, direccion);
        this.cantTorneoJugados = 0; 
        this.cantCliksEfetuadosEnPublicidad = 0; 
    }

    public int getCantTorneoJugados() {
        return cantTorneoJugados;
    }

    public void setCantTorneoJugados(int cantTorneoJugados) {
        this.cantTorneoJugados = cantTorneoJugados;
    }

    public int getCantCliksEfetuadosEnPublicidad() {
        return cantCliksEfetuadosEnPublicidad;
    }

    public void setCantCliksEfetuadosEnPublicidad(int cantCliksEfetuadosEnPublicidad) {
        this.cantCliksEfetuadosEnPublicidad = cantCliksEfetuadosEnPublicidad;
    }

    @Override
    public double cotizarSitio() {
        return this.getCantCliksEfetuadosEnPublicidad() * 10 + this.getCantUsersRegistrados() * 50; 
    }
    
    public void registrarTorneoAmateur(int cantCliks) {
        this.setCantCliksEfetuadosEnPublicidad(this.getCantCliksEfetuadosEnPublicidad() + cantCliks);
        this.setCantTorneoJugados(this.getCantTorneoJugados() + 1);
    }
            
    @Override
    public String toString() {
        return super.toString(); 
    }
}
