/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial2024TurnoJ;


public class EjSitioWeb {

    public static void main(String[] args) {
       SitioTorneoAmateur torneoAmateur1 = new SitioTorneoAmateur("iurjgr", "calle 50");
       SitioTorneoProfesionales torneoProfesionales1 = new SitioTorneoProfesionales(20, "ksjdas", "calle 40");
       
       Torneo torneo1 = new Torneo("torneo1", "20/07/2025", 800.000, 500.000); 
       Torneo torneo2 = new Torneo("torneo2", "25/09/2025", 900.000, 700.000);
       
       torneoAmateur1.registrarTorneoAmateur(50);
       torneoProfesionales1.agregarTorneoProfesional(torneo1);
       torneoProfesionales1.agregarTorneoProfesional(torneo2); 
       
       System.out.println(torneoAmateur1.toString());
       System.out.println(torneoProfesionales1.toString()); 
        
    }
    
}
