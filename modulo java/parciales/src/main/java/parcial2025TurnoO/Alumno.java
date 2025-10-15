/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2025TurnoO;


public class Alumno {
    private String nombre;
    private int cantTareaCompletadas;
    private double sumaTotalDeNotasDeTareasCompletadas; 

    public Alumno(String nombre) {
        this.nombre = nombre;
        this.cantTareaCompletadas = 0; 
        this.sumaTotalDeNotasDeTareasCompletadas = 0; 
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantTareaCompletadas() {
        return cantTareaCompletadas;
    }

    public void setCantTareaCompletadas(int cantTareaCompletadas) {
        this.cantTareaCompletadas = cantTareaCompletadas;
    }

    public double getSumaTotalDeNotasDeTareasCompletadas() {
        return sumaTotalDeNotasDeTareasCompletadas;
    }

    public void setSumaTotalDeNotasDeTareasCompletadas(double sumaTotalDeNotasDeTareasCompletadas) {
        this.sumaTotalDeNotasDeTareasCompletadas = sumaTotalDeNotasDeTareasCompletadas;
    }

    @Override
    public String toString() {
        return "Alumno{" + "nombre=" + nombre + ", cantTareaCompletadas=" + cantTareaCompletadas + ", sumaTotalDeNotasDeTareasCompletadas=" + sumaTotalDeNotasDeTareasCompletadas + '}';
    }
     
}
