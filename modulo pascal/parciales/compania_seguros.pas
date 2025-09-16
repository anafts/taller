{
   parcial 2024
   
}


program compania_seguros;

const
	fin = 0; 
	dimf = 2023;

type
	rango_ano = 2000..dimf;

	fechaVencimiento = record
		dia: 1..31;
		mes: 1..12;
		ano: rango_ano;
	end;
	
	poliza = record
		dni:integer;
		suma: integer;
		valor:real;
		fecha:fechaVencimiento;
	end;
	
	poliza2 = record
		dni:integer;
		suma: integer;
		valor:real;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: poliza;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodoListas;
	
	nodoListas = record
		dato: poliza2;
		sig: lista;
	end;
	
	v_lista = array[rango_ano] of lista; 
	
	
procedure leer(var p:poliza);
	begin	
		p.dni:= random(101);
		if(p.dni <> fin) then begin
			p.suma:= random(1000) + 1;
			p.valor:= random(5000) + 1;
			p.fecha.dia:=random(31) + 1;
			p.fecha.mes:=random(12) + 1;
			p.fecha.ano:=random(2023) + 2000;
		end;
	end;
	
procedure insertarArbol(var a:arbol; p:poliza);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= p;
			a^.HI:= nil;
			a^.HD:= nil; 
		end
		else begin
			if (p.suma < a^.dato.suma) then
				insertarArbol(a^.HI, p)
			else
				insertarArbol(a^.HD, p)
		end;
	end;

procedure cargarArbol(var a: arbol); 
var
	p:poliza;
	begin
		leer(p);
		while(p.dni <> fin) do begin
			insertarArbol(a, p);
			leer(p);
		end;
	end;
	
procedure inicializarVector(var v:v_lista);
var
	i:integer;
	begin
		for i:= 2000 to dimf do
			v[i] := nil;
	end; 
	
procedure insertarOrdenado(var l:lista; p:poliza);
var
    ant, act, nue: lista; 
	begin
		new(nue); 
		nue^.dato.dni := p.dni;
		nue^.dato.suma := p.suma;
		nue^.dato.valor:= p.valor;
		nue^.sig := nil; 
		
		if (l = nil) then
			l:= nue
		else begin
			act:= l; 
			
			while(act <> nil) and (act^.dato.dni < p.dni) do begin
				ant:= act;
				act:= act^.sig; 
			end; 
			
			if (act = l) then begin
				nue^.sig:= l;
				l:= nue; 
			end
			else begin
				ant^.sig:= nue;
				nue^.sig:= act; 
			end; 
		end;
	end;

procedure vectorLista(var v:v_lista; a: arbol; valor:integer); 
	begin
		if(a <> nil) then begin
			if(a^.dato.suma < valor) then 
				insertarOrdenado(v[a^.dato.fecha.ano], a^.dato); 
			vectorLista(v, a^.HI, valor);
			vectorLista(v, a^.HD, valor);
		end;
	end;

function recorrerLista(l:lista; dni:integer): integer;
var
	cantDni: integer;
	begin
		cantDni:= 0; 
		while(l <> nil) do begin
			if(l^.dato.dni = dni) then
				cantDni:= cantDni + 1; 
			l:= l^.sig; 
		end;
		recorrerLista:= cantDni; 
	end;

function verificarDNI(v:v_lista; dni:integer): integer;
var
	i, total: integer; 
	begin
		total:= 0; 
		for i:= 2000 to dimf do begin
			total := total + recorrerLista(v[i], dni);
		end;
		
		verificarDNI:= total;
	end;
	
var
	a: arbol;
	v:v_lista;
	valor,dni: integer;

BEGIN
	a:= nil; 
	
	randomize; 
	
	valor:= random(101) + 1;
	dni:= 100;
	
	inicializarVector(v); 
	
	cargarArbol(a); 
	
	vectorLista(v, a, valor);
    
    writeln('El DNI ', dni, ' tiene ', verificarDNI(v, dni), ' polizas ');
    
    readln;
	
END.

