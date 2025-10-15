/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial2024TurnoK;

public class EjEmpresa {

  
    public static void main(String[] args) {
        ProgramadorLider programadorLider1 = new ProgramadorLider(5, 2, "José", 7983989, 800.000, 150, "Python");
    
        Empresa empresa1 = new Empresa("nombre-empresa1",programadorLider1, 10); 

        Programador programador1 = new Programador("Lucas", 87293984, 500.000, 100, "JavaScript"); 

        Programador programador2 = new Programador("Ana", 998293, 200.000, 50, "Python"); 
        
        empresa1.agregarProgramadores(programador2);

        System.out.println(empresa1.toString());
        
        empresa1.aumentarMonto(50.000);
        
        System.out.println(empresa1.toString());
    }
    
}
