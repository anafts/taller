{
   ACTIVIDAD 2: Crear un nuevo archivo ProgramaVectores.pas
	a) Implemente un módulo CargarVector que cree un vector de enteros
	con a lo sumo 50 valores aleatorios. Los valores, generados
	aleatoriamente (entre un mínimo y máximo recibidos por parámetro),
	deben ser almacenados en el vector en el mismo orden que se
	generaron, hasta que se genere el cero.
	b) Implemente un módulo ImprimirVector que reciba el vector generado
	en a) e imprima todos los valores del vector en el mismo orden que
	están almacenados. Qué cambiaría para imprimir en orden inverso?
	c) Escriba el cuerpo principal que invoque a los módulos ya
	implementados.
}


program ProgramaVectores;
const 
	dimF = 50;
	fin = 0; 
type

	vector = array[1..dimF] of integer;

procedure CargarVector(var v: vector; min, max: integer; var dimL: integer);
var
	valor: integer;
	begin
		dimL:= 1; 
		valor := random(min) + max; 
		while(valor <> 0) and (dimL <> dimF) do begin
			v[dimL]:= valor;
			dimL := dimL + 1; 
			valor:= random(min) + max; 
		end;
	end; 
procedure imprimirVector(v: vector; dimL: integer);
var
	i: integer;
	begin
		for i:= 1 to dimL do begin
			write('Número: ', v[i], ' en la posicion: ', i); 
			writeln();
		end; 
	end;
var 
	min, max, dimL: integer;
	v: vector; 
	
BEGIN
	min:= 0;
	max:= 0;
	dimL := 0; 
	
	readln(min);
	readln(max);
	
	randomize; 
	cargarVector(v, min, max, dimL);
	imprimirVector(v, dimL); 
	
END.

