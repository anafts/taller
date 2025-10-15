/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2025Tema2;


public class Universidad {
    private Examen[][] examenes; 
    private int anios; 
    private int maxExamesPorAnio; 
    private int [] cantExamesPorAnio; 

    public Universidad(int maxExamesPorAnio) {
        this.anios = 26; 
        this.maxExamesPorAnio = maxExamesPorAnio;
        this.examenes = new Examen [anios] [maxExamesPorAnio];
        this.cantExamesPorAnio = new int[anios]; 
    }
    
    public void agregarNuevoExamen(Examen examen, int anio) { 
        int indice = anio - 2000;  
        examenes[indice] [this.cantExamesPorAnio[indice]]= examen; 
        this.cantExamesPorAnio[indice]++;  
    }
    
    public int examenesRendidosPorUnAlumno(String legajo, int anio) {
        int indice = anio - 2000; 
        int cont = 0; 
        for (int j = 0; j < this.cantExamesPorAnio[indice]; j++) {
            if(examenes[indice][j].getAlumnoQueRindio().getNroLegajo().equals(legajo)) {
                cont++; 
            }
        }
        return cont; 
    }
    
    public int anioConMayorCantDeExamenesRendidos(String modalidad) {
        int anio = 0;
        int cantMayorModalidade = 0; 
        for(int i=0; i < this.anios; i++) {
            int cantModalidade = 0; 
            for (int j = 0; j < this.cantExamesPorAnio[i]; j++) {
                if(examenes[i][j].getModalidad().equals(modalidad)) {
                    cantModalidade++;
                }
            }
            if(cantModalidade > cantMayorModalidade) {
                cantMayorModalidade = cantModalidade;
                anio = i + 2000;  
            }
        }
        return anio; 
    }
    
    public String devolverInformacionExamenes(double calificacionMinima) {
        String resultado = ""; 
        for (int i = 0; i < this.anios; i++) {
            for (int j = 0; j < this.cantExamesPorAnio[i]; j++) {
                if(examenes[i][j].getCalificacionObtenida() >= calificacionMinima) {
                     resultado += examenes[i][j].toString() + "\n";
                }
            }
        }
        
        return resultado; 
    }
 
    @Override
    public String toString() {
        return "Universidad{" + '}';
    }
    
}
