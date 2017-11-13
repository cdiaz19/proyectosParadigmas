% Proyecto Investigación Paradigmas de Programación
% rwc.erl
% 
% David Lobo Gúzman.
% Cristian Díaz Jiménez.
%
-module(rwc).
-export([royale/1]).

%esMiembro?
esMiembro(X,[])->false;
esMiembro(X,[X|_T])->true;
esMiembro(X,[H|T])->esMiembro(X, T).

% get-pos
getPos(X,[],C)->[];
getPos(X,[X|_T],C)->C;
getPos(X,[H|T],C)->getPos(X,T,C+1).

% parseo
parseo(X)when (X >= 20)->X+30;
parseo(X)when (X rem 10 == 2)-> X+3;
parseo(X)when (X rem 10 == 6)-> X+3;
parseo(X)when (X rem 10 == 5)-> X-3;
parseo(X)when (X rem 10 == 9)-> X-3;
parseo(X)->X.

% principal
royale([])->[];
royale([H|T])->royale(T, [H], [1], 1).

% (RL LV LS Count)
royale([],LV,LS,C)->lists:concat(LS);
royale([H|T],LV,LS,C)->royale([H|T],LV,LS,C,esMiembro(H,LV)).

%Cond
royale([H|T],LV,LS,C,true)->royale(T, LV, LS++[parseo(getPos(H, LV, 1))], C);
royale([H|T],LV,LS,C,false)->royale(T, LV++[H], LS++[parseo(C+1)], C+1).

