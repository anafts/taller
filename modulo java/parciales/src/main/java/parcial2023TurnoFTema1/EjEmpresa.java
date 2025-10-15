/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial2023TurnoFTema1;


public class EjEmpresa {

    
    public static void main(String[] args) {
        
        Director director1 = new Director(5.0, "José", 648499483, 10, 500.000); 
        Empresa empresa1 = new Empresa("Mercado Libre", "calle 12", director1, 20); 
        
        Encargado encargado1 = new Encargado(10, "Maria", 6832874, 5, 200.000);
        Encargado encargado2 = new Encargado(10, "Mario", 648434, 10, 200.000);
        
        empresa1.agregarEncargadoAUnaSucursalX(encargado1, 5);
        empresa1.agregarEncargadoAUnaSucursalX(encargado2, 2);
        
        System.out.println(empresa1.toString());
    }
    
}
