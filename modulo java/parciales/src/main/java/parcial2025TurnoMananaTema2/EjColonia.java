/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial2025TurnoMananaTema2;

public class EjColonia {

    public static void main(String[] args) {
        
       Nadador nadador1 = new Nadador("José", 200.000, "Julio", 100.000, 500.000, 50);
       Nadador nadador2 = new Nadador("José", 200.000, "Julio", 100.000, 500.000, 50);
       Nadador nadador3 = new Nadador("José", 200.000, "Julio", 100.000, 500.000, 50);
       
       Explorador explorador1 = new Explorador(100.000, "Maria", 700.000, 70.000, 50);
       Explorador explorador2 = new Explorador(100.000, "Maria", 700.000, 70.000, 50);
       
       
       Chico chico1 = new Chico("Ana", "273982884", false); 
       Chico chico2 = new Chico("Alice", "849848399", true); 
       Chico chico3 = new Chico("Lucas", "983264864", true); 
       Chico chico4 = new Chico("Joaquin", "23934385", false); 
       Chico chico5 = new Chico("Agus", "538739239", true); 
       
       
       nadador1.adicionarChicosInscripto(chico1);
       nadador1.adicionarChicosInscripto(chico2);
       nadador1.adicionarChicosInscripto(chico3);
       
       explorador1.adicionarChicosInscripto(chico4);
       explorador1.adicionarChicosInscripto(chico5);
       
       System.out.println(nadador1.toString());
       System.out.println(explorador1.toString());
       System.out.println("Nadador es rentable " + nadador1.esRentable());
       System.out.println("Explorador es rentable " + explorador1.esRentable());
    }
    
}
