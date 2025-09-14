{Escribir un programa que:
 a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
 código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
 producto 0. Un producto puede estar en más de una venta. Se pide:
 
	i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
	producto.
	
	ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
	código de producto. Cada nodo del árbol debe contener el código de producto y la cantidad total de unidades vendida.
	
	iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
	código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
	las ventas realizadas del producto.
	Nota: El módulo debe retornar TRES árboles.
	
	 b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.
	 
	 c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto
	 
	 d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto con mayor cantidad de ventas.}

program comercio;
type
	Rdia = 1..31;
	Rmes = 1..12;
	Tfecha = record
		dia : Rdia;
		mes : Rmes;
	end;
	Tventas = record
		codigo : integer;
		fecha : Tfecha;
		cantUni : integer;
	end;
	Tproducto = record
		codigo : integer;
		totalUnidades : integer;
	end;
	Lventas = ^nLista;
		nLista = record
			dato : Tventas;
			sig : Lventas;
		end;
	aTotales = ^nTotal;
		nTotal = record
			dato : Tproducto;
			HI : aTotales;
			HD : aTotales;
		end;
	aVentas = ^nVentas;
		nVentas = record
			dato : Lventas;
			HI : aVentas;
			HD : aVentas;
		end;
	arbol = ^nodo;
		nodo = record
			dato : Tventas;
			HI : arbol;
			HD : arbol;
		end;
	//~ MODULO I, II E III
	procedure LeerVentas (var v : Tventas);
	begin
		v.codigo := random(10);
		v.fecha.dia := random(31);
		v.fecha.mes := random(12);
		v.cantUni := random(100);
	end;
	procedure InsertarTotales(var a : aTotales ; v : Tventas);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato.codigo := v.codigo;
			a^.dato.totalUnidades := v.cantUni;
			a^.HI := nil;
			a^.HD := nil;
		end
		else if (v.codigo = a^.dato.codigo) then
			a^.dato.totalUnidades := a^.dato.totalUnidades + v.cantUni
		else if (v.codigo < a^.dato.codigo) then
			InsertarTotales(a^.HI, v)
		else
			InsertarTotales(a^.HD, v);
	end;
	procedure AgregarAdelante (var l:Lventas ; v : Tventas);
	var
		nue : Lventas;
	begin
		new(nue);
		nue^.dato := v;
		nue^.sig := l;
		l := nue;
	end;
		
	procedure InsertarOrdenado(var a : arbol ; datos : Tventas);
	var
		nodo : arbol;
	begin
		if (a = nil) then begin
			new(nodo);
			nodo^.dato := datos;
			nodo^.HI := nil;
			nodo^.HD := nil;
			a := nodo;
		end
		else begin
			if(a^.dato.codigo > datos.codigo) then
				InsertarOrdenado(a^.HI, datos)
			else
				InsertarOrdenado(a^.HD, datos);
		end;		
	end;
	procedure InsertarEnVentas (var a : aVentas ; v : Tventas); //inserta tanto en el arbol de ventas como en la lista.
	begin
		if(a = nil) then begin
			new(a);
			a^.dato := nil;
			AgregarAdelante(a^.dato, v); //con aux^.dato le estoy pasando la lista ya  que esta es de tipo Lventas.
			a^.HI := nil;
			a^.HD := nil;
		end
		else if (v.codigo = a^.dato^.dato.codigo) then
			AgregarAdelante(a^.dato, v)
		else if (v.codigo < a^.dato^.dato.codigo) then
			InsertarEnVentas(a^.HI, v)
		else
			InsertarEnVentas(a^.HD, v);
	end;
	procedure CargarArbol(var a : arbol ; var t : aTotales ; var arVentas : aVentas);
	var
		v:Tventas;
	begin
		LeerVentas(v);
		while(v.codigo <> 0) do begin 
			InsertarOrdenado(a, v);
			InsertarEnVentas(arVentas, v);
			InsertarTotales(t, v);
			LeerVentas(v);
		end;
	end;
	procedure InformarArbolVentas(a: arbol);
	begin
		if (a <> nil) then begin
			InformarArbolVentas(a^.HI);
			writeln('Venta -> Cod: ', a^.dato.codigo,
					'  Fecha: ', a^.dato.fecha.dia, '/', a^.dato.fecha.mes,
					'  Unidades: ', a^.dato.cantUni);
			InformarArbolVentas(a^.HD);
		end;
	end;
	procedure InformarArbolTotales(a: aTotales);
	begin
		if (a <> nil) then begin
			InformarArbolTotales(a^.HI);
			writeln('Producto -> Cod: ', a^.dato.codigo,
					'  Total unidades: ', a^.dato.totalUnidades);
			InformarArbolTotales(a^.HD);
		end;
	end;
	procedure InformarLista(l: Lventas);
	begin
		while (l <> nil) do begin
			writeln('   Venta -> Fecha: ', l^.dato.fecha.dia, '/', l^.dato.fecha.mes,
					'  Unidades: ', l^.dato.cantUni);
			l := l^.sig;
		end;
	end;

	procedure InformarArbolConListas(a: aVentas);
	begin
		if (a <> nil) then begin
			InformarArbolConListas(a^.HI);
			writeln('Producto -> Cod: ', a^.dato^.dato.codigo);
			InformarLista(a^.dato);
			InformarArbolConListas(a^.HD);
		end;
	end;
	procedure InformarVentas(a: arbol; t: aTotales; v: aVentas);
	begin
		writeln('--- Arbol de ventas (i) ---');
		InformarArbolVentas(a);

		writeln('--- Arbol de productos totales (ii) ---');
		InformarArbolTotales(t);

		writeln('--- Arbol de productos con listas (iii) ---');
		InformarArbolConListas(v);
	end;

	function TotalVentasArbolI(a: arbol; codigo: integer): integer;
	begin
		if (a = nil) then
			TotalVentasArbolI := 0
		else begin
			if (a^.dato.codigo = codigo) then
				TotalVentasArbolI := a^.dato.cantUni
								   + TotalVentasArbolI(a^.HI, codigo)
								   + TotalVentasArbolI(a^.HD, codigo)
			else if (codigo < a^.dato.codigo) then
				TotalVentasArbolI := TotalVentasArbolI(a^.HI, codigo)
			else
				TotalVentasArbolI := TotalVentasArbolI(a^.HD, codigo);
		end;
	end;

	{ MODULO C }
	function TotalVentasArbolII(a: aTotales; codigo: integer): integer;
	begin
		if (a = nil) then
			TotalVentasArbolII := 0
		else if (a^.dato.codigo = codigo) then
			TotalVentasArbolII := a^.dato.totalUnidades
		else if (codigo < a^.dato.codigo) then
			TotalVentasArbolII := TotalVentasArbolII(a^.HI, codigo)
		else
			TotalVentasArbolII := TotalVentasArbolII(a^.HD, codigo);
	end;

	{ MODULO D }
	function SumarLista(l: Lventas): integer;
	var
		total: integer;
	begin
		total := 0;
		while (l <> nil) do begin
			total := total + l^.dato.cantUni;
			l := l^.sig;
		end;
		SumarLista := total;
	end;

	procedure ProductoMasVendido(a: aVentas; var codMax, maxUnidades: integer);
	var
		totalActual: integer;
	begin
		if (a <> nil) then begin
			ProductoMasVendido(a^.HI, codMax, maxUnidades);

			totalActual := SumarLista(a^.dato);
			if (totalActual > maxUnidades) then begin
				maxUnidades := totalActual;
				codMax := a^.dato^.dato.codigo;
			end;

			ProductoMasVendido(a^.HD, codMax, maxUnidades);
		end;
	end;


var
	a:arbol; arbolV : aVentas ; arbolT : aTotales; codBuscado, total, codMax, maxU: integer;
begin
	randomize;
	a := nil;
	arbolT := nil;
	arbolV := nil;
	writeln;
	writeln ('----- Ingreso de socios y armado del arbol ----->');
	writeln;
	CargarArbol(a, arbolT, arbolV);
	InformarVentas(a, arbolT, arbolV);
	writeln;
	writeln ('//////////////////////////////////////////////////////////');
	writeln;
	//~ PARA EL B
	writeln('Ingrese un codigo de producto para buscar en arbol I: ');
	readln(codBuscado);
	total := TotalVentasArbolI(a, codBuscado);
	if(total <> 0 ) then 
		writeln('Total vendido del producto ', codBuscado, ' en arbol I: ', total)
	else
		writeln('No se encontro el producto buscado.');

	//~ PARA EL C
	writeln('Ingrese un codigo de producto para buscar en arbol II: ');
	readln(codBuscado);
	total := TotalVentasArbolII(arbolT, codBuscado);
	if(total <> 0) then
		writeln('Total vendido del producto ', codBuscado, ' en arbol II: ', total)
	else
		writeln('No se encontro el producto buscado.');

	//~ PARA LE D 
	codMax := -1;
	maxU := -1;
	ProductoMasVendido(arbolV, codMax, maxU);
	if (codMax <> -1) then
		writeln('Producto con mas ventas: ', codMax, ' con ', maxU, ' unidades.');
end.
