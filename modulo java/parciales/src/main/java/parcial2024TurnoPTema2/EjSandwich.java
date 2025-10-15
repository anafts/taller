/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial2024TurnoPTema2;


public class EjSandwich {

    
    public static void main(String[] args) {
        
        Pan pan1 = new Pan("Premium", "Frances", 2500); 
        Sandwich sandWich1 = new Sandwich("sandwich1", pan1, 3); 
        
        Ingrediente ingrediente1 = new Ingrediente('B', "ingrediente1", 500); 
        Ingrediente ingrediente2 = new Ingrediente('A', "ingrediente2", 800); 
        
        sandWich1.agregarIngrediente(ingrediente1);
        sandWich1.agregarIngrediente(ingrediente2);
        
        
        System.out.println(sandWich1.toString());
    }
    
}
