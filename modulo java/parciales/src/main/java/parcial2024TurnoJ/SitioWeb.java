/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2024TurnoJ;


public abstract class SitioWeb {
    private String nombre;
    private String direccion;
    private int cantUsersRegistrados; 

    public SitioWeb(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.cantUsersRegistrados = 0; 
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getCantUsersRegistrados() {
        return cantUsersRegistrados;
    }

    public void setCantUsersRegistrados(int cantUsersRegistrados) {
        this.cantUsersRegistrados = cantUsersRegistrados;
    }
    
    public abstract double cotizarSitio(); 

    @Override
    public String toString() {
        return nombre + ", " + direccion + ", " + cantUsersRegistrados + ", " + this.cotizarSitio();
    }
    
    
    
    
}
