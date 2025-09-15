{
    a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de Informática y los almacene en una estructura de datos. La información que se lee es legajo, código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben guardarse los finales que rindió en una lista.
	b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.
	c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y su cantidad de finales aprobados (nota mayor o igual a 4).
	d. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.
   
}


program facultad;

const
	fin = 0; 

type
	rango_fecha = 1..31;
	
	regAlumnos = record // registro para lectura
		legajo: integer;
		materia: integer;
		fecha: rango_fecha; 
		nota: real; 
	end; 
	
	regFinales = record // registro para la lista de finales
		materia: integer;
		fecha: rango_fecha; 
		nota: real;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato:regFinales;
		sig: lista; 
	end;
	
	regArbol = record // registro para el arbol 
		legajo: integer;
		finales: lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
procedure lectura(var a:regAlumnos); 
	begin	
		a.legajo:= random(500);
		if(a.legajo <> fin) then begin
			a.materia:= random(30) + 1;
			a.fecha:= random(32) + 1;
			a.nota:= random(11); 
		end;
	end;

procedure agregarAdelante(var l: lista; dato:regAlumnos);
var
	nue: lista;
	begin
		new(nue);
		nue^.dato.materia:= dato.materia;
		nue^.dato.fecha:= dato.fecha;
		nue^.dato.nota:= dato.nota;
		nue^.sig:= l;
		l:= nue; 
	end;
	
procedure insertarArbol(var a: arbol; dato: regAlumnos);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.legajo:= dato.legajo; 
			a^.dato.finales:= nil;
			agregarAdelante(a^.dato.finales, dato);
			a^.HI:= nil;
			a^.HD:= nil;
		end 
		else begin
			if (dato.legajo = a^.dato.legajo) then
				agregarAdelante(a^.dato.finales, dato)
			else if (dato.legajo <  a^.dato.legajo) then
				insertarArbol(a^.HI, dato)
			else 
				insertarArbol(a^.HD, dato)
		end;
	end;

procedure cargarArbol(var a: arbol);
var
	alumnos:regAlumnos;
	begin	
		lectura(alumnos);
		while (alumnos.legajo <> 0) do begin
			insertarArbol(a, alumnos); 
			lectura(alumnos);
		end;
	end;

procedure alumnosLegajoImpares(a:arbol; var impares: integer);
	begin
		if(a <> nil) then begin
			if(a^.dato.legajo MOD 2 <> 0) then
				impares:= impares + 1; 
			alumnosLegajoImpares(a^.HI, impares);
			alumnosLegajoImpares(a^.HD, impares);
		end;
	end;

procedure recorrerLista(l:lista; var aprobados:integer); 
	begin
		while(l <> nil) do begin
			if(l^.dato.nota >= 4) then
				aprobados:= aprobados + 1;
			l:= l^.sig; 
		end; 
	end;
	
procedure finalesAprobadas(a:arbol; aprobados:integer); 
	begin
		if(a <> nil) then begin
			finalesAprobadas(a^.HI, aprobados);
			recorrerLista(a^.dato.finales, aprobados); 
			writeln('El alumno con el legajo: ', a^.dato.legajo, ' tiene ', aprobados, ' finales aprobadas'); 
			finalesAprobadas(a^.HD, aprobados);
		end;
	end;

function CalcularPromedio(l: lista): real; 
var
	notas: real;
	finales: integer; 
	
	begin
		notas:= 0;
		finales:= 0; 
		
		while(l <> nil) do begin
			finales:= finales + 1;
			notas:= notas + l^.dato.nota; 
			l:= l^.sig; 
		end; 
		
		if (finales > 0) then
			CalcularPromedio:= notas / finales
		else
			CalcularPromedio:= 0; 
	end; 

procedure alumnosConPromedioSuperior(a:arbol; valor, promedio: real); 
	begin
		if (a <> nil) then begin
			alumnosConPromedioSuperior(a^.HI, valor, promedio);
			
			promedio:= CalcularPromedio(a^.dato.finales); 
			
			if(promedio > valor) then
				writeln('El alumno con el legajo: ', a^.dato.legajo, ' tiene el promedio: ', promedio:4:2);
			alumnosConPromedioSuperior(a^.HD, valor, promedio);
		end; 
	end;

var
	a: arbol; 
	impares, aprobados: integer;
	valor, promedio: real; 

BEGIN
	randomize;
	
	a:= nil; 
	impares:= 0; 
	aprobados:= 0; 
	
	valor:= 0;
	promedio:= 0; 
	
	cargarArbol(a); 
	alumnosLegajoImpares(a, impares); 
	writeln('Cantidad de alumnos con legajo impares es: ', impares);
	
	finalesAprobadas(a, aprobados); 
	
	alumnosConPromedioSuperior(a, valor, promedio); 
END.

