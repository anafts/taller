/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios

import PaqueteLectura.GeneradorAleatorio;

public class Ej05 {

    public static void main(String[] args) {
        
     int cliente = 5; 
     int aspecto = 4; 
     
     int [] [] matriz = new int [cliente] [aspecto]; 
     
     for (int fila=0; fila < cliente; fila++) {
         for (int columna=0; columna < aspecto; columna++) {
             int puntaje = GeneradorAleatorio.generarInt(10) + 1; 
             matriz [fila] [columna] = puntaje; 
         }
     }
     
     
     for (int fila=0; fila < cliente; fila++) {
         for (int columna=0; columna < aspecto; columna++) {
            System.out.print(matriz [fila] [columna] + "\t");
         }
          System.out.println();
     }
     
     double [] vector = new double [4];
     
      for (int columna=0; columna < aspecto; columna++) {
        double promedio = 0; 
        int suma = 0; 
        for (int fila=0; fila < cliente; fila++) {
            suma += matriz [fila] [columna];
        }
         
         promedio = suma / cliente;
         vector[columna] += promedio;

         
          
     }
      
        System.out.println();
        
        for(int i=0; i<4; i++) {
            System.out.println(vector[i]);
        }
     
    }
}
