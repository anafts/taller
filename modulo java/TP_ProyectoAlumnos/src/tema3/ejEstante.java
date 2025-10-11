/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class ejEstante {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();

        Estante estante = new Estante();

        Autor autorMujercitas = new Autor(
                "Louisa May Alcott",
                "Escritora estadounidense, ativista abolicionista e sufragista. Escreveu 'Mujercitas' (1868), inspirada em sua vida.",
                "Estados Unidos"
        );

        estante.agregarLibro(new Libro(
                "Mujercitas",
                "Roberts Brothers",
                1868,
                autorMujercitas,
                "9780199538119",
                15.50
        ));

        while (!estante.estanteLlena()) {
            estante.agregarLibro(
                    new Libro(
                            GeneradorAleatorio.generarString(20), 
                            GeneradorAleatorio.generarString(20), 
                            GeneradorAleatorio.generarInt(4),
                            new Autor(
                                    GeneradorAleatorio.generarString(20), 
                                    GeneradorAleatorio.generarString(20), 
                                    GeneradorAleatorio.generarString(20)
                            ), 
                            GeneradorAleatorio.generarString(20), 
                            GeneradorAleatorio.generarDouble(3)
                    )
            );
        }

        Libro libro = estante.devolverLibro("Mujercitas");

        if (libro != null) {
            System.out.println(libro.getPrimerAutor().getNombre());
        }
        
        System.out.println(estante.getCantLivros());
        
        Estante estante1 = new Estante(50); 

    }

}
