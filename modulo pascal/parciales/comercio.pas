{
   
   
}


program comercio;

const
	fin = 0; 

type
	rango_dia = 1..31; 
	
	clientes = record
		cod: integer;
		dia: rango_dia;
		productos: integer;
		monto: real; 
	end;
	
	// LISTA

    regLista = record
		dia: rango_dia;
		productos:integer;
		monto: real;
	end;

	lista = ^nodoLista;

    nodoLista = record
        dato: regLista;
        sig: lista;
    end;

	
	//ARBOL
	regArbol = record
		cod: integer;
		compras: lista; 
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;

// ---------------------------- inciso A -------------------------------
	
procedure lectura(var c:clientes);
	begin
		c.productos := random(30);
		if(c.productos <> fin) then begin
			c.dia := random(31) + 1;
			c.cod := random(10) + 1;
			c.monto := 150.80 + random(8000) + random(100)/100;
		end;
	end;

procedure agregarAdelante(var l: lista; c:clientes);
var
	nue: lista;
	begin
		new(nue);
		nue^.dato.dia:= c.dia;
		nue^.dato.productos:= c.productos;
		nue^.dato.monto:= c.monto; 
		nue^.sig:= l;
		l:= nue; 
	end;

procedure insertarArbol(var a:arbol; c:clientes);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato.cod:= c.cod;
			a^.dato.compras:= nil; 
			agregarAdelante(a^.dato.compras, c);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if(c.cod = a^.dato.cod) then
				agregarAdelante(a^.dato.compras, c)
			else if (c.cod < a^.dato.cod) then
				insertarArbol(a^.HI, c)
			else
				insertarArbol(a^.HD, c);
		end;
	end;

procedure cargar(var a:arbol);
var
	c:clientes;
	begin
		lectura(c);
		while(c.productos <> fin) do begin
			insertarArbol(a, c);
			lectura(c);
		end;
	end;
	
// ---------------------------- inciso B -------------------------------

procedure imprimirLista(l:lista);
	begin
		while(l <> nil) do begin
			writeln('dia: ',l^.dato.dia);
			writeln('productos: ', l^.dato.productos);
			writeln('monto: ', l^.dato.monto:0:2);
			writeln();
			l:= l^.sig; 
		end; 
	end;

procedure recorrerArbol(a:arbol; codCliente:integer);
	begin
		if(a <> nil) then begin
			if(codCliente = a^.dato.cod) then begin
				writeln('--- Compras del cliente ', codCliente, ' ---');
				imprimirLista(a^.dato.compras);
			end
			else if (codCliente < a^.dato.cod) then
				recorrerArbol(a^.HI, codCliente) 
			else
				recorrerArbol(a^.HD, codCliente); 
		end
		else begin
			writeln('El cliente con el codigo ', codCliente, ' no existe.');
		end;
	end;
	
// ---------------------------- inciso C -------------------------------
function compraConMasProduto(a:arbol; codCliente):integer
	begin
		
	end; 

var 
	a:arbol;
	
	codCliente:integer;
BEGIN
	randomize; 
	a:= nil;
	
	codCliente:= random(10) + 1;
	
	cargar(a);
	
	recorrerArbol(a, codCliente);
	
	
END.

