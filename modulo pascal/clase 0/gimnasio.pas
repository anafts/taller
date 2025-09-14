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
		numCliente: 0..500;
		actividad: 1..5; 
	end; 
	
	lista = ^nodo;
	
	nodo = record
		dato: asistencias;
		sig: lista; 
	end;
	
	v_actividad = array[1..5] of integer; 

procedure insertarOrdenado(var l:lista; a: asistencias);
var
	ant, nue, act: lista;
	begin

		new(nue);
		nue^.dato:= a;
		nue^.sig:= nil; 
		
		if (l = nil) then // insertar en la lista vacía
			l:= nue
		else begin
			act:= l;
			while(act <> l) and (act^.dato.numCliente < a.numCliente) do begin // recorrer la lista y buscar donde insertar
				ant:= act;
				act:= act^.sig; 
			end;
			if (act = l) then begin // insertar al inicio
				nue^.sig:= l;
				l:= nue; 
			end
			else begin // insertar al medio o final 
				ant^.sig:= nue;
				nue^.sig:= act;
			end;
		end;
	end; 
procedure generarAsistencias(var a: asistencias); // generando datos por la function random 
	begin
		a.dia:= random(31 - 1 + 1) + 1; 
		a.mes:= random(12 - 1 + 1) + 1;
		a.ano:= random(2025 - 2000 + 1) + 2000;
		a.numCliente:= random(501);
		a.actividad:= random(5 - 1 + 1) + 1; 
		
	end;

procedure cargarListaOrdenada(var l:lista); // cargrando la lista 
var
	a: asistencias; 
	begin

		generarAsistencias(a);
		while(a.numCliente <> fin) do begin
			insertarOrdenado(l, a); 
			generarAsistencias(a);
		end; 
		
	end;

procedure imprimirLista(l:lista);
	begin
		while(l <> nil) do begin
			writeln(l^.dato.dia);
			writeln(l^.dato.mes);
			writeln(l^.dato.ano);
			writeln(l^.dato.numCliente);
			writeln(l^.dato.actividad);
			writeln();
			l:= l^.sig;
		end;
	end;

procedure cantidadAsistenciaPorCliente(l: lista; numCliente: integer; var cantidad: integer);
	begin
		cantidad:= 0;
		
		while (l <> nil) and (l^.dato.numCliente <= numCliente) do begin // Recorremos la lista hasta que lleguemos al final (l = nil) o hasta que el número de cliente en el nodo actual sea mayor que el que buscamos, ya que la lista está ordenada.
			if (l^.dato.numCliente = numCliente) then // Si encontramos una coincidencia, incrementamos el contador
				cantidad:= cantidad + 1;
			l:= l^.sig;  // Pasamos al siguiente nodo de la lista
		end;
	end;
	
procedure inicializarVector(var v:v_actividad);
var 	
	i: integer;
	begin
		for i:= 1 to 5 do 
			v[i] := 0; 
	end;

procedure cargarVector(l:lista; var v: v_actividad);
	begin
		while(l <> nil) do begin
			v[l^.dato.actividad]:= v[l^.dato.actividad]  + 1; 
			l:= l^.sig; 
		end;
	end;

procedure recorrerVector(v: v_actividad; var cant: integer);
var
	i: integer;
	begin
		for i:= 1  to 5 do begin
			if (cant < v[1]) then
				cant:= i;
		end;
	end; 

var
	l:lista;
	numCliente, cantidad, cant: integer; 
	v: v_actividad;
	
BEGIN
	randomize;
	numCliente:= random(500 - 1 + 1) + 1;

	cargarListaOrdenada(l);
	
	imprimirLista(l);
	
	cantidadAsistenciaPorCliente(l, numCliente, cantidad); 
	
	if (cantidad <> fin) then
		writeln('La cantidad de asistencias por cliente son: ', cantidad)
	else
		writeln('No hay este numero de cliente');
	
	
	inicializarVector(v);
	
	cargarVector(l, v); 
	
	recorrerVector(v, cant);
	
	write('la actividad con mayor cantidad de asistencias es: ', cant); 
	
END.

