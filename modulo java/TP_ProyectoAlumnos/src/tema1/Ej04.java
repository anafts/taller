/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios

import PaqueteLectura.GeneradorAleatorio;

public class Ej04 {

    public static void main(String[] args) {
        
     GeneradorAleatorio.iniciar();
     
     int nroFilas = 8; 
     int nroColumnas = 4; 
	
     int [] [] matriz = new int [nroFilas] [nroColumnas]; 
     
     for(int fila=0; fila < nroFilas; fila++) {
        for(int columna=0; columna < nroColumnas; columna++) {
            matriz [fila] [columna] = 0; 
        }
     }
    
     
     int nroPiso = GeneradorAleatorio.generarInt(9) + 1; 
     
     while(nroPiso != 9) {
         int nroOficina = GeneradorAleatorio.generarInt(4) + 1;
         
         matriz [nroPiso - 1] [nroOficina - 1] += 1; 
         
         nroPiso = GeneradorAleatorio.generarInt(9) + 1; 
     }
     
     System.out.println("--- Contenido de la Matriz ---");
     for(int fila=0; fila < nroFilas; fila++) {
        for(int columna=0; columna < nroColumnas; columna++) {
            System.out.print(matriz [fila] [columna] + "\t"); 
        }
        System.out.println();
     }

    }
}
