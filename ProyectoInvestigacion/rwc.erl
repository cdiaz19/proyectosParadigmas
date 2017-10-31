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

% coding

% principal
royale([])->[];
royale([X])->[X];
royale([H|T])->royale(T, [H], [1], 1).

% (RL LV LS Count)

royale([],LV,LS,C)->LS;
royale([H|T],LV,LS,C)->esmiembro(H, LV);
royale([H|T],LV,LS,C)->royale(T, LV++[H], LS++[C+1], C+1).
