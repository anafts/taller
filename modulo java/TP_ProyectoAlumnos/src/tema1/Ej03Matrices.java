/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio  
        GeneradorAleatorio.iniciar();
        int DF = 5; 
            
	 
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [] [] matriz = new int [DF] [DF]; 
        
        for(int fila=0; fila < DF; fila++) {
            for(int columna=0; columna < DF; columna++) {
                int nroAleatorios = GeneradorAleatorio.generarInt(31);
                matriz [fila][columna] = nroAleatorios; 
            }
        }
    
        //Paso 4. mostrar el contenido de la matriz en consola
        System.out.println("--- Contenido de la Matriz ---");
        for(int fila=0; fila < DF; fila++) {
            for(int columna=0; columna < DF; columna++) {
                System.out.print(matriz[fila] [columna] + "\t");
            }
            System.out.println();
        }
          
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int sumaFila1 = 0;
        int fila1 = 1; 
        
        for(int columna=0; columna < DF; columna++) {
            sumaFila1 += matriz[fila1] [columna]; 
        }
         System.out.println();
         System.out.println("La suma de los elementos de la fila 1 es: " + sumaFila1);
    
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        // Luego, imprima el vector.
        int [] vector = new int [DF];
        
        for(int fila=0; fila < DF; fila++) {
            int sum = 0; 
            for(int columna=0; columna < DF; columna++) {
                sum += matriz[fila] [columna]; 
            }
            vector[fila] = sum; 
        }
        
        System.out.println();
        
        for(int i=0; i < DF; i++) {
            System.out.println(vector[i]);
        }

        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println();
        System.out.println("Ingrese un número: "); 
        
        int valor = Lector.leerInt();
        int nroFila = 0;
        int nroColumna = 0; 
        boolean buscar = false; 
        
        for(int fila=0; fila < DF && !buscar; fila++) {
            for(int columna=0; columna < DF; columna++) {
               if (valor == matriz[fila] [columna]) { 
                   buscar = true; 
                   nroFila = fila;
                   nroColumna = columna; 
                   break; 
               }
            }
        }
        
        if (buscar == true){
            System.out.println("Se encontró el elemento: " + valor + " en la fila nro: " + nroFila + " y en la columna nro: " + nroColumna); 
        } else {
            System.out.println("No se encontró el elemento"); 
        }

    }
}
