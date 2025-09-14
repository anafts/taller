{
   a) Implemente un módulo CargarLista que cree una lista de enteros y le
	agregue valores aleatorios entre el 100 y 150, hasta que se genere el
	120.
	
	b) Implemente un módulo ImprimirLista que reciba una lista generada en
	a) e imprima todos los valores de la lista en el mismo orden que están
	almacenados.
	
	c) Implemente un módulo BuscarElemento que reciba la lista generada
	en a) y un valor entero y retorne true si el valor se encuentra en la lista
	y false en caso contrario.
	
	d) Invocar desde el programa principal a los módulos implementados
	para crear una lista, mostrar todos sus elementos y determinar si un
	valor leído por teclado se encuentra o no en la lista.
}


program ProgramaListas;
const
	fin = 120; 
type
	lista = ^nodo;
	
	nodo = record
		dato: integer;
		sig: lista;
	end; 
	
procedure cargarLista(var l: lista); 
var
	valor: integer;
	nue: lista;
	begin
		valor := random(170) + 100; 
		while (valor <> fin) do begin
			new(nue);
			nue^.dato := valor;
			nue^.sig := l;
			l := nue;
			
			valor := random(170) + 100; 
		end; 
	end; 
	
procedure imprimirLista(l: lista); 
	begin
		while(l <> nil) do begin
			write(l^.dato);
			l:= l^.sig; 
			writeln('     '); 
		end;
	end;

function buscarElemento(l: lista; elem: integer): boolean;
var
	existe: boolean;
	
	begin
		existe:= false; 
		
		while (l <> nil) and (existe = false) do begin
			if (l^.dato = elem) then existe := true; 
			l:= l^.sig; 
		end; 
		
		buscarElemento := existe; 
	end; 

var
	l: lista;
	elem: integer;
	verificar: boolean; 
	
BEGIN
	elem := 130; 
	cargarLista(l); 
	imprimirLista(l);
	verificar := buscarElemento(l, elem);
	
	write(verificar); 
	
END.

