-module(mod1).
-export([entero/1,funcion/2,tweets_menciones/2,getTexto/1,getMenciones/1,getHash/1,th/2,texto/1,getUrls/1]).

flatten([])->[];
flatten([[H|P]|T])-> flatten([H|P])++flatten(T);
flatten([H|T])->[H]++flatten(T).

hashtags(L)->[texto(Y)||{hashtags,Y}<-L].

user(L)->[Y|| {screen_name,Y}<-L].
urls(L)->[Y|| {urls,Y}<-L].

texto(L)->[binary_to_list(Y)|| {text,Y}<-L].

getMencionesL(L)->[Y||{user_mentions,Y}<-getEntities(L)].
getUrlsL(L)->[Y||{urls,Y}<-getEntities(L)].
getHashL(L)->[Y||{hashtags,Y}<-getEntities(L)].


entities(L)->[Y||{entities,Y}<-L].
getEntitiesL(L)->[entities(Y)||Y<-L].
getEntities(L)-> flatten(getEntitiesL(L)).

getTexto(L)->[texto(Y)||Y<-L].
getMenciones(L)-> [binary_to_list(Y)||{screen_name,Y}<-remove_dups(flatten(getMencionesL(L))) ].
getMenciones(L,U)->lists:delete(U,getMenciones(L)).
getUrls(L)-> [binary_to_list(Y)||{url,Y}<-flatten(getUrlsL(L)) ].
getHash(L)->[binary_to_list(Y)||{text,Y}<-flatten(getHashL(L)) ].

remove_dups([])    -> [];
remove_dups([H|T]) -> [H | [X || X <- remove_dups(T), X /= H]].

f([H|_T])->string:to_integer(H).

statuses(L)->[Y||{statuses,Y}<-L].
funcion(Amigo,N)->twittler:timeline(user,[{"screen_name",Amigo},{"count", N}]).

tweets_menciones([H|T],N)->twittler:timeline(user,[{"screen_name",H},{"count", N}])++tweets_menciones(T,N);
tweets_menciones([],_N)->[].

tweets_hashtag([H|T],N)->twittler:search(string:concat("#",H),[{count,N}])++tweets_hashtag(T,N);
tweets_hashtag([],_N)->[].


th([],_)->[];
th(L,N)->flatten(statuses(tweets_hashtag(L,N))).

entero({N,_X})->f(N).

guardar(File, Terminos)-> case file:open(File, write) of
{ok,Fd}->
lists:foreach(fun(Termino)->io:format(Fd, "~s.~n" , [Termino])end, Terminos),
file:close(Fd),
{ok};
{error,Motivo}->
	{error,Motivo}
end.
