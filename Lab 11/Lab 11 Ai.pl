% Lab 11

% Initial letters (must be dynamic so we can add and delete at runtime)
:- dynamic letter/1.

letter(a).
letter(b).
letter(c).


start :-
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

% ===== Menu =====
menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    do(Choice).

% ===== Handle each choice =====
% The cut (!) stops Prolog from backtracking into the
% "Invalid choice" clause after a valid choice succeeds.


do(1) :- !,
    display_letters,
    menu.


do(2) :- !,
    write('Enter the letter (end with a full stop): '),
    read(L),
    assertz(letter(L)),
    write('Letter added.'), nl,
    menu.


do(3) :- !,
    write('Enter the letter (end with a full stop): '),
    read(L),
    asserta(letter(L)),
    write('Letter added at the top.'), nl,
    menu.


do(4) :- !,
    write('Enter the letter (end with a full stop): '),
    read(L),
    assertz(letter(L)),
    write('Letter added at the bottom.'), nl,
    menu.


do(5) :- !,
    write('Enter the letter to delete (end with a full stop): '),
    read(L),
    (   retract(letter(L))
    ->  write('Letter deleted.'), nl
    ;   write('This letter is not in the set.'), nl
    ),
    menu.


do(6) :- !,
    retractall(letter(_)),
    write('All letters deleted.'), nl,
    menu.


do(7) :- !,
    write('Goodbye!'), nl.

% Any other input
do(_) :-
    write('Invalid choice, try again.'), nl,
    menu.

% ===== Display the letters =====
display_letters :-
    findall(L, letter(L), Letters),
    (   Letters == []
    ->  write('The set is empty.'), nl
    ;   write('Current letters: '), write(Letters), nl
    ).