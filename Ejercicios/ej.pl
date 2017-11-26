% Ejercicios Prolog

% #1 Find the last element of a list.
lastt([X], X):-!.
lastt([_H|T], X) :- lastt(T, X).

% #2 Find the last but one element of a list.
pen([X,_], X):-!.
pen([_H,Y|T], X):-pen([Y|T], X).

% #3 Find the Kth element of a list.
find([], X, 0):-!.
find([X|_T], 0, X):-!.
find([_H|T], C, X):- C > 0, C1 is C - 1, find(T, X, C1).

% #4 Find the number of elements of a list.
lengthX([], 0):-!.
lengthX([X], 1):-!.
lengthX([_H|T], X):- lengthX(T, X1), X is X1+1.

% Programa que concatena dos listas
conca([],L,L):-!.
conca([H|T], L, [H|TL]):-conca(T,L,TL).

% #5 Reverse a list.
rever([],[]):-!.
rever([H|T],R):- rever(T, RT), append(RT, [H], R).

% #6 Find out whether a list is a palindrome.
palidrome([],[]):-!.
palindrome(L):-rever(L,L).

% #7 Flatten a nested list structure.
flatten([],[]):-!.
flatten(X,[X]):- \+ is_list(X).
flatten([H|T], X):-flatten(H,Y), flatten(Xs, Ys), append(Y,Ys, X).

% #8 Eliminate consecutive duplicates of list elements.
compress([],[]):-!.
compress([X],[X]):-!.
compress([X,X|T], Z):- compress([X|T], Z).
compress([X,Y|T], [X|Z]):- X \= Y, compress([Y|T], Z).

% #9 Pack consecutive duplicates of list elements into sublists.
packs([],[]).
packs([X|Xs],[Z|Zs]) :- packss(X,Xs,Ys,Z), packs(Ys,Zs).

packss(X,[],[],[X]).
packss(X,[Y|Ys],[Y|Ys],[X]) :- X \= Y.
packss(X,[X|Xs],Ys,[X|Zs]) :- packss(X,Xs,Ys,Zs).

% #10 Run-length encoding of a list.
encode([],[]):-!.
encode(L1,L2):-packs(L1,L), encoding(L,L2),!.

encoding([],[]):-!.
encoding([[X|Xs]|Ys],[[N,X]|Zs]):- length([X|Xs], N), encoding(Ys, Zs).

% #19 Rotate a list N places to the left.
rotate([H|T], 1, X) :-append(T, [H], X), !.
rotate([H|T],N,X) :-append(T, [H], Y),N1 is N - 1,rotate(Y, N1, X).

% #20 Remove the K'th element from a list.
removeAt([],X,Pos,[]):-!.
removeAt([X|T],X, 1, T):-!.
removeAt([H|T],X, Pos, [H|Ys]):- Pos1 is Pos-1, removeAt(T, X, Pos1, Ys).

% #21 Insert an element at a given position into a list.
insertAt([],nil,Pos,[]):-!.
insertAt([Y|T], X, 1, [X, Y|T]):-!.
insertAt([H|T], X, Pos, [H|Ys]):- Pos1 is Pos-1, insertAt(T, X, Pos1, Ys).

% #22 Create a list containing all integers within a given range
range(nil,nil,[]):-!.
range(X,Y,[Y]):- X == Y.
range(X,Y,[X|Xs]):-X1 is X+1, range(X1, Y, Xs), !.

% #23 Lotto: Draw N different random numbers from the set 1..M.
rnd_select(nil,nil,[]):-!.
rnd_select(X,1,[R]):- random(1,X,R).
rnd_select(X,Tam,[R|Ys]):- random(1,X,R), Tam1 is Tam-1, rnd_select(X,Tam1,Ys), !.

% Aritmeticos
% #31 Determine whether a given integer number is prime.
isPrime(2):-!.
isPrime(3):-!.
isPrime(X):- X > 3, X mod 2 =\= 0, \+ is_prime(X,3).  
is_prime(Num,L):- Num mod L =:= 0.
is_prime(Num,L):- L * L < Num, L2 is L + 2, is_prime(Num,L2).

% #32 Determine the greatest common divisor of two positive integer number. 
gcd(X,0,X):- X > 0.
gcd(X,Y,G):- Y > 0, Z is X mod Y, gcd(Y,Z,G).

% #33 Determine whether two positive integer numbers are coprime.
coprime(0,0):-!.
coprime(X,Y):-gcd(X,Y,1).

% Arboles.

% #54 Check whether a given term represents a binary tree
binary_tree(nil):-!.
binary_tree([_R, I,D]):- binary_tree(I), binary_tree(D).

% #55 Insert number in BST
bst([], X, [X,[],[]]):-!.
bst([R,HI,HD], X, [R,HI2,HD]):- X < R, bst(HI,X,HI2), !.
bst([R,HI,HD], X, [R,HI,HD2]):- X > R, bst(HD,X,HD2), !.

% #56 Symmetric binary trees
symmetric([]).
symmetric([_R,I,D]) :- symmetricAux(I,D).

symmetricAux([],[]).
symmetricAux([_R,I1,D1],[_R,I2,D2]) :- symmetricAux(I1,D2), symmetricAux(I1,D2). 

% #57 PreOrden RID
pre([],[]):-!.
pre([R,HI,HD],[R|Pre]):-pre(HI,PreI),pre(HD,PreD), append(PreI,PreD,Pre), !.

% #58 InOrden IRD
inorden([],[]):-!.
inorden([R,HI,HD], iorden):- append(IHI, [R|IHD], iorden), inorden(HI, IHI),
			     inorden(HD, IHD).
% #59 PostOrden IDR
postorden([],[]):-!.
postorden([R,I,D], Post):-
		postorden(I, PosI),
		postorden(D, PosD),
		append(PosD, [R], PosDR),
		append(PosI, PosDR, Post).

queens_1(N,Qs) :- range(1,N,Rs), permu(Rs,Qs), test(Qs).

range(A,A,[A]).
range(A,B,[A|L]) :- A < B, A1 is A+1, range(A1,B,L).

permu([],[]).
permu(Qs,[Y|Ys]) :- del(Y,Qs,Rs), permu(Rs,Ys).

del(X,[X|Xs],Xs).
del(X,[Y|Ys],[Y|Zs]) :- del(X,Ys,Zs).

test(Qs) :- test(Qs,1,[],[]).

test([],_,_,_).
test([Y|Ys],X,Cs,Ds) :- 
	C is X-Y, \+ memberchk(C,Cs),
	D is X+Y, \+ memberchk(D,Ds),
	X1 is X + 1,
	test(Ys,X1,[C|Cs],[D|Ds]).











