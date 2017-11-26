-module(examen).
-export([carmichael/1, dehuff/1]).

lfib(N)->lfib([1,1], N-2).

lfib(L, 0)->L;
lfib([X,Y|LF], N)->lfib([X+Y, X, Y | LF], N-1).

simp(N,I)when N rem I == 0->simp(N div I, I);
simp(N,_I)->N.

factPrimos(N)->factPrimos(N, 2, []).

factPrimos(N,I,Facts)when I*I > N->[N|Facts];
factPrimos(N, I, Facts)when N rem I == 0->factPrimos(simp(N,I), I+1, [I|Facts]);
factPrimos(N,I,Facts)->factPrimos(N,I+1,Facts).

solve([FibN|Fibos])->solve(FibN, factPrimos(FibN), Fibos).

solve(FN, [P|Prim], Fibos)-> Fil = [X || X<-Fibos, X rem P > 0], 
				solve(FN, [P|Prim], Fibos, Fil =:= Fibos).

solve(FN, [P|_Prim], _Fibos, true)->{FN, P};
solve(FN, [_P|Prim], Fibos, false)->solve(FN, Prim, Fibos).

carmichael(N)->solve(lfib(N)).

dehuff([[X,[]]|[]])->{X,{},{}};
dehuff(Lista)->{nil, dehuff(fil(0, Lista)), dehuff(fil(1, Lista))}.

fil(_E,[])->[];
fil(E, [[X,[E|Cod]]|Lista] )->[[X,Cod]|fil(E, Lista)];
fil(E,[_H|T])->fil(E,T).


