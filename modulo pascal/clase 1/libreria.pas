{
   - Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto, código de rubro (del 1 al 6) y precio.
	Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
		a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza cuando se lee el precio -1.
		b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
		c. Genere un vector (de a lo sumo 20 elementos) con los productos del rubro 3. Considerar que puede haber más o menos de 20 productos del rubro 3. Si la cantidad de productos del rubro 3 es mayor a 20, almacenar los primeros 30 que están en la lista e ignore el resto.
		d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos métodos vistos en la teoría.
		e. Muestre los precios del vector resultante del punto d).
		f. Calcule el promedio de los precios del vector resultante del punto d).
}


program libreria;

const
	dimf = 6; 
	fin = -1; 

type
	rango_rubro = 1..6; 

	producto = record
		cod: integer;
		rubro: rango_rubro; 
		precio: real; 
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: producto;
		sig: lista; 
	end;
	
	v_rubro = array[rango_rubro] of lista; 
	
	v_rubro3 = array[1..30] of producto;
	
procedure leer(var p:producto);
	begin
		p.cod:=random(200)+1;
		if(p.precio <> fin) then begin
			p.rubro:=random(8)+1;
			p.precio:=((random(200)+1)/(random(200)+1));
		end;
	end; 
	
procedure inicializarVector(var v:v_rubro);
var
	i: integer;
	begin
		for i:= 1 to dimf do
			v[i]:= nil; 
	end;

procedure insertar (var l: lista; p: producto); 
var
	nue, ant, act: lista;
begin
	new(nue); 
	nue^.sig:= nil; 
	nue^.dato:= p;
	
	if (l= nil) 
		then l:= nue
	else begin
		ant:= l;
		act:= l;
		while (act <> nil) and (act^.dato.cod < p.cod) do
			begin
				ant:= act;
				act:= act^.sig;
			end;
		if (l = act) then begin
			nue^.sig:= l;
			l:= nue;
		end
		else begin
			ant^.sig:= nue;
			nue^.sig:= act;
		end;
	end;
end; 

procedure cargarVector(var v:v_rubro);
var
	p: producto; 
	begin
		leer(p);
		while(p.precio <> fin) do begin
			insertar(v[p.rubro], p);
		end;
	end;
	
procedure codPorRubro(v:v_rubro); 
var
	i:integer;
	begin
		for i:= 1 to dimf do begin
			writeln(v[i]^.dato.cod); 
			writeln(v[i]^.dato.rubro); 
			writeln(v[i]^.dato.precio); 
		end;
	end;

procedure rubro3(v:v_rubro; var v3:v_rubro3; var diml: integer); 
var
	rubro: integer;
	begin
		rubro:= 3; 
		
		while(v[rubro] <> nil) and (diml < 30) do begin
			diml:= diml + 1;
			v3[diml] := v[rubro]^.dato; 
			v[rubro]:= v[rubro]^.sig; 
		end; 
	end; 
	
procedure insercion(var v:v_rubro3; diml:integer);
var
	i, pos_ant: integer;
	actual: producto;
	begin
		for i := 2 to dimf do begin
			actual := v[i];
			pos_ant := i - 1;
			while (pos_ant > 0) and (v[pos_ant].precio > actual.precio) do begin
				v[pos_ant + 1] := v[pos_ant];
				pos_ant := pos_ant - 1;
			end;
			v[pos_ant + 1] := actual;
		end;
	end;
	
procedure precio(v:v_rubro3; diml: integer); 
var
	i: integer;
	begin
		for i:= 1 to diml do
			write(v[1].precio);
	end;

function promedio(v:v_rubro3; diml:integer): real; 
var
	i: integer;
	total: real; 
	begin	
		total:= 0; 
		for i:= 1 to diml do
			total:= total + v[i].precio;
			
		promedio:= total / diml;
		
	end; 
var
	v: v_rubro;
	v3: v_rubro3; 
	diml: integer;
BEGIN
	diml:= 0; 
	randomize;
	
	inicializarVector(v);
	cargarVector(v); 
	codPorRubro(v);
	
	rubro3(v, v3, diml); 
	insercion(v3, diml);
	precio(v3, diml);
	writeln('Promedio de los precios del vector del rubro 3 = ', promedio(v3, diml)); 
END.

