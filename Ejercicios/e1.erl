	-module(e1).
-export([last/1, penultime/1, nth/2, lth/1, reverse/1, palindrome/1, flatten/1, elmConse/1, pack/1, duplicate/1]).

% #1 Find the last element of a list.
last([])->false;
last([X])->X;
last([_H|T])->last(T).

% #2 Find the last but one element of a list.
penultime([])->false;
penultime([_X])->false;
penultime([X|[_Y]])->X;
penultime([_H|T])->penultime(T).

% #3 Find the Kth element of a list.
nth([], N)->false;
nth([H|_T], 0)->H;
nth([H|T], N)->nth([H|T], N, 0).

nth([H|_T], N, N)-> H;
nth([_H|T], N, I)->nth(T, N, I+1).

% #4 Find the number of elements of a list.
lth([])->0;
lth([H|T])->1+lth(T).

% #5  Reverse a list.
reverse([])->[];
reverse([H|T])->reverse(T)++[H].

% #6 Find out whether a list is a palindrome.
palindrome([])->[];
palindrome([H|T])->[H|T] =:= reverse([H|T]).

% #7 Flatten a nested list structure.
flatten([])->[];
flatten([[H|P]|T])->flatten([H|P])++flatten(T);
flatten([H|T])->[H]++flatten(T).

% #8 Eliminate consecutive duplicates of list elements.
elmConse([])->[];
elmConse([H])->[H];
elmConse([H|[H|T]])->elmConse([H|T]);
elmConse([H|[P|T]])->[H]++elmConse([P|T]).

% #9 Pack consecutive duplicates of list elements into sublists.
pack([])->[];
pack([[]|T2])->pack(T2);
pack([[H|T]|T2])->pack([H|T])++pack(T2);
pack([H|T])->[H|pack(T)].

% #14 Duplicate the elements of a list.
duplicate([])->[];
duplicate([H])->[H]++[H];
duplicate([H|T])->[H]++[H]++duplicate(T).

