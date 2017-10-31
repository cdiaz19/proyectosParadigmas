% Proyecto Investigación Paradigmas de Programación
% rwc.erl
% 
% David Lobo Gúzman.
% Cristian Díaz Jiménez.
%
-module(rwc).
-export([royale/1]).

%esmiembro?
esmiembro(X,[])->false;
esmiembro(X,[X])->true;
esmiembro(X,[X|_T])->true;
esmiembro(X,[H|T])->esmiembro(X, T).

% get-pos
getpos(X,[],C)->[];
getpos(X,[X|_T],C)->C;
getpos(X,[H|T],C)->getpos(X,T,C+1).

% parseo
parseo(X)when (X >= 20)->X+30;
parseo(X)when (X rem 10 == 2)-> X+3;
parseo(X)when (X rem 10 == 6)-> X+3;
parseo(X)when (X rem 10 == 5)-> X-3;
parseo(X)when (X rem 10 == 9)-> X-3;
parseo(X)->X.

% principal
royale([])->[];
royale([X])->[X];
royale([H|T])->royale(T, [H], [1], 1).

% (RL LV LS Count) REVISAR

royale([],LV,LS,C)->LS;
royale([H|T],LV,LS,C)->
	case esmiembro(H, LV) of
	true->
	    royale(T, LV, LS++[parseo(getpos(H, LV, 1))], C);
        false->
	    royale(T, LV++[H], LS++[parseo(C+1)], C+1)
	end.
