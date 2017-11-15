%
% Proyecto Investigación Paradigmas de Programación
% rwc.pl
% 
% David Lobo Gúzman.
% Cristian Díaz Jiménez.
%

% esMiembro?
esMiembro(A,[],0):-!.
esMiembro(A,[A|_T],1):-!.
esMiembro(A,[_H|T],R):-esMiembro(A,T,R).

% retornar posicion
getPos(E,[E|_],1):-!.
getPos(E,[E|_],P):-P,!.
getPos(E,[_|C],P):- getPos(E,C,P1), P is P1 + 1.

% Parseo
parseo(X, Y):- X>=20, X=<27, X1 is X+30, parseo(X1,Y), !.
parseo(X, Y):- 2 is mod(X, 10), Y is X+3, !.
parseo(X, Y):- 6 is mod(X, 10), Y is X+3, !.
parseo(X, Y):- 5 is mod(X, 10), Y is X-3, !.
parseo(X, Y):- 9 is mod(X, 10), Y is X-3, !.
parseo(X,Y):- Y is X, !.

% Principal
royale([],[]):-!.
royale([A,B|C],R):- esMiembro(B,[A],X),royale([B|C],C,[A],1,X,[1],R).
royale([A],[],_,Pos,0,Lf,R):- Pos1 is Pos+1, parseo(Pos1,X), append(Lf,[X],R),!.
royale([A],[],_,_,1,Lf,R):- getPos(A,Nw,P), parseo(P,X), append(Lf,[X],R),!.

royale([A|B],[C|D],Nw,Pos,1,Lf,R):- getPos(A,Nw,P), parseo(P,X), append(Lf,[X],Lf1),esMiembro(C,Nw,M), royale(B,D,Nw,Pos,M,Lf1,R).

royale([A|B],[C|D],Nw,Pos,0,Lf,R):- append(Nw,[A],Nw1),Pos1 is Pos+1,parseo(Pos1,X),append(Lf,[X],Lf1),esMiembro(C,Nw1,M),royale(B,D,Nw1,Pos1,M,Lf1,R).
