{
 3.- Implementar un programa que invoque a los siguientes módulos.
	a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300 y menores a 1550 (incluidos ambos).
	b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado en la práctica anterior)
	c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente encabezado:
	
	Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
		Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra en el vector.
   
}


program recursivo2;

const
	dimf = 20; 

type
	rango = 1..20; 
	vector =  array[rango] of integer; 

procedure cargarVector(var v:vector; diml: integer);
	begin
		if (diml < dimf) then begin
			v[diml + 1]:= random(1251) + 300;
			cargarVector(v, diml + 1); 
		end; 
	end; 
	
procedure insercion(var v:vector);
var
	i, pos_ant, actual: integer;
	begin
		for i:= 2 to dimf do begin
			actual:= v[i];
			pos_ant:= i - 1; 
			while(pos_ant > 0) and (v[pos_ant] > actual) do begin
				v[pos_ant + 1]:= v[pos_ant];
				pos_ant:= pos_ant - 1;
			end; 
			v[pos_ant + 1]:= actual; 
		end; 
	end;
	

procedure busquedaDicotomica(v: vector; ini, fin: rango; dato: integer; var pos: integer);
var
    medio: integer;
	begin
		if (ini > fin) then // Caso base: valor no encontrado
			pos := -1
		else begin
			medio := (ini + fin) div 2;

			if (v[medio] = dato) then // Caso base: valor encontrado
				pos := medio
			else if (v[medio] > dato) then
				// Paso recursivo: busca en la mitad izquierda
				busquedaDicotomica(v, ini, medio - 1, dato, pos)
			else
				// Paso recursivo: busca en la mitad derecha
				busquedaDicotomica(v, medio + 1, fin, dato, pos);
		end;
	end;
procedure imprimirVector(v: vector);
var
    i: integer;
	begin
		writeln('Valores del vector:');
		for i := 1 to dimf do
			writeln('Posicion [', i, ']: ', v[i]);
	end;

var
	v: vector;
	diml, pos: integer; 

BEGIN
	randomize; 
	diml:= 0; 

	cargarVector(v, diml); 
	insercion(v); 
	imprimirVector(v);
	
	busquedaDicotomica(v, 1, dimf, 5, pos);
	if pos <> -1 then
        writeln('Valor encontrado en la posicion: ', pos)
    else
        writeln('Valor no encontrado.');

    readln;
	
	
END.

