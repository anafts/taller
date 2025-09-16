{
   parcial 2025
   
}


program correio;

const
	fin = 0; 
 
type

	paquetes = record
		codEnvio: integer;
		DNIemisor: integer;
		DNIreceptor: integer;
		cantObjetos: integer;
		pesoGr: integer;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: paquetes;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato:paquetes;
		sig:lista;
	end;
	

procedure leerPaquetes(var p:paquetes);
	begin
		p.codEnvio:= random(101);
		if(p.codEnvio <> fin) then begin
			p.DNIemisor:= 9 + random(5000000);
			p.DNIreceptor:= 6 + random(500000);  
			p.cantObjetos:= 1 + random(50);
			p.pesoGr:= 100 + random(1000);
		end; 
	end;

procedure insertarArbol(var a:arbol; p:paquetes); 
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= p;
			a^.HI:= nil;
			a^.HD:= nil; 
		end 
		else begin
			if (a^.dato.pesoGr < p.pesoGr) then
				insertarArbol(a^.HI, p)
			else
				insertarArbol(a^.HD, p);
		end;
	end;

procedure cargarArbol(var a:arbol);
var
	p:paquetes;
	begin
		leerPaquetes(p);
		while(p.codEnvio <> fin) do begin
			insertarArbol(a, p);
			leerPaquetes(p);
		end;
	end;

procedure agregarAdelante(var l: lista; p:paquetes);
var	
	nue: lista;
	begin
		new(nue);
		nue^.dato:= p;
		nue^.sig:= l;
		l:= nue; 
	end; 

procedure crearLista(var l: lista; a:arbol; valorA, valorB: integer); 
	begin
		if(a <> nil) then begin
			if(a^.dato.pesoGr >= valorA) and (a^.dato.pesoGr <= valorB) then
			agregarAdelante(l, a^.dato);
			crearLista(l, a^.HI,valorA, valorB);
			crearLista(l, a^.HD,valorA, valorB);
		end; 
	end;

procedure paqueteConMayorCantObjetos(a:arbol; var cantObjetos, codEnvio, DNIemisor, DNIreceptor, pesoGr: integer);
begin
    if(a <> nil) then begin
        if(a^.dato.cantObjetos > cantObjetos) then begin
			cantObjetos:= a^.dato.cantObjetos; 
			codEnvio:= a^.dato.codEnvio;
			DNIemisor:= a^.dato.DNIemisor;
			DNIreceptor:= a^.dato.DNIreceptor;
			pesoGr:= a^.dato.pesoGr;
        end;
        paqueteConMayorCantObjetos(a^.HI, cantObjetos, codEnvio, DNIemisor, DNIreceptor, pesoGr);
        paqueteConMayorCantObjetos(a^.HD, cantObjetos, codEnvio, DNIemisor, DNIreceptor, pesoGr);
    end;
end;
	
var
	a: arbol;
	l:lista;
	valorA, valorB: integer; 
	cantObjetos, codEnvio, DNIemisor, DNIreceptor, pesoGr: integer; 

BEGIN
	a:= nil;
	l:= nil; 
	
	valorA:= 100 + random(1000);
	valorB:= 100 + random(1000);
	
	cantObjetos:= 0; 
	codEnvio:= 0; 
	DNIemisor:= 0;
	DNIreceptor:= 0;
	pesoGr:= 0;
	
	cargarArbol(a); 
	
	crearLista(l, a, valorA, valorB); 
	
	paqueteConMayorCantObjetos(a, cantObjetos,codEnvio, DNIemisor, DNIreceptor, pesoGr); 
	
	writeln('Información del paquete con mayor cantidad de objetos:');
    writeln('--------------------------------------------------');
    writeln('Código de envío: ', codEnvio);
    writeln('DNI del emisor: ', DNIemisor);
    writeln('DNI del receptor: ', DNIreceptor);
    writeln('Cantidad de objetos: ', cantObjetos);
    writeln('Peso en gramos: ', pesoGr); 
    writeln('--------------------------------------------------');
	
END.

