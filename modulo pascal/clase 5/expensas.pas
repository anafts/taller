{

1. El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:

a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.

b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.

c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
*
d) Un módulo recursivo que retorne el monto total acumulado de las expensas.
   
   
}


program expensas;

const
	dimF = 300;
	fin = 0; 

type
	indice = 0..300; 
	oficina = record
		codI: integer;
		DNI: integer;
		valor: real; 
	end;
	
	v_oficinas = array[1..dimF] of oficina; 
	
procedure leerOficinas(var o:oficina); 
	begin
		read(o.codI);
		if(o.codI <> fin) then begin
			read(o.DNI);
			read(o.valor);
			read(o.codI);
		end; 
	end;
	
procedure cargarVector(var v:v_oficinas; var dimL: indice); 
var
	o: oficina;
	begin
		leerOficinas(o); 
			while (dimL < 300) and (o.codI <> fin) do begin
				dimL:= dimL + 1; 
				v[dimL]:= o; 
			end; 
	end; 
	
procedure ordenarVector(var v:v_oficinas; dimL: indice); 
var 
	i, j: indice;
	actual: oficina; 
	
	begin
		for i:= 2 to dimL do begin
			actual:= v[i];
			j:= i-1; 
			while ((j > 0) and (v[j].codI > actual.codI)) do begin
				v[j + 1] := v[j];
				j:= j-1; 
			end;
		v[j + 1] := actual; 
	end;
end; 

procedure BusquedaDicotomica(var v:v_oficinas;var j:integer; dimL:integer; x:integer);
var
	pri,ult,medio:integer;
	begin
		j:=0;
		pri:=1;
		ult:=dimL;
		medio:=(pri+ult) DIV 2;
		while((pri<=ult) and (x<>v[medio].codI)) do begin
			if(x<v[medio].codI) then
				ult:=medio-1
			else
				pri:=medio+1;
		end;
		if(pri<=ult) then
			j:=medio
		else
			j:=0;
	end;

procedure informar(v: v_oficinas;j: integer; x: integer);
begin
	if (j <> fin) then begin
		writeln('el codigo de identificacion: ', x, 'se encuentra en la posición: ', j);
		writeln('el dni del propietario es: ', v[j].DNI);
	end
	else
		writeln(j);
		writeln('no se encontró la oficina');
		
end;

function montoTotal(v: v_oficinas; dimL: indice; i: integer): real; 
var
	valor: real;
	begin
		valor:= 0; 
		if(i < dimL ) then
			valor:= valor + v[i].valor; 
			montoTotal(v, diml, i + 1); 
			
			
	montoTotal:= valor; 
	end;


var
	v: v_oficinas;
	dimL: indice; 

BEGIN

	dimL:= 0;
	cargarVector(v, dimL);
	ordenarVector(v, dimL);  
	
END.

