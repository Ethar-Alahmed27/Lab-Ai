% Task 1 - Boolean Expression
% (A AND B) OR (NOT A AND NOT B)

% AND truth table
and(true, true, true).
and(true, false, false).
and(false, true, false).
and(false, false, false).

% OR truth table
or(true, true, true).
or(true, false, true).
or(false, true, true).
or(false, false, false).

% NOT truth table
neg(true, false).
neg(false, true).

% Boolean expression
boolean(A, B, Output) :-
    and(A, B, X),
    neg(A, NA),
    neg(B, NB),
    and(NA, NB, Y),
    or(X, Y, Output).