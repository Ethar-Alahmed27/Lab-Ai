
% Lab 5 - Task 1
% Simpsons Family Tree

% ===== Male Facts =====
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% ===== Female Facts =====
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% ===== Parent Facts =====

% Abraham and Mona's children
parent(abraham, herb).
parent(mona, herb).
parent(abraham, homer).
parent(mona, homer).

% Clancy and Jackie's children
parent(clancy, marge).
parent(jackie, marge).
parent(clancy, patty).
parent(jackie, patty).
parent(clancy, selma).
parent(jackie, selma).

% Homer and Marge's children
parent(homer, bart).
parent(marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).

% Selma's daughter
parent(selma, ling).

% ===== Rules =====

% 1. Father
father(X, Y) :-
    parent(X, Y),
    male(X).

% 2. Mother
mother(X, Y) :-
    parent(X, Y),
    female(X).

% 3. Son
son(X, Y) :-
    parent(Y, X),
    male(X).

% 4. Daughter
daughter(X, Y) :-
    parent(Y, X),
    female(X).

% 5. Brother
brother(X, Y) :-
    male(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

% 6. Sister
sister(X, Y) :-
    female(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

% 7. Grandfather
grandfather(X, Y) :-
    male(X),
    parent(X, Z),
    parent(Z, Y).

% 8. Aunt
aunt(X, Y) :-
    sister(X, P),
    parent(P, Y).

% 9. Uncle
uncle(X, Y) :-
    brother(X, P),
    parent(P, Y).

% 10. Cousin
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    P1 \= P2,
    parent(G, P1),
    parent(G, P2),
    X \= Y.

% 11. Ancestor
ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).
