/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema2;
import PaqueteLectura.Lector; 


public class ej5Partido {

    
    public static void main(String[] args) {
        
        String local, visitante;
        int golesVisitante, golesLocal; 
        
        int DF = 20; 
        int DL = 0; 
        
        int riverGanador = 0; 
        int bocaGolesTotal = 0; 
        
        Partido [] partidos = new Partido [DF]; 
        
        System.out.println("Ingrese el nombre del equipo Visitante: ");
        visitante = Lector.leerString();
        
        while(!visitante.equals("ZZZ") && DL < DF) {
            
            System.out.println("Ingrese el nro de goles del equipo Visitantes: ");
            golesVisitante = Lector.leerInt(); 
            
            System.out.println("Ingrese el nombre del equipo Local: ");
            local = Lector.leerString();
        
            System.out.println("Ingrese el nro de goles del equipo Local: ");
            golesLocal = Lector.leerInt();  
            
            partidos[DL] = new Partido(local, visitante, golesLocal, golesVisitante); 
            
            DL++; 
            
             System.out.println("Ingrese el nombre del equipo Visitante: ");
             visitante = Lector.leerString();
        }
        
        for(int i= 0; i < DL; i++) {
            System.out.println(partidos[i].toString());
            if(partidos[i].getGanador().equalsIgnoreCase("River")) {
                riverGanador++; 
            }
            if(partidos[i].getLocal().equalsIgnoreCase("Boca")) {
                bocaGolesTotal += partidos[i].getGolesLocal(); 
            }
        }
        System.out.println("La cantidad de partidos que ganó River fue: " + riverGanador);
        System.out.println("El total de goles que realizó Boca jugando de local fue: " + bocaGolesTotal);
    }
    
}
