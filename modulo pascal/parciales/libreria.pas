{
   
   parcial 2025 - turno G
   
}


program libreria;

const
	fin = 0; 
	
type
	rango_genero = 1..15; 
	
	libro = record
		ISBN:integer; 
		autor: integer;
		genero: rango_genero;
	end;
	
	// LISTAS
	
	regLista = record
		ISBN:integer; 
		genero: rango_genero;
	end;
	
	lista = ^nodoListas;
	
	nodoListas = record
		dato: regLista;
		sig: lista; 
	end;
	
	// ARBOL
	regArbol = record
		autor:integer;
		libros:lista; 
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end; 
	
	regLista2 = record
		autor:integer;
		cantidad:integer
	end;
	
	lista2 = ^nodoLista2;
	
	nodoLista2 = record
		dato:regLista2;
		sig:lista2;
	end;
	
	
// --------------------------------------------- inciso A ------------------------------------------

procedure lectura(var l:libro);
	begin
		l.ISBN:= random(100); 
		if(l.ISBN <> fin) then begin
			l.autor:= random(2000) + 1; 
			l.genero:= random(16) + 1; 
		end;
	end;
	
procedure agregarAdelante(var l:lista; li:libro);
var
	nue:lista;
	begin
		new(nue);
		nue^.dato.ISBN:= li.ISBN;
		nue^.dato.genero:= li.genero;
		nue^.sig:= l;
		l:= nue; 
	end;

procedure insertarArbol(var a:arbol; li:libro); 
	begin
		if(a = nil) then begin
			new(a);
			a^.dato.autor:= li.autor;
			a^.dato.libros:= nil;
			agregarAdelante(a^.dato.libros, li); 
			a^.HI:= nil;
			a^.HD:= nil; 
		end 
		else begin
			if(li.autor = a^.dato.autor) then
				agregarAdelante(a^.dato.libros, li)
			else if (li.autor < a^.dato.autor) then
				insertarArbol(a^.HI,li)
			else
				insertarArbol(a^.HD,li)
		end;
	end;

procedure cargar(var a:arbol);
var
	li:libro;
	begin
		lectura(li);
		while(li.ISBN <> fin) do begin
			insertarArbol(a, li);
			lectura(li);
		end;
	end;
	
// --------------------------------------------- inciso B ------------------------------------------
	
function recorrerLista(l:lista; genero: integer):integer;
var
	cantidad: integer;
	begin
		cantidad:= 0;
		while(l <> nil) do begin
			if(l^.dato.genero = genero) then
				cantidad:= cantidad + 1;
			l:= l^.sig;
		end;
		recorrerLista:= cantidad;
	end;

procedure insertarLista(var l2:lista2; autor, cantidad: integer);
var
	nue:lista2;
	begin
		new(nue);
		nue^.dato.autor:= autor;
		nue^.dato.cantidad:= cantidad;
		nue^.sig:= l2;
		l2:= nue;
	end;
	
procedure recorrerArbol(a:arbol; autor, genero: integer; var l2:lista2);
var
	cantidadLibros:integer; 
	begin
		cantidadLibros:= 0; 
		if (a <> nil) then begin
			if(a^.dato.autor >= autor) then begin
				cantidadLibros:= recorrerLista(a^.dato.libros,genero);
				
				if cantidadLibros > 0 then
					insertarLista(l2, a^.dato.autor, cantidadLibros);
			end;
			recorrerArbol(a^.HI, autor, genero, l2); 
			recorrerArbol(a^.HD, autor, genero, l2); 
		end;
	end;
	
// --------------------------------------------- inciso C ------------------------------------------

procedure autorConMasLibros(l2:lista2; var codAutor,cantidadLibros: integer);
	begin	 
		if(l2 <> nil) then begin
			if (l2^.dato.cantidad > cantidadLibros) then begin
				cantidadLibros:= l2^.dato.cantidad;
				codAutor:= l2^.dato.autor; 
			end;
			autorConMasLibros(l2^.sig, codAutor, cantidadLibros); 
		end; 
	end; 

var
	a:arbol;
	l2:lista2;
	
	autor,genero: integer; 
	
	codAutor, cantidadLibros: integer; 
BEGIN
	randomize; 
	
	a:= nil;
	l2:= nil;
	
	autor:= random(2000) + 1;
	genero:= random(16) + 1; 
	
	codAutor:= 0; 
	cantidadLibros:= 0; 
	
	cargar(a);
	
	recorrerArbol(a, autor, genero, l2); 
	
	autorConMasLibros(l2, codAutor, cantidadLibros); 
	write('El autor con el código ', codAutor, ' tiene ', cantidadLibros, ' libros'); 
	
END.

