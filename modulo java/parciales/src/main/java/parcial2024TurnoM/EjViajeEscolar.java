/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial2024TurnoM;

public class EjViajeEscolar {

    public static void main(String[] args) {
        
        Minibuse minibuse1 = new Minibuse("AB123CD", 20, 20); 
        Minibuse minibuse2 = new Minibuse("AB456CD", 28, 28); 
        
        ViajeEscolar viajeEscolar1 = new ViajeEscolar("Santa Maria", "25/10/2014", "Bariloche", minibuse1, minibuse2); 
        
        Alumno alumno1 = new Alumno(187383, "Ana", 67383, "ueruyerie"); 
        Alumno alumno2 = new Alumno(832903, "José", 983289, "nekjdniej"); 
        Alumno alumno3 = new Alumno(74984, "Lucas", 8398493, "nekjdniej"); 
        
        viajeEscolar1.agregarAlumno(alumno1); 
        viajeEscolar1.agregarAlumno(alumno2); 
        viajeEscolar1.agregarAlumno(alumno3); 
        
        System.out.println(viajeEscolar1.toString());
    }
    
}
