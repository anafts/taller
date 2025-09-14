program netflixnchill;
const 
dimF = 8;

type 
    rangoGen = 1..dimF;
    
    pelicula = record 
        codPeli : integer;
        codGen : rangoGen;
        puntaje : real;
    end;
    
    lista = ^nodo;
    
    nodo = record 
        dato : pelicula;
        sig : lista;
    end;
    
    Maypuntaje = record 
        codigo : Integer;
        puntaje : real;
    end;
    
    vectorPeliculas = array[rangoGen] of lista;
    
    vectorMayorPuntaje = array[rangoGen] of Maypuntaje;

var  l : lista;

procedure CargarPelis(var v : vectorPeliculas);
   
    procedure inicializarVector (var v : vectorPeliculas);
    var i:integer;
    
    begin 

        for i:= 1 to dimF do v[i]:= nil;

    end;

    procedure leerPeli(var peli : pelicula);
    begin 
        
        peli.codPeli:= random(100) - 1;
        if (peli.codPeli <> - 1) then 
        begin 
            peli.codGen:= random(8) + 1;
            peli.puntaje:= random(10) + 1;
        end;     
    end;
    procedure guardarAdelante (var l : lista ; p : pelicula);
    var 
        nue,act : lista;
    begin 
        new(nue);
        nue^.dato:= p;
        nue^.sig:= nil;

        if (l <> nil) then begin 
            act:= l;
            while (act^.sig <> nil ) do begin 
                act:= act^.sig;
            end;
            act^.sig:= nue;
        end else l:= nue;

    end;

var p : pelicula; i : integer;
begin 
    inicializarVector(v);
    leerPeli(p);
    
    while (p.codPeli <> -1) do 
    begin 
        guardarAdelante(v[p.codGen],p);
        leerPeli(p);
    end;

    //for i:= 1 to dimF do begin 
    //    while (v[i] <> nil ) do begin 
    //        WriteLn('Genero  ', i); WriteLn(' ');
    //        WriteLn('Codigo peli ', v[i]^.dato.codPeli);
    //        v[i]:= v[i]^.sig;
    //    end;
    //end;
end;

procedure MayoRpuntaje (l : vectorPeliculas;var v : vectorMayorPuntaje);
    procedure inicializarMayorPuntaje (var v :vectorMayorPuntaje);
    var i : integer;
    begin 
        for i:=1 to dimF do begin 
            v[i].codigo:= 0;
            v[i].puntaje:= -1;
        end;
    end;

var mayorPuntaje : real; i : integer;
begin 
    inicializarMayorPuntaje(v);
    
    for i:= 1 to dimF do 
    begin 
        mayorPuntaje:= -1;
        while (l[i] <> nil ) do begin 
            if (l[i]^.dato.puntaje > mayorPuntaje ) then 
            begin 
                mayorPuntaje:= l[i]^.dato.puntaje;
                v[i].codigo:= l[i]^.dato.codPeli;
                v[i].puntaje:= mayorPuntaje;
            end;
            l[i]:= l[i]^.sig;
        end;


    end;
   //for i:= 1 to dimF do begin  // CHEQUEO SI SE ME GUARDA BIEN LAS VARIABLES
   //    WriteLn(' '); WriteLn('Genero ',i,' el codigo de pelicula es ',v[i].codigo);
   //    WriteLn('Puntaje ',v[i].puntaje:4:2);
   //end;
end;

procedure OrdenarMayorPuntaje (var v :vectorMayorPuntaje);
var i,j,p : integer; item : Maypuntaje;
begin 
    for i:= 1 to dimF-1 do begin 
        p:=i;
        for j:= i + 1 to dimF do 
        begin 
            if (v[j].puntaje < v[p].puntaje) then p:= j;
        end;
        item:= v[p];
        v[p]:= v[i];
        v[i]:= item;
    end;

    //WriteLn(' '); WriteLn('Vector ordenado por puntaje'); ////// CHEQUEO DE VECTOR ORDENADO
    //for i:=1 to dimF do begin 
    //    WriteLn('Posicion');
    //    WriteLn('Puntaje ',v[i].puntaje:4:2);
    //    WriteLn('Codigo ',v[i].codigo);
//
    //end; 
end;

var  v : vectorPeliculas; vPuntajeMayor : vectorMayorPuntaje;
begin
    randomize;
    WriteLn('PROGRAMA PRINCIPAL');
    l := nil;
    CargarPelis(v);
    MayoRpuntaje(v,vPuntajeMayor);
    OrdenarMayorPuntaje(vPuntajeMayor);
    WriteLn('El codigo de mayor puntaje es ',vPuntajeMayor[8].codigo);
    WriteLn('El codigo de menor puntaje es ',vPuntajeMayor[1].codigo);
    { observaciones, consultar si cumple con lo pedido ya que se guarda igualmente codigos repetidos}
end.

