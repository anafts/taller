/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2025TurnoMananaTema2;


public class Chico {
    private String nombre;
    private String telefonoResponsable;
    private boolean sabeNadar; 

    public Chico(String nombre, String telefonoResponsable, boolean sabeNadar) {
        this.nombre = nombre;
        this.telefonoResponsable = telefonoResponsable;
        this.sabeNadar = sabeNadar;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefonoResponsable() {
        return telefonoResponsable;
    }

    public void setTelefonoResponsable(String telefonoResponsable) {
        this.telefonoResponsable = telefonoResponsable;
    }

    public boolean getSabeNadar() {
        return sabeNadar;
    }

    public void setSabeNadar(boolean sabeNadar) {
        this.sabeNadar = sabeNadar;
    }


    @Override
    public String toString() {
        return " nombre: " + nombre + " telefonoResponsable: " + telefonoResponsable +  " sabeNadar: " + sabeNadar;
    }
    
}
