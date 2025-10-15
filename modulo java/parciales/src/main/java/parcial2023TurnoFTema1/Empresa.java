/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2023TurnoFTema1;

public class Empresa {
    private String nombre;
    private String direccion;
    private Director director; 
    private Encargado [] sucursales; 
    private int maximoSucursales;
    private int cantSucursales; 

    public Empresa(String nombre, String direccion, Director director, int maximoSucursales) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.director = director;
        this.maximoSucursales = maximoSucursales; // DIMF
        this.cantSucursales = 0; // DIML
        this.sucursales = new Encargado [maximoSucursales]; // No inicializé porque JAVA ya inicializa todas las posiciones del vector en NULL por defecto
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

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }
    
    public void agregarEncargadoAUnaSucursalX(Encargado encargado, int nroSucursal){
        sucursales[nroSucursal] = encargado;
        cantSucursales++; 
    }

    @Override
    public String toString() {
        String aux = nombre + " " + direccion + "\n" + "Director: " + director + "\n";
        for(int i=0; i < this.maximoSucursales; i++) {
            if(sucursales[i] != null) {
               aux += sucursales[i].toString() + (i + 1) + "\n"; 
            } else {
                aux+= "No hay encargados en la sucursal nro: " + (i + 1) + "\n"; 
            }
        }
         return aux;  
    }
    
}
