{
   2.- Escribir un programa que:
		a. Implemente un módulo recursivo que genere y retorne una lista de números enteros “random” en el rango 100-200. Finalizar con el número 100.
		b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el mismo orden que están almacenados.
		c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en orden inverso al que están almacenados.
		d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo valor de la lista.
		e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva verdadero si dicho valor se encuentra en la lista o falso en caso contrario.
	OBS: 
}


program recursion;

const
	fin = 100;  

type
	lista = ^nodo;
	
	nodo = record
		dato: integer;
		sig: lista;
	end; 

	
procedure agregarAdelante(var l:lista; n: integer); //  Agregar adelante va a ser igual a agregar atrás y Agregar átras va a ser igual a agregar adelante
var
    nue: lista;
	begin
		new(nue);
		nue^.dato := n;
		nue^.sig := l;
		l := nue;     
	end;
		
procedure cargarLista(var l:lista);
var
	n: integer;
	begin
		n:= random(101) + 100; 
		agregarAdelante(l, n); 
		if(n <> fin) then 
			cargarLista(l); 
	end; 

procedure imprimirListaEnOrden(l: lista); // imprime los valores de la lista en el mismo orden en que fueron agregados.
	begin
		if(l <> nil) then begin
			writeln(l^.dato);  // La impresión ocurre antes de la llamada recursiva.
			imprimirListaEnOrden(l^.sig);
		end;
	end;

procedure imprimirListaInversa(l: lista); // imprime los valores de la lista en orden inverso al de su almacenamiento.
	begin
		if(l <> nil) then begin
			imprimirListaInversa(l^.sig);
			writeln(l^.dato); // La impresión se realiza en el "retorno" de la recursión, después de llegar al final de la lista.
		end;
	end;

function valorminimo(l: lista): integer;
var
    min: integer;
	begin
		if (l = nil) then
			valorminimo := 201
		else begin
			min := valorminimo(l^.sig);
			if (l^.dato < min) then
				valorminimo := l^.dato
			else
				valorminimo := min;
		end;
	end;
	
function buscar(l: lista; valor: integer): boolean;
	begin
		if l = nil then
			buscar := false
		else if l^.dato = valor then
			buscar := true
		else
			buscar := buscar(l^.sig, valor);
	end;
var
	l:lista; 
	valor: integer;

BEGIN
	l:= nil; 
	valor:= random(101) + 100; 
	randomize; 
	
	cargarLista(l); 
	
	writeln('Imprimiendo la lista en orden de almacenamiento:');
	imprimirListaEnOrden(l); 
	
	writeln('----------------------------------------------------------------------------------------------------------------------------');
	writeln('----------------------------------------------------------------------------------------------------------------------------');
	
	writeln('Imprimiendo la lista en orden inverso al de almacenamiento:');
	imprimirListaInversa(l); 
	
	writeln('El minimo valor de la lista es: ', valorminimo(l));
	
	if (buscar(l, valor)) then
        writeln('El valor: ', valor, ' se encuentra en la lista')
    else
        writeln('El valor: ', valor, ' no se encuentra en la lista');
	
END.

