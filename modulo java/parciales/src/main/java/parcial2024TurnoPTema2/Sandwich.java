/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2024TurnoPTema2;

public class Sandwich {
    private String nombre;
    private Pan pan; 
    private Ingrediente [] ingredientes; 
    private int maxIngredientes;
    private int cantIngredientes; 

    public Sandwich(String nombre, Pan pan, int maxIngredientes) {
        this.nombre = nombre;
        this.pan = pan;
        this.maxIngredientes = maxIngredientes;
        this.ingredientes = new Ingrediente[maxIngredientes]; // Java ya inicializa en NULL todas las posiciones del vectores
        this.cantIngredientes = 0; 
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Pan getPan() {
        return pan;
    }

    public void setPan(Pan pan) {
        this.pan = pan;
    }
    
    public void agregarIngrediente(Ingrediente ingrediente) {
        this.ingredientes[this.cantIngredientes] = ingrediente;
        cantIngredientes++; 
    }

    @Override
    public String toString() {
        String aux = nombre + "\n" + pan.toString() + " - " +  this.cantIngredientes + "\n";
        for(int i=0; i < this.cantIngredientes; i++) {
            aux += ingredientes[i].toString() + "\n"; 
        }
        return aux; 
    }
    
}
