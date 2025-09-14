{
  2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas.
	Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
		a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
		b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.
		c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}


program oficinas;

const
	fin = -1; 
	dimf = 300; 

type
	rango = 1..dimf; 
	
	oficina = record
		codI: integer;
		DNI: integer;
		expensa: real; 
	end;
	
	v_oficinas = array[rango] of oficina; 

procedure leerDatos(var o: oficina); 
	begin
		o.codI:= random(501);
		o.DNI:= random(5000 - 2000 + 1) + 2000; 
		o.expensa:= random(5000 - 2000 + 1) + 2000; 
	end; 

procedure cargarVector(var v: v_oficinas; var diml: integer); 
var
	o: oficina; 
	begin
		leerDatos(o);
		while(o.CodI <> fin) and (diml < dimF) do begin
			diml:= diml + 1; 
			v[diml] := o; 
			leerDatos(o);
		end;
	end; 
	
procedure ordenarInsercion(var v: v_oficinas; diml: integer); // Método de ordenación por inserción.
// La idea es construir una parte del arreglo que ya está ordenada, insertando elementos uno a la vez en su lugar correcto.
var
	i, pos_ant: integer;
	actual: oficina;
	
begin
	// Empezamos desde el segundo elemento (índice 2), porque asumimos que el primer elemento ya es una lista "ordenada" de un solo ítem.
	for i:= 2 to diml do begin
		// 1. Guardamos el valor que queremos insertar en la lista ordenada.
		actual:= v[i]; 
		
		// 2. Definimos la posición anterior a la de nuestro elemento "actual". Esta variable es nuestro "puntero" para buscar el lugar correcto.
		pos_ant:= i - 1; 
		
		// 3. Bucle clave: mientras no hayamos llegado al principio del arreglo (pos_ant > 0) y el elemento en la posición anterior sea MAYOR que nuestro elemento actual...
		while (pos_ant > 0) and (v[pos_ant].codI > actual.codI) do begin
			// movemos el elemento de la posición anterior una posición hacia adelante. Esto hace espacio para nuestro elemento "actual".
			v[pos_ant + 1]:= v[pos_ant]; 
			
			// y retrocedemos una posición para seguir comparando.
			pos_ant:= pos_ant - 1; 
		end; 
		
		// 4. Cuando el bucle "while" termina, significa que encontramos el lugar correcto. La posición "pos_ant + 1" es el espacio libre donde debemos insertar "actual".
		v[pos_ant + 1] := actual; 
	end; 
end; 

procedure ordenarSeleccion(var v: v_oficinas; diml: integer); // Algoritmo de ordenación por selección.
// Su objetivo es encontrar el elemento más pequeño del arreglo y ponerlo en la posición correcta, repitiendo el proceso hasta que todo el arreglo esté ordenado.
var
	i, pos_actual, indice_menor: integer;
	item: oficina;
	
	begin
		// Loop externo: recorre el arreglo para definir la posición donde se colocará el elemento más pequeño. Va hasta "diml - 1" porque el último elemento ya estará en su lugar al final del penúltimo recorrido.
		for i:= 1 to diml - 1 do begin 
			
			// Paso 1: Inicializamos "pos" (posición del menor) con el índice actual "i". Asumimos que el elemento en "v[i]" es el menor de la sub-lista no ordenada, por ahora.
			indice_menor:= i; 
			
			// Loop interno: Recorre la parte no ordenada del arreglo para encontrar el elemento más pequeño.
			for pos_actual:= i + 1 to diml do 
				
				// Comparamos el elemento actual (v[j]) con el menor encontrado hasta ahora (v[pos]).
				if (v[pos_actual].codI < v[indice_menor].codI) then
					
					// Si encontramos un elemento más pequeño, actualizamos "pos"
					// con el índice de ese nuevo elemento.
					indice_menor:= pos_actual;
			
			// Paso 2: Realizamos el intercambio (swap) del elemento en "v[i]"
			// con el elemento más pequeño que encontramos en "v[pos]".
			
			// Guardamos el VALOR del elemento más pequeño en una variable temporal.
			item:= v[indice_menor];
			
			// Movemos el valor que estaba en la posición "i" al lugar donde estaba el menor.
			v[indice_menor] := v[i];
			
			// Colocamos el valor más pequeño (que guardamos en "item") en su posición final "i".
			v[i] := item;
			
		end;
	end;

var
	v: v_oficinas;
	diml: integer;
	
BEGIN
	randomize; 
	diml:= 0; 
	
	cargarVector(v, diml); 
	
	ordenarInsercion(v, diml); 
	
	ordenarSeleccion(v, diml);
END.

