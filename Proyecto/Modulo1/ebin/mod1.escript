#!/usr/bin/env escript

main(Args)->inets:start(),
ssl:start(),
[H|T] = Args,
 Amigo = case Args of
        [] -> "erlang";  
        [H|_] -> H
    end,
 N = case Args of
        [] -> "erlang";  
        [_|T] -> mod1:f(mod1:entero(T))
    end,
Auth = {auth,"Ln8bXKoEY60gZPQ9wj0bCynfA",
"dGTbJkUJlLNdKn2zX9iSykry8Xl3CHJ7DQwScKpFnLqkhjpEEa",
"2357424468-w2o7Vbizvy6NThaqN74DWGeYJtEMzRrGZYA1Hbp",
"ghMzTVFBq9YKVlGujPYbqP05vRZnxVtNbTDDAguu1CefR",hmac_sha1},

twittler:start(Auth),
Tw=mod1:funcion(Amigo,N),
Me = mod1:tweets_menciones(mod1:getMenciones(Tw,Amigo),N),
Hash=mod1:getHash(Tw),
TH=funciones:th(Hash,N),
mod1:guardar("textoHashtags",mod1:texto(TH)),
mod1:guardar("textoAmigo",mod1:getTexto(Tw)),
mod1:guardar("textoUsuario",mod1:getTexto(Me)).

