{

	parcial 
   
}


program supermercado;

const	
	fin = 0; 
	dimf = 10;
	

type
	rango_sucursal = 1..dimf; 
	
	regVentas = record
		dni: integer;
		cod: rango_sucursal;
		factura: integer;
		monto: real; 
	end;
	
	regLista = record
		factura: integer;
		monto: real; 
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: regLista;
		sig:lista;
	end;
	
	regArbol = record
		dni:integer;
		compras: lista; 
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
	v_ventas = array[rango_sucursal] of integer; 

procedure leerVentas(var v:regVentas);
	begin
		v.dni:= random(20); 
		if(v.dni <> fin) then begin
			v.cod:= random(10) + 1; 
			v.factura:= random(100)+1;
			v.monto:= random((1000)+999)/2;
		end;
	end;

procedure agregarAdelante(var l:lista; v:regVentas);
var
	nue:lista;
	begin
		new(nue);
		nue^.dato.factura:= v.factura;
		nue^.dato.monto:= v.monto; 
		nue^.sig:= l;
		l:= nue;
	end;
	
procedure insertarArbol(var a:arbol; v:regVentas);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato.dni:= v.dni;
			a^.dato.compras:= nil; 
			agregarAdelante(a^.dato.compras, v);
			a^.HI:= nil;
			a^.HD:= nil; 
		end
		else begin
			if(v.dni = a^.dato.dni) then 
				agregarAdelante(a^.dato.compras, v)
			else if (v.dni < a^.dato.dni) then
				insertarArbol(a^.HI,v)
			else
				insertarArbol(a^.HD,v);
		end;
	end;

procedure inicializarVector (var vec:v_ventas);
var
	i:integer;
	begin
		for i:= 1 to dimf do
			vec[i]:= 0; 
	end;

procedure cargarArbol(var a:arbol; vec:v_ventas);
var
	v: regVentas;
	begin
		leerVentas(v);
		while(v.dni <> fin) do begin
			insertarArbol(a, v); 
			vec[v.cod]:= vec[v.cod] + 1; 
			leerVentas(v);
		end;
	end;

function recorrerLista(l:lista; monto: real):integer;
var
	cantidad: integer;
	begin
		cantidad:= 0; 
		while(l <> nil) do begin
			if(l^.dato.monto > monto) then
				cantidad:= cantidad + 1; 
			l:= l^.sig;
		end;
		recorrerLista:= cantidad; 
	end;
	

procedure verificar(a:arbol; monto: real; dni:integer; var cantidad: integer); 
	begin
		if(a <> nil) then begin
			if (dni = a^.dato.dni) then 
				cantidad:= recorrerLista(a^.dato.compras, monto)
			else if (dni < a^.dato.dni) then
				verificar(a^.HI, monto, dni, cantidad)
			else
				verificar(a^.HD, monto, dni, cantidad);
		end;
	end;
	
procedure recorrerVec(vec:v_ventas; diml: integer; var mayoresVentas, codVentas: integer);
	begin
		if (diml <= dimf) then begin
			if(vec[diml] > mayoresVentas) then begin
				mayoresVentas:= vec[diml];
				codVentas:= diml; 
			end; 
			recorrerVec(vec, diml + 1, mayoresVentas, codVentas);
		end;
	end;
	
var
	a:arbol; 
	vec:v_ventas;
	cantidad, dni, diml, mayoresVentas, codVentas: integer;
	monto: real; 

BEGIN
	randomize; 
	
	a:= nil;
	
	cantidad:= 0; 
	dni:= random(20) + 1; 
	monto:= random((1000)+999)/2;
	
	diml:= 1;
	mayoresVentas:= 0; 
	codVentas:= 0; 
	
	inicializarVector(vec); 
	
	cargarArbol(a, vec); 
	
	
	verificar(a, monto, dni, cantidad);
	writeln('El dni: ', dni, ' hizo ', cantidad, ' compras mayores que el monto ', monto:0:2);
	
	recorrerVec(vec, diml, mayoresVentas, codVentas);
	writeln('La sucursal n°: ', codVentas, ' tiene la mayor cantidad de ventas con: ', mayoresVentas);
END.

