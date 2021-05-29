% Base de hechos
articulo("Pan", 500).
articulo("Carne", 700).
articulo("Leche", 1000).

% Agregar artículos a la lista que permitan incrementar cantidad de un item, sin duplicar en la lista ocurrencias del producto
% Sin funciones nativas de listas
agregar(N, [], [[N, P, 1]]):-articulo(N, P).
agregar(N, [[N, P, LQ] | T], [[N, P, NQ] | T]):- NQ is LQ + 1,!.
agregar(N, [[LN, LP, LQ] | T], [[LN, LP, LQ] | Z]):- agregar(N, T, Z).
% agregar("Pan", [], L).
% agregar("Pan", [], L), agregar("Carne", L, NL).
% agregar("Pan", [], L), agregar("Carne", L, NL), agregar("Pan", NL, NNL).

% Con funciones nativas de listas
agregarNativo(N, L, NL):-
    articulo(N, P),
    (member([N, P, Q], L) -> select([N, P, Q], L, [N, P, NQ], NL), NQ is Q + 1 ; append(L, [[N, P, 1]], NL)).
% agregarNativo("Pan", [], L).
% agregarNativo("Pan", [], L), agregarNativo("Carne", L, NL).
% agregarNativo("Pan", [], L), agregarNativo("Carne", L, NL), agregarNativo("Pan", NL, NNL).
