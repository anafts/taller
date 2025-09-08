{	Modifique el programa incorporando:
	d) Un módulo que imprima 20 números aleatorios.
	
	e) Un módulo que imprima N números aleatorios en el
	rango (A,B), donde N, A y B son números enteros que se
	leen por teclado y se reciben como parámetros.
	
	e) Un módulo que imprima números aleatorios en el
	rango (A,B) hasta que se genere un valor igual a F, el cual
	no debe imprimirse. F, A y B son números enteros que se
	leen por teclado y se reciben como parámetros. 
}


program NumAleatorio;

procedure numAleatorio20(num: integer);
var
	i: integer;
begin
	for i:= 1 to 20 do begin
		num := random(100);
		writeln('El número teste aleatorio generado es: ', num);
	end;

end;

procedure numRango(num2, cant, numA, numB:integer);
var 
	i:integer;
begin
	
	for i:= 1 to cant do begin
		num2 := random(numA) + numB;
		writeln('El número teste aleatorio generado es: ', num2);
	end;
end;

procedure numCorte(num3, cant, numA, numB, corte:integer);
begin
	num3:= random(numA) + numB;
	while (num3 <> corte) do begin
		writeln('El número teste aleatorio generado: ', num3, ' es distinto de: ', corte);
		num3:= random(numA) + numB;
		
	end;
		
end;

var
    num, num2, num3, cant, numA, numB, corte: integer;

BEGIN
	num:= 0; 
	num2:= 0;
	cant:= 0; 
	numA:= 0; 
	numB:= 0; 
	num3:= 0;
	corte:= 0;
	
	read(cant);
	read(numA);
	read(numB);
	
	corte:= random(numA) + NumB;
	
    randomize;
    numAleatorio20(num);
    writeln('-----------------------------------------');
    numRango(num2, cant, numA, numB);
    writeln('-----------------------------------------');
    numCorte(num3, cant, numA, numB, corte);
END.
