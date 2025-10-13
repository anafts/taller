/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parciales2025;

public abstract class Colonia {
    private String nombreInstructor;
    private double sueldoInstructor;
    private double costoInscription;
    private int maximoInscriptos;  // DIMF - get y set?
    private Chico [] chicosInscriptos; 
    private int cantInscriptos; // DIML - get y set? 

    public Colonia(String nombreInstructor, double sueldoInstructor, double costoInscription, int maximoInscriptos) {
        this.nombreInstructor = nombreInstructor;
        this.sueldoInstructor = sueldoInstructor;
        this.costoInscription = costoInscription;
        this.maximoInscriptos = maximoInscriptos;
        this.chicosInscriptos = new Chico [maximoInscriptos];
    }
    
    // devo crear los constructores vacios?
    
    public String getNombreInstructor() {
        return nombreInstructor;
    }

    public void setNombreInstructor(String nombreInstructor) {
        this.nombreInstructor = nombreInstructor;
    }

    public double getSueldoInstructor() {
        return sueldoInstructor;
    }

    public void setSueldoInstructor(double sueldoInstructor) {
        this.sueldoInstructor = sueldoInstructor;
    }

    public double getCostoInscription() {
        return costoInscription;
    }

    public void setCostoInscription(double costoInscription) {
        this.costoInscription = costoInscription;
    }

    public int getMaximoInscriptos() {
        return maximoInscriptos;
    }

    public void setMaximoInscriptos(int maximoInscriptos) {
        this.maximoInscriptos = maximoInscriptos;
    }

    public Chico[] getChicosInscriptos() { // si no uso, lo saco?
        return chicosInscriptos;    
    }

    public void adicionarChicosInscripto(Chico chico) { // set o metodo? 
        this.chicosInscriptos[cantInscriptos] = chico; 
        cantInscriptos++; 
    }

    public int getCantInscriptos() {
        return cantInscriptos;
    }
    
    public abstract boolean agregarChico(Chico chico); 
    
    public double calcularGananciaNeta() {
        return this.getCostoInscription() - this.getSueldoInstructor(); 
    }
    
    public boolean esRentable() {
        return this.calcularGananciaNeta() > 5000000;
    }
    
    @Override
    public String toString() {
        String aux = nombreInstructor + ", " + "Cantidad de chicos inscriptos:  " + cantInscriptos + " \n"; 
        for(int i=0; i < this.getCantInscriptos(); i++) {
            aux += "Datos del chico " + (i + 1) + chicosInscriptos[i].toString(); 
        }
        return aux; 
    }
    
}
