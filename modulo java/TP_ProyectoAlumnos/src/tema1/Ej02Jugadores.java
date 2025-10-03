
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;


public class Ej02Jugadores {
  
    public static void main(String[] args) {
        
         int DF = 2;
         
        //Paso 2: Declarar la variable vector de double 
        double [] vector;
        
        //Paso 3: Crear el vector para 15 double 
        vector = new double [DF];
        
        //Paso 4: Declarar indice y variables auxiliares a usar
         double promedio, suma = 0; 
         int cantidad = 0; 
                
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        System.out.println("Escriba las alturas de los jugadores");
        for(int i=0; i < DF; i++) {
            double altura = Lector.leerDouble(); 
            vector[i] = altura;
            suma += altura;
        }
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        promedio = suma / DF;
                
        
        System.out.println("El promedio fue de: " + String.format("%.2f", promedio));
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for(int i=0; i < DF; i++){
            if(vector[i] > promedio) {
                cantidad += 1;
            }
    }
     
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de jugadores con la altura mayor que " + String.format("%.2f", promedio) + " es " + cantidad);
    }
    
}
