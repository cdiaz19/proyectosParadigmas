#!/usr/bin/swipl
:-set_prolog_flag(verbose,silent).
:-dynamic frecuencias/2.
:-dynamic preposiciones/1.

:-initialization main.
main:-	insertarp([a,ante,"[","]",bajo,cabe,and,this,i,cabe,con,contra,de,desde,those,en,entre,hacia,hasta,para,that,these,para,por,segun,según,sin,so,sobre,tras,about,above,after,among,at,before,behind,below,beneath,beside,between,but,by,down,except,for,from,in,into,like,near,of,off,on,over,since,through,throghout,till,to,until,under,up,upon,with,without,un,una,unos,unas,el,la,los,las,an,you,he,she,the,it]),
	current_prolog_flag(argv, Argv),nth0(0,Argv,H),atom_number(H,N),
	calc_frecuencias("textoAmigo","frecAmigo",N),write("Se crea las Frecuencias de Amigo"),nl,
	calc_frecuencias("textoUsuario","frecUsuario",N),write("Se crea las Frecuencias de Usuario"),nl,
	calc_frecuencias("textoHashtags","frechashtags",N),write("Se crea las Frecuencias de Hashtags"),nl,
halt(1).

main:-halt(0).
	calc_frecuencias(Archivo,Salida,Kp):-
	readPlainText(Archivo,Lineas),
	separar(Lineas,Palabras), 
	flatten(Palabras,PalabrasPlanas),
	retractall(frecuencias(_,_)),
	minuscula(PalabrasPlanas, PalabrasM),
	insertar(PalabrasM),
	findall([X,Y],
	frecuencias(X,Y),L),
	invertirParejas(L,X),
	sort(X,Z),reverse(Z,Mayores),
	cortaP(Mayores,Kp,K),
	invertirParejas(K,KK),
	escribir(Salida,KK).

readPlainText(X,Rs):-
	open(X,read,Stream),
	read_until_stop(Stream,Rs),
	close(Stream).

read_until_stop(File, [L|Lines]):- read_line_to_codes(File, Codes),
	Codes \= end_of_file,
	atom_codes(L,Codes),
	L \= stop,
	!,
	read_until_stop(File, Lines).

read_until_stop(_,[]).

cortaP(_,0,[]):-!.
cortaP(L,N,L):-length(L,X),N > X.
cortaP([H|T],N,[H|Resto]):-N2 is N-1, cortaP(T,N2,Resto).

escribir(Archivo,Dato) :-
    open(Archivo,write,Stream),
    (    write(Stream, Dato), fail
    ;   true
    ),
    close(Stream).

flatten([],[]):-!.
flatten([[H|T]|T2],Fla):-flatten([H|T],Hf),
		flatten(T2,Tf), append(Hf,Tf,Fla). 
flatten([H|T],[H|Resto]):- flatten(T,Resto).
eduplicate([],[]):-!.
eduplicate([X],[X]):-!.
eduplicate([H|[H|T]], Resto):- eduplicate([H|T],Resto).
eduplicate([H|[Y|T]], [H|Resto]):- eduplicate([Y|T],Resto).

minuscula([],[]):-!.
minuscula([H|T],[Min|Resto]):- downcase_atom(H,Min),minuscula(T,Resto).

separar([],[]):-!.
separar([H|T],[P|Resto]):-split_string(H," " , " [[]!?-.\"“”" , P), separar(T,Resto).

insertar([]):-!.
insertar([H|T]):- preposiciones(H), insertar(T).
insertar([H|T]):- frecuencias(H,X), retract(frecuencias(H,X)),X2 is X+1,  assert(frecuencias(H,X2)),insertar(T).
insertar([H|T]):- assert(frecuencias(H,1)),insertar(T).

invertirParejas([],[]):-!.
invertirParejas([[X,Y]|T],[[Y,X]|Resto]):-invertirParejas(T,Resto).

insertarp([]):-!.
insertarp([H|T]):- assert(preposiciones(H)),insertarp(T).

primero([H|_T],H).

