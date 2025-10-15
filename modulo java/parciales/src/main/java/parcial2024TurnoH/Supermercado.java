/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2024TurnoH;

public class Supermercado {
    private String nombre;
    private String direccion;
    private Producto [] [] gondola; // ni get ni set
    
    private int maximoGondola; // ni get ni set
    private int maximoEstante; 
    
    private int cantGondola;
    private int cantEstante; // solo get o no

    public Supermercado(String nombre, String direccion, int maximoGondola, int maximoEstante) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.gondola = new Producto [maximoGondola] [maximoEstante]; // Java ya inicializa la matriz en NULL por defecto
        
        this.maximoGondola = maximoGondola;
        this.maximoEstante = maximoEstante;
        
        this.cantGondola = 0; 
        this.cantEstante =  0; 
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

    public int getMaximoGondola() {
        return maximoGondola;
    }

    public int getMaximoEstante() {
        return maximoEstante;
    }
    
    
    public void agregarProducto(Producto producto) {
        if (this.cantGondola < this.maximoGondola) {
            this.gondola[this.cantGondola][this.cantEstante] = producto;
            this.cantEstante++;
        }

        if (this.cantEstante >= this.maximoEstante) {
            this.cantEstante = 0;
            this.cantGondola++;
        }
    }
     
     public String exhibirProducto(String marca, int nroGondola) {
         String aux = ""; 
         for(int j=0; j < this.maximoEstante; j++) {
             if(gondola[nroGondola - 1] [j].getMarca().equals(marca)) {
                 aux += gondola[nroGondola - 1] [j].toString(); 
             }
         }
         return aux;
     }
     
     public int gondolaConMayorCantTotalUniVendidas() {
         int mayorCantUnidade = 0; 
         int valorGondola = 0; 
         
         for(int i=0; i < this.maximoGondola; i++) {
             for(int j=0; j < this.maximoEstante; j++) {
                 if(gondola[i][j].getCantUnidades() > mayorCantUnidade) {
                    mayorCantUnidade = gondola[i][j].getCantUnidades();
                    valorGondola = j; 
                 }
             }
         }
         return valorGondola; 
     }

    @Override
    public String toString() {
        String aux = "Supermercado: " + nombre + "; " + direccion + "\n"; 
        for(int i=0; i < this.maximoGondola; i++) {
             aux+= "Gondola " + (i + 1) + ": \n"; 
             for(int j=0; j < this.maximoEstante; j++) {
                 aux += "Estante " + (j + 1) + ": " + gondola[i][j].toString(); 
             }
        }
        return aux;
    }
     
     
        
    
}
