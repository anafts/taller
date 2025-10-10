/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;


public class Producto {
// --------------------------  DECLARACIÓN DEL ESTADO  -------------------------- 
    // Anteponer a la declaración la palabra *private* para lograr encapsulamiento (ocultamiento de la información).
    // Las v.i.s. privadas pueden ser accedidas sólo dentro de la clase que las declara
    private String nombre;
    private double precio; 
    private String description = "sin description"; // En la declaración del dato se puede dar un valor inicial (inicialización explícita).
    // Los datos correspondientes al estado toman un valor por defecto cuando no se inicializan explícitamente. (numéricos => 0; boolean => false; char => ''; objetos => null)
    private Fabrica fabricante; 
    
    
    // --------------------------  DECLARACIÓN DEL COMPORTAMIENTO  -------------------------- 
    // crear los métodos - pueden ser público o privado (si uso internamente y no quiero que todos objtos lo use
    // public: indica que el método forma parte de la interfaz.
    // TipoRetorno: tipo de dato primitivo / nombre de clase / void (no retorna dato).
     public Producto(String unNombre, String unaDescription, double unPrecio, Fabrica unFabricante) {
        nombre = unNombre;
        description = unaDescription;
        precio = unPrecio;
        fabricante = unFabricante;
    }
     
     public Producto(String unNombre) {
        nombre = unNombre;
    }
    
    public Producto() {
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public boolean esCaro(double valor) {
        return this.precio > valor;
    }
    
}
