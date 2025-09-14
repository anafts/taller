{
   ACTIVIDAD 4: Crear un archivo ProgramaListasOrdenadas.pas
	a) Implemente un módulo CargarListaOrdenada que cree una lista de
	enteros y le agregue valores aleatorios entre el 100 y 150, hasta que se
	genere el 120. Los valores dentro de la lista deben quedar ordenados
	de menor a mayor.
	
	b) Reutilice el módulo ImprimirLista que reciba una lista generada en a) e
	imprima todos los valores de la lista en el mismo orden que están
	almacenados.
	
	c) Implemente un módulo BuscarElementoOrdenado que reciba la lista
	generada en a) y un valor entero y retorne true si el valor se encuentra
	en la lista y false en caso contrario.
	d) Invocar desde el programa principal a los módulos implementados
	para crear una lista ordenada, mostrar todos sus elementos y
	determinar si un valor leído por teclado se encuentra o no en la lista.
}


program ProgramaListasOrdenadas;

const
	fin = 120;

type
	lista = ^nodo;
	
	nodo = record
		dato: integer;
		sig: lista; 
	end;
	
procedure CargarListaOrdenada(var l: lista; n: integer);
var
	ant, act, nue: lista; 
	
	begin
		
		repeat
		n := random(51) + 100;
		writeln('Número generado: ', n);
		
		new(nue);
		nue^.dato:= n; 
		nue^.sig:= nil; 
		
		if (l = nil) then
			l:= nue
		else begin
			act:= l; 
			
				while(act <> nil) and (act^.dato < n) do begin
					ant:= act;
					act:= act^.sig; 
				end;
				
				if (act = l) then begin
					nue^.sig := l;
					l:= nue; 
				end 
				
				else begin
					ant^.sig := nue; 
					nue^.sig:= act;
				end;
		end;
		until n = fin;
	end;
	
procedure ImprimirLista(l: lista); 
	begin
		while(l <> nil) do begin
			write(l^.dato);
			l:= l^.sig; 
			writeln('     '); 
		end;
	end;
	
function BuscarElementoOrdenado(l: lista; valor: integer):boolean;
var
	existe: boolean;
	
	begin
		existe:= false; 
		
		while (l <> nil) and (existe = false) do begin
			if (l^.dato = valor) then existe := true; 
			l:= l^.sig; 
		end; 
		
		BuscarElementoOrdenado:= existe; 
	end; 

var
	l:lista;
	n, valor: integer;
	
	verificar: boolean; 

BEGIN

	l:= nil;
	n:= 0; 
	valor:= 130; 
	
	randomize;
	 
	CargarListaOrdenada(l, n);
	ImprimirLista(l); 
	
	verificar := BuscarElementoOrdenado(l, valor);
	
	write(verificar); 
	
	
END.

