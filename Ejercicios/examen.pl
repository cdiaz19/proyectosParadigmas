miembro(E,[E|_T]).
miembro(E,[_H|T]):-miembro(E,T).

arista(A,B,Aristas):-miembro([A,B], Aristas).
arista(A,B,Aristas):-miembro([B,A], Aristas).

ruta(Inicio, Fin, Aristas, [Inicio,Fin]):- arista(Inicio,Fin, Aristas).
ruta(Inicio, Fin, Aristas, [Inicio|Ruta]):- ruta(Otro, Fin, Aristas, Ruta), arista(Inicio,Otro, Aristas). 



pretoin([],[]):-!.
pretoin([R,I,D], [II, R, ID]):-pretoin(I, II), pretoin(D, ID).

