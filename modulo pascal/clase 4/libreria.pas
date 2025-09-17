{
   fuction no imprime, es procedimiento
   la function puede devolver un rango de valores
   function devuelve un nodo, un puntero es de tipo simples
   
   
}


program libreria;

const
    fin = 0; 

type

    venta = record
        codV: integer;
        codP: integer;
        cant: integer;
        precio: real; 
    end;
    
    producto = record 
        codP: integer;
        total_ventas: integer;
        total_monto: real; 
    end;
    
    arbol = ^nodo;
    
    nodo = record
        dato: producto;
        HI: arbol;
        HD: arbol;
    end; 
    
   
// ------------------------------------- inciso A -------------------------------------------
    
procedure leerVentas(var v:venta);
	begin
		v.codV:= random (51) * 100;
		if (v.codV <> fin) then begin
			v.codP:= random (100) + 1;
			v.cant:= random(15) + 1;
			v.precio:= (100 + random (100))/2;
		end;
	end;

procedure insertarArbol(var a:arbol; v:venta);
	begin
		if(a = nil) then begin
				new(a);
				a^.dato.codP := v.codP;
				a^.dato.total_ventas := v.cant;
				a^.dato.total_monto:= v.cant * v.precio;
		end
		else begin
			if(v.codp = a^.dato.codP)then begin
				a^.dato.total_ventas := a^.dato.total_ventas + v.cant;
				a^.dato.total_monto:= a^.dato.total_monto + v.cant * v.precio;
				end
			else begin
				if(v.codp < a^.dato.codP) then 
					insertarArbol(a^.HI, v)
				else 
					insertarArbol(a^.HD, v);
			end; 
		end;
	end;
                                                              
procedure cargarArbol(var a:arbol);
var
	v:venta; 
	begin
		leerVentas(v);
		while(v.codP <> fin) do begin
			insertarArbol(a, v);
			leerVentas(v);
		end;
	end; 

// ------------------------------------- inciso B -------------------------------------------

procedure imprimir(a: arbol);
	begin
		if(a <> nil) then begin
			imprimir(a^.HI);
			 writeln('Codigo de producto: ', a^.dato.codP, ' - Unidades vendidas: ', a^.dato.total_ventas, ' - Monto total: ', a^.dato.total_monto:0:2);
			imprimir(a^.HD); 
		end; 
	end; 

// ------------------------------------- inciso C -------------------------------------------

procedure buscarMayorCantidad(a: arbol; mayorCantidad, codMayorCantidad: integer);
	begin 
		
		if(a <> nil) then begin
			if(a^.dato.total_ventas > mayorCantidad) then begin
				mayorCantidad:= a^.dato.total_ventas;
				codMayorCantidad:= a^.dato.codP; 
			end;
			buscarMayorCantidad(a^.HI, mayorCantidad, codMayorCantidad); 
			buscarMayorCantidad(a^.HD, mayorCantidad, codMayorCantidad); 
		end;
	end; 

// ------------------------------------- inciso D -------------------------------------------

function buscarMinimos(a:arbol; valor:integer):integer;
	begin
		if(a = nil) then
			buscarMinimos:= 0 
		else
			if(a^.dato.codP < valor) then
				buscarMinimos := 1 + buscarMinimos(a^.HI, valor) + buscarMinimos(a^.HD, valor) 
			else
				buscarMinimos:= buscarMinimos(a^.HI,valor); 
	end; 


// ------------------------------------- inciso E -------------------------------------------

function calcularMontoTotal(a: arbol; inf, sup: integer):real; 
	begin 
		if(a = nil) then 
			calcularMontoTotal:= 0
		else 
			if(a^.dato.codP > inf) then
				if (a^.dato.codP < sup) then 
					calcularMontoTotal := a^.dato.total_monto + calcularMontoTotal(a^.HI, inf, sup) + calcularMontoTotal(a^.HD, inf, sup)
				else
					calcularMontoTotal(a^.HI, inf, sup)
		    else
				calcularMontoTotal:= calcularMontoTotal(a^.HD, inf, sup);
	end;

var
    a: arbol;
    mayorCantidad, codMayorCantidad: integer;

BEGIN
    a:= nil;
    
    mayorCantidad:= 0; 
    codMayorCantidad:= 0; 
    
    cargarArbol(a);
    writeln('--- Conteudo do Arvore ---');
    imprimir(a);
    writeln;

    writeln('--- Producto con la mayor cantidad de ventas ---');
    buscarMayorCantidad (a, mayorCantidad, codMayorCantidad);
    writeln('Codigo de producto con mayor cantidad de ventas : ', codMayorCantidad);
    writeln;

    writeln('--- Cantidad de codigos menores que 50 ---');
    writeln('Cantidad de codigos menores que 50: ', buscarMinimos(a, 50));
    writeln;

    writeln('--- Monto total entre los codigos 10 y 90 ---');
    writeln('Monto total: ', calcularMontoTotal(a, 10, 90):0:2);
    writeln;
    
END.
