% Proyecto Investigación Paradigmas de Programación
% rwc.erl
% 
% David Lobo Gúzman.
% Cristian Díaz Jiménez.
%

% esmiembro?	
esmiembro(A,[A|_T]):-!.
esmiembro(A,[_H|T]):-esmiembro(A,T).

% retornar posicion
getpos(E,[E|_],1):-!.
getpos(E,[E|_],P):-P,!.
getpos(E,[_|C],P):- getpos(E,C,P1), P is P1 + 1.

% Parseo
parseo(X, Y):- 2 is mod(X, 10), Y is X+3,!.
parseo(X, Y):- 6 is mod(X, 10), Y is X+3,!.
parseo(X, Y):- 5 is mod(X, 10), Y is X-3,!.
parseo(X, Y):- 9 is mod(X, 10), Y is X-3,!.
parseo(X, Y):- Y is X,!.


% principal
royale([],[]):-!.
royale([X],[X]):-!.
royale([_H|T],[Y|Ys]):-royale(T, [H], [1], 1, Zs).

royale([],LV,LS,C,LS):-!.
