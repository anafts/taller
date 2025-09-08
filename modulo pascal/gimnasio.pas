{
  ACTIVIDAD 5: Crear un archivo gimnasio.pas
	Un gimnasio necesita procesar las asistencias de sus clientes. Cada
	asistencia tiene día, mes, año, número de cliente (entre 1 y 500) y la
	actividad realizada (valor entre 1 y 5).
	
	a) Implemente un módulo que retorne una lista de asistencias de clientes
	un gimnasio. Las asistencias dentro de la lista deben quedar ordenadas de
	menor a mayor por número de cliente. Generar aleatoriamente los valores
	hasta generar un valor cero para el número de cliente.
	
	b) Implemente un módulo que reciba la lista generada en a) e imprima
	todos los valores de la lista en el mismo orden que están almacenados.
	c) Implemente un módulo que reciba la lista generada en a) y un número
	de cliente y retorne la cantidad de asistencias del cliente recibido. Mostrar
	el resultado desde el programa principal.
	
	d) Implemente un módulo que reciba la lista generada en a) y retorne la
	actividad con mayor cantidad de asistencias. Mostrar el resultado desde el
	programa principal
}


program gimnasio;

const 
	fin = 0; 
type

	asistencias = record
		dia: 1..31;
		mes: 1..12;
		ano: integer;
		numero: 1..500;
		actividad: 1..5; 
	end; 
	
	lista = ^nodo;
	
	nodo = record
		dato: asistencias;
		sig: lista; 
	end;


BEGIN
	
	
END.

