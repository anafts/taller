{
  a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
	Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
		i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto. Los códigos repetidos van a la derecha.
		ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener el código de producto y la cantidad total de unidades vendidas.
		iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener el código de producto y la lista de	las ventas realizadas del producto.
}


program comercio;

const

    fin = 0; 

type
	rango_fecha = 1..31;
    rango_codigo = 0..100;
    
    ventas = record 
        codP: rango_codigo;
        fecha: rango_fecha;
        cant: integer;
    end; 
    
    arbolVentas = ^nodoVentas;
    
    nodoVentas = record    
        dato: ventas;
        HI: arbolVentas;
        HD: arbolVentas;
    end;
    
    producto = record
        codP: rango_codigo;
        cant: integer;
    end;
    
    arbolProductos = ^nodoProductos;
    
    nodoProductos = record
		dato: producto;
        HI: arbolProductos;
        HD: arbolProductos;
    end;
    
  
    lista = ^nodoLista; // lista ligada para guardar las ventas de un producto
    
    nodoLista = record
        dato: ventas;
        sig: lista;
    end;

    ListaVentas = record // registro es el 'dato' que irá dentro de cada nodo del árbol contiene el código del producto y el puntero a su lista de ventas.
        codP: integer;
        l: lista;
    end;

    arbolLista = ^nodoArbolLista; // árbol binario que tiene cod y lista
    
    nodoArbolLista = record
        dato: ListaVentas; // Usa el registro anterior como dato del nodo
        HI: arbolLista;
        HD: arbolLista;
    end;
    
procedure leerVentas(var v:ventas);
	begin
		v.codP:= random(101); 
		if(v.codP <> fin) then begin
			v.fecha:= random(32);
			v.cant:= random(101);
		end;
	end;

procedure insertarArbolVentas(var a: arbolVentas; v: ventas); // por cod de producto
	begin
		if (a = nil) then begin
			new(a); 
			a^.dato:= v;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if(v.codP < a^.dato.codP) then insertarArbolVentas(a^.HI, v)
			else insertarArbolVentas(a^.HD, v); 
				
		end; 
	end; 

procedure insertarArbolProductos(var a: arbolProductos; v:ventas);
	begin
		if (a = nil) then begin		
			new(a);
			a^.dato.codP:= v.codP;
			a^.dato.cant:= v.cant;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (v.codP = a^.dato.codP) then
				a^.dato.cant:= a^.dato.cant + v.cant
			else
			if (v.codP < a^.dato.codP) then
				insertarArbolProductos(a^.HI,v)
			else
				insertarArbolProductos(a^.HD, v);
		end;
	end; 
	
procedure agregarAdelante(var l:lista; v:ventas);
var
	nue:lista;
	begin
		new(nue);
		nue^.dato:= v;
		nue^.sig:= l;
		l:= nue; 
	end;

	
procedure insertarArbolLista(var a:arbolLista; v:ventas);
	begin
		if (a = nil) then begin
			new(a);  // creamos un nuevo nodo para el producto

			a^.dato.codP := v.codP;
			a^.dato.l := nil; // Inicializamos la lista de ventas del producto

			agregarAdelante(a^.dato.l, v); // Insertamos la venta en su nueva lista

			a^.HI := nil;
			a^.HD := nil;
		end
		else begin
			if (v.codP = a^.dato.codP) then 
            agregarAdelante(a^.dato.l, v) // Si el producto ya existe, solo insertamos la venta en su lista.
        else if (v.codP < a^.dato.codP) then 
            insertarArbolLista(a^.HI, v) // Si el código es menor, vamos a la izquierda.
        else 
            insertarArbolLista(a^.HD, v); // Si el código es mayor, vamos a la derecha.
		end; 
	end;


procedure cargarArboles(var a1: arbolVentas; var a2: arbolProductos; var a3: arbolLista); 
var
	v: ventas;
begin
    leerVentas(v);
    while(v.codP <> fin) do begin
        insertarArbolVentas(a1, v);
        insertarArbolProductos(a2, v); 
        insertarArbolLista(a3, v); 
        
        leerVentas(v);
    end;
end;

procedure imprimirVentasPorFecha(a: arbolVentas; fecha: rango_fecha; var totalProductos: integer);
	begin
		if (a <> nil) then
		begin
			ImprimirVentasPorFecha(a^.HI, fecha, totalProductos);
			imprimirVentasPorFecha(a^.HD, fecha, totalProductos);

			if (a^.dato.fecha = fecha) then
				totalProductos := totalProductos + a^.dato.cant;
		end;
	end;
	
procedure imprimirCodMayorCantidad(a:arbolProductos; var cod: integer; var mayorCantidad: integer); 
	begin
		mayorCantidad:= 0; 
		if(a <> nil) then begin
			imprimirCodMayorCantidad(a^.HI, cod, mayorCantidad);
			imprimirCodMayorCantidad(a^.HD, cod, mayorCantidad); 
			
			if (a^.dato.cant > mayorCantidad) then begin
				mayorCantidad:= a^.dato.cant;
				cod:= a^.dato.codP;
			end; 
		end;
	end; 

function recorrerLista(l: lista): integer;
var
    total: integer;
	begin
		total := 0;
		while (l <> nil) do begin
			total := total + 1;
			l := l^.sig;
		end;
		recorrerLista := total;
	end;

procedure imprimirCodMayorVentas(a:arbolLista; var cod: integer; var cantVentas:integer);
var
	cantAtual: integer; 
	begin
		if (a <> nil) then begin
			cantAtual:= recorrerLista(a^.dato.l);
			if (cantAtual > cantVentas) then begin
				cantVentas := cantAtual;
				cod := a^.dato.codP;
			end;
			
			imprimirCodMayorVentas(a^.HI, cod, cantVentas);
			imprimirCodMayorVentas(a^.HD, cod, cantVentas); 
		end; 
	end; 
var
    a1: arbolVentas;
    a2: arbolProductos;
    a3: arbolLista;
    
    fecha: rango_fecha; 
    totalProductos:integer; 
    
    cod: integer; 
    mayorCantidad: integer;
    
    codLista: integer; 
    cantVentas: integer;
    
BEGIN
	randomize; 
	
    a1:= nil; 
    a2:= nil; 
    a3:= nil; 
    
    cargarArboles(a1, a2, a3); 
    
    totalProductos:= 0;
    fecha:= random(32);
    
    ImprimirVentasPorFecha(a1, fecha, totalProductos); 
    writeln('La cantidad total de productos vendidos en la fecha ', fecha, ' es: ', totalProductos);
    
    cod:= -1;
    mayorCantidad:= -1;  
    
    imprimirCodMayorCantidad(a2, cod, mayorCantidad); 
    writeln('El producto mas vendido tiene el codigo ', cod, ' con ', mayorCantidad, ' unidades');
    
    
    codLista:= -1; 
    cantVentas:= 0;
    
    imprimirCodMayorVentas(a3, codLista, cantVentas);
    writeln('El codigo del producto mas vendido es: ' ,codLista, ' con ' ,cantVentas, ' ventas');
    
END.
