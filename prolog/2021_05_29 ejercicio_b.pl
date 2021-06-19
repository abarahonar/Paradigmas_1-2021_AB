% Cambiar el enfoque del ejercicio donde en lugar de tener artículos y sus precios como parte de la base de hechos, que ahora se puedan manipular dinámicamente. Esto es, que los artículos se van creando en la medida que se necesiten sin depender de los hechos
agregar([N, P], [], [[N, P, 1]]).
agregar([N, P], [[N, P, LQ] | T], [[N, P, NQ] | T]):- NQ is LQ + 1, !.
agregar([N, P], [[LN, LP, LQ] | T], [[LN, LP, LQ] | Z]):- agregar([N, P], T, Z).
% agregar(["Pan", 500], [], L).
% agregar(["Pan", 500], [], L), agregar(["Carne", 700], L, NL).
% agregar(["Pan", 500], [], L), agregar(["Carne", 700], L, NL), agregar(["Pan", 500], NL, NNL).

% Con funciones nativas de listas
agregarNativo([N, P], L, NL):-
    member([N, P, Q], L) -> select([N, P, Q], L, [N, P, NQ], NL), NQ is Q + 1 ; append(L, [[N, P, 1]], NL).
% agregarNativo(["Pan", 500], [], L).
% agregarNativo(["Pan", 500], [], L), agregarNativo(["Carne", 700], L, NL).
% agregarNativo(["Pan", 500], [], L), agregarNativo(["Carne", 700], L, NL), agregarNativo(["Pan", 500], NL, NNL).
