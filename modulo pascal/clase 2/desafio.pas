{
  4.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa el número 0 (cero).

		Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2. 
		¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.
}


program desafio;

procedure equivalente(dig: integer); 
var
	binario: integer;
	begin
	  binario:=0;
	  if(dig <> 0) then begin
		binario := dig mod 2;
		equivalente(dig div 2);
	  end;
	  write(binario);
	end;

procedure lectura(n:integer);
	begin
		n:=random(257);
    while n <> 0 do
    begin
        equivalente(n);
        writeln();
        n:=random(257);
    end;    
	end; 

var
	n: integer; 
begin
	n:= 0; 
    randomize;
    lectura(n); 

end.
