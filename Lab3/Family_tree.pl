% =========================================================
% Genders 
% =========================================================
male(hisham).
male(rakan).
male(salman).
male(ahmed).

female(wasan).
female(shaden).
female(lina).
female(nora).

% =========================================================
% Parents
% =========================================================

parent(hisham, rakan).
parent(hisham, shaden).
parent(hisham, salman).
parent(hisham, lina).

parent(wasan, rakan).
parent(wasan, shaden).
parent(wasan, salman).
parent(wasan, lina).


parent(salman, ahmed).
parent(salman, nora).

% =========================================================
% Rules
% =========================================================


father(X, Y) :- 
    parent(X, Y), 
    male(X).


mother(X, Y) :- 
    parent(X, Y), 
    female(X).


brother(X, Y) :- 
    parent(P, X), 
    parent(P, Y), 
    male(X), 
    X \= Y.


sister(X, Y) :- 
    parent(P, X), 
    parent(P, Y), 
    female(X), 
    X \= Y.
