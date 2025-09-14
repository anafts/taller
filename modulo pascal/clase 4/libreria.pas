{
   fuction no imprime, es procedimiento
   la function puede devolver un rango de valores
   function devuelve un nodo, un puntero es de tipo simples
   
   
}


program libreria;

const
    fin = -1; 

type

    producto = record 
        codP: integer;
        total_ventas: integer;
        total_monto: real; 
    end;
    
    venta = record
        codV: integer;
        codP: integer;
        cant: integer;
        precio: real; 
    end;
    
    arbol = ^nodo;
    
    nodo = record
        dato: producto;
        HI: arbol;
        HD: arbol;
    end; 
    
    
procedure leerVentas(var v:venta);
begin
    read(v.codV);
    if (v.codV <> fin) then begin
        read(v.codP);
        read(v.cant);
        read(v.precio);
    end;
end;

procedure insertarArbol(var a:arbol, v:ventas);
begin
    if(a = nil) then begin
            new(a);
            a^.dato.codP := v.codP;
            a^.dato.total_ventas := v.cant;
            a^dato.total_monto:= v.cant * v.precio;
    end
    else begin
        if(v.codp = a^.dato.codP)then
            a^.dato.total_ventas := a^.dato.total_ventas + v.cant;
            a^dato.total_monto:= a^dato.total_monto + v.cant * v.precio;
        else begin
            if(v.codp < a^.dato.codP) then insertarArbol(a^.HI, v);
            else insertarArbol(a^.HD, v);
        end; 
end;
                                                              
procedure cargarArbol(var a:arbol; v:ventas);
begin
	leerVentas(v);
	while(v.codP <> fin) do begin
		insertarArbol(a, v);
		leerVentas(v);
	end;
end; 

procedure imprimir(a: arbol)
	begin
		if(a <> nil) then begin
			imprimir(a^.HI);
			write(a^.dato; 
			imprimir(a^.HD); 
		end; 
	end; 

function buscarMayorCantidad(a: arbol):integer;
var
	mayorCantidad, codMayorCantidad: integer;
	begin 
		mayorCantidad:= 0;
		codMayorCantidad:= 0;
		
		if(a <> nil) then begin
			if(a^.dato.total_ventas > mayorCantidad) then begin
				mayorCantidad:= a^.dato.total_ventas;
				codMayorCantidad:= a^.dato.codP; 
			end;
			buscarMayorCantidad(a^.HI); 
			buscarMayorCantidad(a^.HD); 
		end;
	end; 

function cantidad(a: arbol; inf, sup: integer):real;   
var
	monto: real;
	begin
		monto:= 0; 
		if(a = nil) then 
			cantidad:= 0; 
		else 
			if(a^.dato.codP > inf) then
				if (a^.dato.codP < sup) then 
					cantidad:= 1 + cantidad(a^.HI, inf, sup) + cantidad(a^.HD, inf, sup);
				else
					cantidad(a^.HI, inf, sup);
		    else
				cantidad:= cantidad(a^.HD, inf, sup);
	end;

var
    p: productos;
    v: ventas;
    a: arbol;

BEGIN
    a:= nil;
    
    
END.
