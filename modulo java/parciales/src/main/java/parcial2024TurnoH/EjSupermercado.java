/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial2024TurnoH;

/**
 *
 * @author anafreitas
 */
public class EjSupermercado {

    public static void main(String[] args) {
        
        Supermercado supermercado1 = new Supermercado("dia", "calle 3", 1, 2); 
        
        Producto producto1 = new Producto(874,"arroz", "dia", 23, 1000); 
        Producto producto2 = new Producto(943,"frijoles", "dia", 50, 1500);
        
        supermercado1.agregarProducto(producto1);
        supermercado1.agregarProducto(producto2);
        
        
        System.out.println(supermercado1.toString());
    }
    
}
