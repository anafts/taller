{
  
   parcial 2023
   
}


program playstation;

const
	fin = 0;
	dimf = 12;

type

	rango_dia = 1..31;
	rango_mes = 1..dimf;
	
	compras = record
		videojuego: integer; 
		cliente: integer;
		dia: rango_dia;
		mes: rango_dia;
	end; 
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: compras;
		HI: arbol;
		HD: arbol;
	end;
	
	v_compras = array[rango_mes] of integer; 
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: compras;
		sig: lista;
	end;
	
	
procedure leerCompra(var c:compras);
	begin
		c.cliente:= random(100); 
		if(c.cliente <> fin) then begin
			c.videojuego:= random(20000) + 1; 
			c.dia:= random(31) + 1;
			c.mes:= random(12) + 1;
		end;
	end;

procedure insertarArbol(var a:arbol; c:compras);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= c;
			a^.HI:= nil;
			a^.HD:= nil; 
		end
		else begin
			if(c.cliente < a^.dato.cliente) then
				insertarArbol(a^.HI, c)
			else
				insertarArbol(a^.HD, c)
		end;
	end;

procedure inicializarVector(var v:v_compras);
var
	i:integer;
	begin
		for i:= 1 to dimf do
			v[i]:= 0; 
	end;

procedure insertarVector(var v:v_compras; mes:integer);
	begin
		v[mes]:= v[mes] + 1; 
	end;

procedure cargar(var a:arbol; var v:v_compras);
var
	c:compras;
	begin
		leerCompra(c); 
		while(c.cliente <> fin) do begin
			insertarArbol(a, c);
			insertarVector(v, c.mes); 
			leerCompra(c); 
		end;
	end;

procedure agregarAdelante(var l:lista; c:compras);
var
	nue:lista;
	begin
		new(nue);
		nue^.dato:= c;
		nue^.sig:= l;
		l:= nue;
	end;
	
procedure crearLista(a:arbol; var l:lista; cliente: integer); 
	begin
		if(a <> nil) then begin
			if(a^.dato.cliente = cliente) then
				agregarAdelante(l, a^.dato);
			crearLista(a^.HI, l, cliente);
			crearLista(a^.HD, l, cliente);
		end; 
	end; 

procedure ordenarVector(var v:v_compras);
var
	i,pos_ant, actual: integer; 
	begin
		for i:= 2 to dimf do begin
			actual:= v[i];
			pos_ant:= i - 1; 
			
			while(pos_ant > 0) and (v[pos_ant] < actual) do begin
				v[pos_ant + 1]:= v[pos_ant]; 
				pos_ant:= pos_ant - 1; 
			end; 
			v[pos_ant + 1]:= actual; 
		end;
	end;

////////////////////////////////////////////////////////////////////////////// para imprimir

procedure imprimirVector(v: v_compras);
var
	i: integer;
	begin
		writeln('--- Compras por mes ---');
		for i := 1 to dimf do begin
			writeln('Mes ', i, ': ', v[i], ' compras');
		end;
		writeln('-----------------------');
	end;
	
procedure imprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			imprimirArbol(a^.HI);
			writeln('Cliente: ', a^.dato.cliente, ', Dia: ', a^.dato.dia, ', Mes: ', a^.dato.mes, ', Videojuego: ', a^.dato.videojuego);
			imprimirArbol(a^.HD);
		end;
	end;

procedure imprimirLista(l: lista);
	begin
		writeln('--- Compras del cliente ---');
		while (l <> nil) do begin
			writeln('Cliente: ', l^.dato.cliente, ', Dia: ', l^.dato.dia, ', Mes: ', l^.dato.mes, ', Videojuego: ', l^.dato.videojuego);
			l := l^.sig;
		end;
		writeln('--------------------------');
	end;


var
	a: arbol;
	v:v_compras;
	l:lista;
	cliente: integer;
	
BEGIN
	randomize; 
	
	a:= nil;
	
	cliente:= random(100);
	
	inicializarVector(v); 
	
	cargar(a,v); 
	
	crearLista(a, l, cliente); 
	
	ordenarVector(v); 
	
	
	imprimirVector(v); 
	writeln('---------------------------------------------------------------------');
	imprimirArbol(a); 
	writeln('---------------------------------------------------------------------');
	imprimirLista(l);
	
	
END.

