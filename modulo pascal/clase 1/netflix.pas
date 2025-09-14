{
   3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de septiembre de 2025. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas.
	Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
		a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1.
		b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas, a partir de la estructura generada en a)..
		c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría.
		d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje, del vector obtenido en el punto c. 
   
}


program netflix;

const
	dimf = 8;
	fin = -1; 
	
type
	rango_genero = 1.. dimf; 
	
	pelicula = record
        cod: integer;
        genero: integer;
        puntaje: real;
    end;
	
	lista = ^nodo;
	
	nodo = record
		dato: pelicula;
		sig: lista; 
	end;
	
	puntaje = record
		cod: integer;
		total: real; 
	end;
	
	v_generos = array[rango_genero] of lista;
	
	v_puntajes = array[rango_genero] of puntaje; 

procedure leerPeliculas(var p: pelicula);
	begin
		p.cod := random(102) - 1;
		if (p.cod <> fin) then begin 
			p.genero := random(8) + 1;
			p.puntaje := random(10) + 1;
		end;
	end;
	
procedure agregarAtras(var l: lista; p: pelicula);
var
	aux, ult: lista;
	begin
		new(aux); 
		aux^.dato:= p; 
		aux^.sig:= nil;
		if(l = nil) then 
			l:= aux
		else begin
			ult:= l;
			while (ult^.sig <> nil) do
				ult:= ult^.sig;
			ult^.sig:= aux;
			end;
	end;
	
procedure inicializarVector(var v:v_generos);
var
	i: integer; 
	begin
		for i:= 1 to dimf do 
			v[i] := nil; 
	end;
	
procedure cargarVector(var v:v_generos);
var
	p: pelicula;
	begin
		leerPeliculas(p);
		while(p.cod <> fin) do begin
			agregarAtras(v[p.genero], p); 
			leerPeliculas(p);
		end;
	end; 

procedure vectorPuntaje(v: v_generos; var v2:v_puntajes); 
var
	i, cod: integer; 
	max: real; 
	
	begin
		for i:= 1 to dimf do begin
			cod:= 0; 
			max:= 0; 
			
			while(v[i] <> nil) do begin	
				if(v[i]^.dato.puntaje > max) then begin
					max:= v[i]^.dato.puntaje; 
					cod:= v[i]^.dato.cod; 
				end;
				v[i]:= v[i]^.sig; 
			end; 
			v2[i].cod:= cod;
			v2[i].total:= max;
		end; 
	end;
	
procedure insercion(var v: v_puntajes);
var
	i, pos_ant: integer;
	actual: puntaje;
	begin
		for i := 2 to dimf do begin
			actual := v[i];
			pos_ant := i - 1;
			while (pos_ant > 0) and (v[pos_ant].total > actual.total) do begin
				v[pos_ant + 1] := v[pos_ant];
				pos_ant := pos_ant - 1;
			end;
			v[pos_ant + 1] := actual;
		end;
	end;
	
procedure imprimir(v: v_puntajes);
var
    i, cod_max, cod_min: integer;
    max, min: real;
	begin
		max:= -1;
		min:= 999999;
		
		cod_max:= 0;
		cod_min:= 0;
		
		for i:= 1 to dimf do begin
			if (v[i].total > max) then begin
				max:= v[i].total;
				cod_max:= v[i].cod;
			end;
			
			if (v[i].total < min) then begin
				min:= v[i].total;
				cod_min:= v[i].cod;
			end;
		end;
		
		writeln('Película con mayor puntaje: ', cod_max);
		writeln('Película con menor puntaje: ', cod_min);
	end; 

var
	v: v_generos;
	v2: v_puntajes;

BEGIN
	inicializarVector(v);
	cargarVector(v);
	
	vectorPuntaje(v, v2); 
	insercion(v2); 
	
	imprimir(v2);
	
	
END.

