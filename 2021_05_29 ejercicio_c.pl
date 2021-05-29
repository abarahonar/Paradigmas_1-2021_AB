% Calcular el total de la lista de compra
% Como ejemplo: ["Pan", 500, 2], ["Carne", 700, 1]]
% Para probar: sum([["Pan", 500, 2], ["Carne", 700, 1]], S).
sum([], 0).
sum([[_, P, Q] | T], TOTAL):- sum(T, REST), TOTAL is REST + P * Q.
