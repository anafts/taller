{
  
   parcial 2024 - turno N
   
}


program clinica;

const
	dimf = 12;
	fin = 0;  
 
type
	rango_meses = 1..dimf;
	
	atencion = record
		matricula: integer;
		dni: integer;
		mes: rango_meses; 
		diagnostico: char; 
	end;
	
	regArbol = record
		dni: integer;
		diagnostico: char; 
	end; 
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end; 
	
	v_meses = array[rango_meses] of arbol;
	
procedure leerAtencion(var a: atencion);
var 
	v: array[1..5] of char = ('L', 'M', 'N', 'O', 'P');
	begin
		a.matricula := Random(10000);
		if (a.matricula <> 0) then begin
			a.dni := Random(5000) + 1000;
			a.mes := Random(12) + 1;
			a.diagnostico := v[Random(5) + 1];
		end;
	end;

procedure inicializarVector(var v:v_meses); 
var
	i: integer;
	begin
		for i:= 1 to dimf do 
			v[i]:= nil; 
	end;
	
procedure insertarArbol(var a:arbol; regA:atencion);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato.dni:= regA.dni;
			a^.dato.diagnostico:= regA.diagnostico;
			a^.HI:= nil;
			a^.HD:= nil;
		end 
		else begin
			if (regA.dni < a^.dato.dni) then
				insertarArbol(a^.HI, regA)
			else if (regA.dni > a^.dato.dni) then
				insertarArbol(a^.HD, regA);
		end; 
	end;

procedure insertarVector(var v: v_meses; regA:atencion); 
	begin
		insertarArbol(v[regA.mes], regA);
	end;

procedure cargarDatos(var v: v_meses); 
var
	regA: atencion; 
	begin
		leerAtencion(regA);
		while(regA.matricula <> fin) do begin
			insertarVector(v, regA); 
			leerAtencion(regA);
		end; 
	end; 

function cantidadAtencionesPorMes(a: arbol): integer; // cantidad de atenciones por mes
	begin
		if(a = nil) then
			cantidadAtencionesPorMes:= 0
		else
			cantidadAtencionesPorMes:= 1 + cantidadAtencionesPorMes(a^.HI) + cantidadAtencionesPorMes(a^.HD)
	end;

procedure buscarMesConMayorAtenciones(v: v_meses; mesActual: integer; var maxAtenciones, mesConMasAtenciones: integer);
var
    atencionesPorMes: integer;
begin
    if (mesActual <= dimf) then begin
        atencionesPorMes := cantidadAtencionesPorMes(v[mesActual]);

        if (atencionesPorMes > maxAtenciones) then begin
            maxAtenciones := atencionesPorMes;
            mesConMasAtenciones := mesActual;
        end;

        buscarMesConMayorAtenciones(v, mesActual + 1, maxAtenciones, mesConMasAtenciones);
    end;
end;

function verificarAtencione(a: arbol; dni:integer):boolean; 
	begin
		if(a = nil) then 
			verificarAtencione:= false
		else begin 
			if(dni = a^.dato.dni) then
				verificarAtencione:= true
			else if (dni < a^.dato.dni) then
				verificarAtencione:= VerificarAtencione(a^.HI, dni)
			else
				verificarAtencione:= VerificarAtencione(a^.HD, dni)
		end; 
	end;
	
var
	v: v_meses;
	a: arbol; 
	mesConMasAtenciones, mesActual, maxAtenciones, dni: integer; 
	
BEGIN
	randomize;  
	a:= nil; 
	
	dni:= random(5000) + 1000;
	
	maxAtenciones:= 0;
    mesConMasAtenciones := 0;
	
	mesActual:= 1; 
	
	inicializarVector(v);
	cargarDatos(v);
	
	buscarMesConMayorAtenciones(v, mesActual, maxAtenciones, mesConMasAtenciones); 
	writeln('El mes con mayor numero de atencione es: ', mesConMasAtenciones, ' con ', maxAtenciones, ' atenciones.');
	
	if (verificarAtencione(a, dni) = true) then
		writeln('El paciente con DNI ', dni, ' fue atendido.')
	else	
		writeln('El paciente con DNI ', dni, ' no fue atendido.'); 
END.

