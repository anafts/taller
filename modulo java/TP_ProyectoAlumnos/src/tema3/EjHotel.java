/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema3;

public class EjHotel {

  
    public static void main(String[] args) {
        
        Hotel hotel = new Hotel(10);
        
        Cliente cliente1 = new Cliente("lucas chato", 2872873, 80); 
        Cliente cliente2 = new Cliente("Luna", 987237, 3); 
        Cliente cliente3 = new Cliente("Boto", 9732843, 10); 
        
        hotel.ingresarCliente(cliente1, 3);
        hotel.ingresarCliente(cliente2, 5);
        hotel.ingresarCliente(cliente3, 7);
        
        hotel.aumentarPrecio(10000);
        
        
        System.out.println(hotel);
    }
    
}
